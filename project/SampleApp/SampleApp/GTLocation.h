//
//  GTLocation.h
//  SampleApp
//
//  Created by QTT on 2021/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// App中统一的位置信息管理
@interface GTLocation : NSObject
+(GTLocation *)locationManager;
-(void)checkLocationAuthorization;
@end

NS_ASSUME_NONNULL_END
