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

#pragma Constraints
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thumbnailHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thumbnailWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thumbnailLeadingSpace;

@end

@implementation RedditPostTableViewCell

- (void)setUpCellWithModel:(RedditPostModel *)model
{
	self.titleLabel.text = model.title;
	self.dateLabel.text = model.date;
	self.usernameLabel.text = model.author;
	self.commentsLabel.text = [NSString stringWithFormat:@"Comments: %@", model.comentsQuantity];
	self.subreditLabel.text = [NSString stringWithFormat:@"/r/%@", model.subreddit];

	if (model.thumbnail) {
		self.thumbnailView.image = model.thumbnail;

		self.thumbnailLeadingSpace.constant = 8;
		self.thumbnailWidthConstraint.constant = 86;
		self.thumbnailHeightConstraint.constant = 86;

		[UIView animateWithDuration:0.2
		                 animations: ^{
		    [self.contentView layoutIfNeeded];              // Called on parent view
		}];
	}
}

@end
