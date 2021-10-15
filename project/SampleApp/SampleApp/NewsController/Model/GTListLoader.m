//
//  GTListLoader.m
//  SampleApp
//
//  Created by QTT on 2021/10/14.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListItem.h"

@implementation GTListLoader

- (void)loadListDataWithFinishBlock:(GTListLoaderFinshBlock)finishBlock{
    //    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    //        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //        }];
    
    
    // 有上回的数据就展示上回的数据; 然后继续请求新数据
    NSArray<GTListItem *> *listData = [self _readDataFromLocal];
    if (listData) {
        finishBlock(YES, listData);
    }

    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=&page=&page_size=&is_filter=&key=02aa4ab5506caeca816413346ed7f24f";
    // 去掉不使用的警告
    __unused NSURL *listURL = [NSURL URLWithString:urlString];
    
    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    NSURLSession *session = [NSURLSession sharedSession];
    
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(self) strongSelf = weakSelf;
        
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
#warning 类型的检查
        NSArray *dataArray = [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"] ;
        NSMutableArray *listItemArray = @[].mutableCopy;
        for(NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        
        [weakSelf _archiveListDataWithArray:listItemArray.copy];
        
        // 希望所有的回包都是在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
    }];
    [dataTask resume];
}
#pragma mark - private method
- (NSArray<GTListItem *> *)_readDataFromLocal {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSData *readListData = [fileManager contentsAtPath:listDataPath];
    
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [GTListItem class], nil] fromData:readListData error:nil];
    if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
        return (NSArray<GTListItem *> *)unarchiveObj;
    }
    return nil;
        
}

- (void) _archiveListDataWithArray:(NSArray<GTListItem *> *)array {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    
    // 创建文件
//    NSData *listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    
    //序列化
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    // 反序列化
//    NSData *readListData = [fileManager contentsAtPath:listDataPath];
//    __unused id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [GTListItem class], nil] fromData:readListData error:nil];
    
//    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
//    NSData *testListData = [[NSUserDefaults standardUserDefaults] dataForKey:@"listData"];
//    id unarchiveObj2 = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [GTListItem class], nil] fromData:testListData error:nil];
    
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    
    // 删除
//    if (fileExist) {
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    [fileHandler synchronizeFile];
//    [fileHandler closeFile];
    NSLog(@"");
}

@end
