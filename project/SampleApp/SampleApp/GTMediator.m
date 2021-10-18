//
//  GTMediator.m
//  SampleApp
//
//  Created by QTT on 2021/10/15.
//

#import "GTMediator.h"

@implementation GTMediator

// 这只是最基础的Target action的介绍，代码层面的优化，例如将这种写成category的方式进行扩展
// 使用Target Action的精髓，采用runtime的机制来反射到类
+ (__kindof UIViewController*)detailViewControllerWithUrl:(NSString *)detailUrl{
    Class detailCls = NSClassFromString(@"GTDetailViewController"); //反射出Target
    // Target执行一个Selector, Selector也通过反射，这样只通过字符串，没有类的引用，实现了完全的解耦
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:detailUrl];
    return controller;
}

#pragma mark -
// 内部维护一个scheme的跳转表
+ (NSMutableDictionary *)mediatorCache {
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}
+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock{
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params{
    GTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

@end
