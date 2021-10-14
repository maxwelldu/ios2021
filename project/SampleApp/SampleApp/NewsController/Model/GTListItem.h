//
//  GTListItem.h
//  SampleApp
//
//  Created by QTT on 2021/10/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// 列表结构化数据
@interface GTListItem : NSObject<NSSecureCoding>

@property(nonatomic,copy,readwrite) NSString *category;
@property(nonatomic,copy,readwrite) NSString *picUrl;
@property(nonatomic,copy,readwrite) NSString *uniqueKey;
@property(nonatomic,copy,readwrite) NSString *title;
@property(nonatomic,copy,readwrite) NSString *date;
@property(nonatomic,copy,readwrite) NSString *authorName;
@property(nonatomic,copy,readwrite) NSString *articleUrl;

- (void) configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
