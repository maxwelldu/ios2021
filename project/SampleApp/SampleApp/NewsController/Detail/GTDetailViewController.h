//
//  GTDetailViewController.h
//  SampleApp
//
//  Created by QTT on 2021/10/13.
//

#import <UIKit/UIKit.h>
#import "GTMediator.h"

NS_ASSUME_NONNULL_BEGIN


/// 文章详情页
@interface GTDetailViewController : UIViewController<GTDetailViewControllerProtocol>

- (instancetype)initWithUrlString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
