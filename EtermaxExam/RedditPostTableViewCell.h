//
// RedditPostTableViewCell.h
// EtermaxExam
//
// Created by Julian Centurion on 27/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RedditPostModel.h"

@interface RedditPostTableViewCell : UITableViewCell

- (void)setUpCellWithModel:(RedditPostModel *)model;

@end
