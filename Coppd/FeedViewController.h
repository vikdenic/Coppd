//
//  FeedViewController.h
//  Coppd
//
//  Created by Vik Denic on 6/9/14.
//  Copyright (c) 2014 Aaron & Vik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedCustomTableViewCell.h"
#import <Parse/Parse.h>

@interface FeedViewController : UIViewController

//@property (weak, nonatomic) IBOutlet UITableView *feedTableView;


@property (strong, nonatomic) NSArray *photosArray;

@end
