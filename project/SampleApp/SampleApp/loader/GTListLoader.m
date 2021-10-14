//
//  GTListLoader.m
//  SampleApp
//
//  Created by QTT on 2021/10/14.
//

#import "GTListLoader.h"
#import <AFNetworking.h>

@implementation GTListLoader

- (void)loadListData{
    NSString *urlString = @"http://is.snssdk.com/api/news/feed/v51/";
    // 去掉不使用的警告
    __unused NSURL *listURL = [NSURL URLWithString:urlString];
    
//    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        }];
    
    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSLog(@"");
    }];
    [dataTask resume];
}

@end
