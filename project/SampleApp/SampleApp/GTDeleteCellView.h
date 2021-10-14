//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by QTT on 2021/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
@end

NS_ASSUME_NONNULL_END
