//
// RedditPostModelHandler.m
// EtermaxExam
//
// Created by Julian Centurion on 27/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NSDictionary+Null.h"

#import "RedditPostModel.h"
#import "RedditPostModelHandler.h"
#import "RestClient/SimpleRestClient.h"

@interface RedditPostModelHandler ()
@property (nonatomic, strong) SimpleRestClient *restClient;
@end

@implementation RedditPostModelHandler
- (NSArray *)createArrayWithDictionary:(NSDictionary *)dictionary
{
	NSMutableArray *array = [NSMutableArray new];

	self.restClient = [SimpleRestClient new];

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

	__weak RedditPostModel *weakModel = model;

	[self.restClient downloadPictureFromURL:model.thumbnailURL withSuccessBlock: ^(id responseObject) {
	    weakModel.thumbnail = responseObject;
	} andFailBlock: ^(NSError *error) {
	    NSLog(@"");
	}];

	return model;
}

@end
