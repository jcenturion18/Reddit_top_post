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
#import "PersistDataHandler.h"

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
	model.postId = [dictionary ns_objectForKey:@"id"];
	model.date = [self createDateWithTimestamp:[dictionary ns_objectForKey:@"created_utc"]];
	model.thumbnailURL = [dictionary ns_objectForKey:@"thumbnail"];
	model.subreddit = [dictionary ns_objectForKey:@"subreddit"];
	model.comentsQuantity = [dictionary ns_objectForKey:@"num_comments"];

	__weak RedditPostModel *weakModel = model;

	[self.restClient downloadPictureFromURL:model.thumbnailURL withSuccessBlock: ^(id responseObject) {
	    weakModel.thumbnail = responseObject;
	    PersistDataHandler *persist = [PersistDataHandler new];

	    [persist saveThumbnail:weakModel.thumbnail withPostId:weakModel.postId];

	    [[NSNotificationCenter defaultCenter] postNotificationName:@"must_reload_table_data" object:nil];
	} andFailBlock: ^(NSError *error) {
	    weakModel.thumbnail = nil;
	}];

	return model;
}

- (NSString *)createDateWithTimestamp:(NSNumber *)timestamp
{
	NSTimeInterval timeInterval = [timestamp doubleValue];
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];

	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"dd.MM.yy 'at' HH:mm"];

	return [formatter stringFromDate:date];
}

@end
