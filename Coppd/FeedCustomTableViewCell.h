//
//  FeedCustomTableViewCell.h
//  Coppd
//
//  Created by Vik Denic on 6/9/14.
//  Copyright (c) 2014 Aaron & Vik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedCustomTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;

@property (strong, nonatomic) IBOutlet UIButton *usernameButton;

@property (strong, nonatomic) IBOutlet UIImageView *sneakerImageView;

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) IBOutlet UITextView *likesTextView;

@property (strong, nonatomic) IBOutlet UITextView *commentsTextView;

@property (strong, nonatomic) IBOutlet UIButton *likeButton;

@property (strong, nonatomic) IBOutlet UIButton *commentButton;

@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;

@end
