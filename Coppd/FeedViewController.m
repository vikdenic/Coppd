//
//  FeedViewController.m
//  Coppd
//
//  Created by Vik Denic on 6/9/14.
//  Copyright (c) 2014 Aaron & Vik. All rights reserved.
//

#import "FeedViewController.h"
#import "FeedCustomTableViewCell.h"
#import <Parse/Parse.h>

//UITableViewDelegate, UITableViewDataSource,
@interface FeedViewController () <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (nonatomic,strong) PFLogInViewController *loginViewController;
@property (nonatomic, strong) PFSignUpViewController *signUpViewController;

@end

@implementation FeedViewController

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [logInController dismissViewControllerAnimated:YES completion:nil];
    //query for data and reload tableview
}

-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [signUpController dismissViewControllerAnimated:YES completion:nil];

}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [PFUser logOut];


}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (![PFUser currentUser]) {
        self.loginViewController = [[PFLogInViewController alloc] init];
        self.signUpViewController = [[PFSignUpViewController alloc] init];

        self.loginViewController.delegate = self;
        self.signUpViewController.delegate = self;

        self.loginViewController.signUpController = self.signUpViewController;
        [self presentViewController:self.loginViewController animated:NO  completion:nil];
    }
    else {
        [self retrieveFromParse];
    }

}
-(void)retrieveFromParse
{
    PFQuery *retrievePhotos = [PFQuery queryWithClassName:@"Photo"];

    [retrievePhotos findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        self.photosArray = [[NSArray alloc] initWithArray:objects];

        //[self.feedTableView reloadData];
    }];

}

#pragma mark - Delegates

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.photosArray.count;
}





-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeedCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell"];

PFObject *testPhoto = [self.photosArray objectAtIndex:indexPath.row];
PFFile *testImage = [testPhoto objectForKey:@"image"];

//    if (!cell) {
//        cell = [[FeedCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"FeedCell"];
//    }

    //cell.sneakerImageView.image = object[@"image"];

    [testImage getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
    UIImage *tempImage = [UIImage imageWithData:data];
        cell.sneakerImageView.image = tempImage;
    }];
    return cell;
}

//Dismiss keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}



- (IBAction)likeButtonPressed:(UIButton *)sender
{

    
}



@end
