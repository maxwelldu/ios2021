//
//  GTMediator.m
//  SampleApp
//
//  Created by QTT on 2021/10/15.
//

#import "GTMediator.h"
#import "GTDetailViewController.h"

@implementation GTMediator

+ (__kindof UIViewController*)detailViewControllerWithUrl:(NSString *)detailUrl{
    GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlString:detailUrl];
    return controller;
}

@end
