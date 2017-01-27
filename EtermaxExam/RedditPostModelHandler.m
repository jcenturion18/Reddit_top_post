//
// RedditPostModelHandler.m
// EtermaxExam
//
// Created by Julian Centurion on 27/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NSDictionary+Null.h"

#import "RedditPostModelHandler.h"
#import "RedditPostModel.h"

@implementation RedditPostModelHandler
- (NSArray *)createArrayWithDictionary:(NSDictionary *)dictionary
{
	NSMutableArray *array = [NSMutableArray new];

	NSDictionary *children = [[dictionary ns_objectForKey:@"data"] ns_objectForKey:@"children"];

	for (NSDictionary *child in children) {
		NSDictionary *childData = [child ns_objectForKey:@"data"];

		[array addObject:[self createPostModelWithDictionary:childData]];
	}

	return [NSArray arrayWithArray:array];
}

- (RedditPostModel *)createPostModelWithDictionary:(NSDictionary *)dictionary
{
	RedditPostModel *model = [RedditPostModel new];

	model.title = [dictionary ns_objectForKey:@"title"];
	model.author = [dictionary ns_objectForKey:@"author"];

	model.date = [dictionary ns_objectForKey:@"title"];
	model.thumbnailURL = [dictionary ns_objectForKey:@"thumbnail"];
	model.subreddit = [dictionary ns_objectForKey:@"subreddit"];
	model.comentsQuantity = [dictionary ns_objectForKey:@"num_comments"];
// @property (nonatomic, strong) UIImage *thumbnail;

	return model;
}

@end
