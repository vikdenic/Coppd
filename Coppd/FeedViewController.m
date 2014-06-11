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

@interface FeedViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation FeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self performSelector:@selector(retrieveFromParse)];
    self.photosArray = [[NSArray alloc]init];

}

-(void)retrieveFromParse
{
    PFQuery *retrievePhotos = [PFQuery queryWithClassName:@"Photo"];

    [retrievePhotos findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        self.photosArray = [[NSArray alloc] initWithArray:objects];

        [self.feedTableView reloadData];
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

    [testImage getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        UIImage *tempImage = [UIImage imageWithData:data];
        cell.sneakerImageView.image = tempImage;
        [self.feedTableView reloadData];
    }];
    return cell;
}

//Dismiss keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
