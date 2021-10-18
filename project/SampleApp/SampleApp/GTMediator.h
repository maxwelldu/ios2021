//
//  GTMediator.h
//  SampleApp
//
//  Created by QTT on 2021/10/15.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTDetailViewControllerProtocol <NSObject>

- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end


/// Target 的模式对不同的类进行解耦；将此类作为中转类
@interface GTMediator : NSObject

//第一种：target action
+ (__kindof UIViewController*)detailViewControllerWithUrl:(NSString *)detailUrl;

//第二种：urlscheme
typedef void(^GTMediatorProcessBlock)(NSDictionary *params);
+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

// protocol class; 解决硬编码，不过还没有前两种简单; 和urlsche类似
+ (void)registerProtol:(Protocol *)proto class:(Class)cls;
+ (Class)classForProtol:(Protocol *)proto;

@end

NS_ASSUME_NONNULL_END
