//
//  GTListLoader.h
//  SampleApp
//
//  Created by QTT on 2021/10/14.
//

#import <Foundation/Foundation.h>

// 声明文件，在使用的时候进行引入即可
@class GTListItem;

NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinshBlock)(BOOL success, NSArray<GTListItem *> *dataArray);


/// 列表请求
@interface GTListLoader : NSObject

- (void)loadListDataWithFinishBlock:(GTListLoaderFinshBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
