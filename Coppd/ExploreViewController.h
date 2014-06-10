//
//  ExploreViewController.h
//  Coppd
//
//  Created by Vik Denic on 6/9/14.
//  Copyright (c) 2014 Aaron & Vik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExploreViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISearchBar *exploreSearchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *exploreCollectionView;

@end
