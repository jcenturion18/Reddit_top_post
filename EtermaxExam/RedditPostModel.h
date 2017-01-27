//
// RedditPostModel.h
// EtermaxExam
//
// Created by Julian Centurion on 26/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface RedditPostModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *thumbnailURL;
@property (nonatomic, copy) NSString *subreddit;
@property (nonatomic, strong) NSNumber *comentsQuantity;
@property (nonatomic, strong) UIImage *thumbnail;

@end
