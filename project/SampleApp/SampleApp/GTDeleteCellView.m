//
//  GTDeleteCellView.m
//  SampleApp
//
//  Created by QTT on 2021/10/14.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView()

@property(nonatomic, strong, readwrite)UIView *backgroundView;
@property(nonatomic, strong, readwrite)UIButton *deleteButton;


@end

@implementation GTDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            [_backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
                tapGesture;
            })];
            _backgroundView;
        })];
        
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }
    return self;
}

// 此组件是独立的组件，将其放到window上面
- (void)showDeleteView {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)dismissDeleteView {
    [self removeFromSuperview];
}

- (void)_clickButton {
    [self removeFromSuperview];
}

@end
