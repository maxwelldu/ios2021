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
    
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=&page=&page_size=&is_filter=&key=02aa4ab5506caeca816413346ed7f24f";
    // 去掉不使用的警告
    __unused NSURL *listURL = [NSURL URLWithString:urlString];
    
    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
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
        
        // 希望所有的回包都是在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
    }];
    [dataTask resume];
    
    [self _getSandBoxPath];
}

- (void) _getSandBoxPath {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"");
}

@end
