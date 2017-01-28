//
// RedditPostTableViewCell.m
// EtermaxExam
//
// Created by Julian Centurion on 27/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import "RedditPostTableViewCell.h"

@interface RedditPostTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;
@property (weak, nonatomic) IBOutlet UILabel *subreditLabel;

@end

@implementation RedditPostTableViewCell

- (void)setUpCellWithModel:(RedditPostModel *)model
{
	self.titleLabel.text = model.title;
	self.dateLabel.text = model.date;
	self.usernameLabel.text = model.author;
	self.commentsLabel.text = [NSString stringWithFormat:@"Comments: %@", model.comentsQuantity];
	self.subreditLabel.text = [NSString stringWithFormat:@"/r/%@", model.subreddit];
	self.thumbnailView.image = model.thumbnail;
}

@end
