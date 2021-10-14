//
//  GTListItem.m
//  SampleApp
//
//  Created by QTT on 2021/10/14.
//

#import "GTListItem.h"

@implementation GTListItem

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.category = [coder decodeObjectForKey:@"category"];
        self.picUrl = [coder decodeObjectForKey:@"picUrl"];
        self.uniqueKey = [coder decodeObjectForKey:@"uniqueKey"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.date = [coder decodeObjectForKey:@"date"];
        self.authorName = [coder decodeObjectForKey:@"author_name"];
        self.articleUrl = [coder decodeObjectForKey:@"url"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.picUrl forKey:@"picUrl"];
    [coder encodeObject:self.uniqueKey forKey:@"uniqueKey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.authorName forKey:@"authorName"];
    [coder encodeObject:self.articleUrl forKey:@"articleUrl"];
}

#pragma mark - NSSecureCoding
+ (BOOL)supportsSecureCoding {
    return YES;
}

#pragma mark - public method
- (void) configWithDictionary:(NSDictionary *)dictionary {

#warning 类型是否匹配在具体开发的时候要进行容错保证
	self.category = [dictionary objectForKey:@"category"];
	self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
	self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
	self.title = [dictionary objectForKey:@"title"];
	self.date = [dictionary objectForKey:@"date"];
	self.authorName = [dictionary objectForKey:@"author_name"];
	self.articleUrl = [dictionary objectForKey:@"url"];
}

@end
