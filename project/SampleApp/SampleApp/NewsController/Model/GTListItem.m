//
//  GTListItem.m
//  SampleApp
//
//  Created by QTT on 2021/10/14.
//

#import "GTListItem.h"

@implementation GTListItem

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
