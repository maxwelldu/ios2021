//
//  GTLocation.m
//  SampleApp
//
//  Created by QTT on 2021/10/19.
//

#import "GTLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface GTLocation()<CLLocationManagerDelegate>
@property(nonatomic,strong,readwrite)CLLocationManager *manager;
@end

@implementation GTLocation

+(GTLocation *)locationManager {
    static GTLocation *locationManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locationManager = [[GTLocation alloc] init];
    });
    return locationManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
    }
    return self;
}
-(void)checkLocationAuthorization {
    //判断系统是否开启
    if (![CLLocationManager locationServicesEnabled]) {
        // 引导弹窗
        //
    }
    
    // 只在第一次进行引导
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.manager requestWhenInUseAuthorization];
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        //
    } else if (status == kCLAuthorizationStatusDenied) {
        //
    }
}
@end
