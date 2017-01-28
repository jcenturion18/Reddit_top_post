//
// PersistDataHandler.m
// EtermaxExam
//
// Created by Julian Centurion on 28/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import "PersistDataHandler.h"
#import "RedditPostModel.h"
#import "NSDictionary+Null.h"

static NSString *const kSaveDictionaryKey = @"RespondeDictionary";

@implementation PersistDataHandler

- (void)saveRedditPostModelList:(NSArray *)list
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];

	NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
	[standardUserDefaults removePersistentDomainForName:appDomain];

	NSMutableArray *dataToSave = [NSMutableArray new];

	for (RedditPostModel *model in list) {
		[dataToSave addObject:[model dictionaryWithModel]];
	}

	[standardUserDefaults setObject:dataToSave forKey:kSaveDictionaryKey];
	[standardUserDefaults synchronize];
}

- (NSArray *)loadRedditPostModelList
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	NSMutableArray *list = [NSMutableArray new];

	NSArray *saveData = [standardUserDefaults objectForKey:kSaveDictionaryKey];

	for (NSDictionary *model in saveData) {
		NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:[model ns_objectForKey:@"postId"]];
		UIImage *thumbnail = [UIImage imageWithData:imageData];

		RedditPostModel *postModel = [RedditPostModel createModelWithDictionary:model andThumbnail:thumbnail];
		[list addObject:postModel];
	}

	return [NSArray arrayWithArray:list];
}

- (void)saveThumbnail:(UIImage *)thumbnail withPostId:(NSString *)postId
{
	[[NSUserDefaults standardUserDefaults] setObject:UIImagePNGRepresentation(thumbnail) forKey:postId];
}

@end
