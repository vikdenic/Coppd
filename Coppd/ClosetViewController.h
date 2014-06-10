//
//  ClosetViewController.h
//  Coppd
//
//  Created by Vik Denic on 6/9/14.
//  Copyright (c) 2014 Aaron & Vik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClosetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingNumberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *closetAvatarImage;
@property (weak, nonatomic) IBOutlet UICollectionView *closetCollectionView;
@end
