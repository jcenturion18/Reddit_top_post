//
// PersistDataHandler.h
// EtermaxExam
//
// Created by Julian Centurion on 28/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PersistDataHandler : NSObject

- (void)saveRedditPostModelList:(NSArray *)list;
- (NSArray *)loadRedditPostModelList;
- (void)saveThumbnail:(UIImage *)thumbnail withPostId:(NSString *)postId;
@end
