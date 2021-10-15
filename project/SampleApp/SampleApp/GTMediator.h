//
//  GTMediator.h
//  SampleApp
//
//  Created by QTT on 2021/10/15.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// Target 的模式对不同的类进行解耦；将此类作为中转类
@interface GTMediator : NSObject

+ (__kindof UIViewController*)detailViewControllerWithUrl:(NSString *)detailUrl;

@end

NS_ASSUME_NONNULL_END
