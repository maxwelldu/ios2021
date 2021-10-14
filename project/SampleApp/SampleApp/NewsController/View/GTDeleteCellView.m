//
//  GTDeleteCellView.m
//  SampleApp
//
//  Created by QTT on 2021/10/14.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView ()

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, copy, readwrite) dispatch_block_t deleteBlock;

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
			_deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
			[_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
			_deleteButton.backgroundColor = [UIColor blueColor];
			_deleteButton;
		})];
	}
	return self;
}

// 此组件是独立的组件，将其放到window上面
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock {
	// 设置展示的位置从点击的当前位置开始
	_deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
	_deleteBlock = [clickBlock copy];

	[[UIApplication sharedApplication].keyWindow addSubview:self];
	// 最简单的动画
//    [UIView animateWithDuration:1.f animations:^{
//        self.deleteButton.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height-200)/2, 200, 200);
//    }];

	// 相对较为复杂的
	[UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
	         self.deleteButton.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height-200)/2, 200, 200);
	 } completion:^(BOOL finished){
	         NSLog(@"");
	 }];
}


- (void)dismissDeleteView {
	[self removeFromSuperview];
}

- (void)_clickButton {
	if (_deleteBlock) {
		_deleteBlock();
	}
	[self removeFromSuperview];
}

@end
