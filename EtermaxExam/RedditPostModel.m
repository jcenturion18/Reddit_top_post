//
// RedditPostModel.m
// EtermaxExam
//
// Created by Julian Centurion on 26/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import "NSDictionary+Null.h"

#import "RedditPostModel.h"

@implementation RedditPostModel

+ (RedditPostModel *)createModelWithDictionary:(NSDictionary *)dictionary andThumbnail:(UIImage *)thumbnail
{
	RedditPostModel *model = nil;

	if (dictionary) {
		model = [RedditPostModel new];
		model.title = [dictionary ns_objectForKey:@"title"];
		model.author = [dictionary ns_objectForKey:@"author"];
		model.date = [dictionary ns_objectForKey:@"date"];
		model.thumbnailURL = [dictionary ns_objectForKey:@"thumbnailURL"];
		model.comentsQuantity = [dictionary ns_objectForKey:@"comentsQuantity"];
		model.postId = [dictionary ns_objectForKey:@"postId"];
		model.subreddit = [dictionary ns_objectForKey:@"subreddit"];
		if (thumbnail) {
			model.thumbnail = thumbnail;
		}
	}

	return model;
}

- (NSDictionary *)dictionaryWithModel
{
	NSMutableDictionary *dict = [NSMutableDictionary new];

	dict[@"title"] = self.title;
	dict[@"author"] = self.author;
	dict[@"date"] = self.date;
	dict[@"thumbnailURL"] = self.thumbnailURL;
	dict[@"subreddit"] = self.subreddit;
	dict[@"comentsQuantity"] = self.comentsQuantity;
	dict[@"postId"] = self.postId;

	return [NSDictionary dictionaryWithDictionary:dict];
}

@end
