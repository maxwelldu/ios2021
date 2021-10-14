//
//  GTListLoader.m
//  SampleApp
//
//  Created by QTT on 2021/10/14.
//

#import "GTListLoader.h"

@implementation GTListLoader

- (void)loadListData{
    NSString *urlString = @"http://is.snssdk.com/api/news/feed/v51/";
    // 去掉不使用的警告
    __unused NSURL *listURL = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
    [dataTask resume];
}

@end
