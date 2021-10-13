//
//  ViewController.m
//  SampleApp
//
//  Created by QTT on 2021/10/13.
//

#import "ViewController.h"

@interface TestView : UIView

@end

@implementation TestView

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
//1
- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
}
//2
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
}
//3
- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
}
//4
- (void)didMoveToWindow {
    [super didMoveToWindow];
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    TestView *view = [[TestView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(150, 150, 100, 100);
    [self.view addSubview:view];
    
//    UIView *view2 = [[UIView alloc] init];
//    view2.backgroundColor = [UIColor greenColor];
//    view2.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:view2];
}


@end
