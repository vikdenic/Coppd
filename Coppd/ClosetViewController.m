//
//  ClosetViewController.m
//  Coppd
//
//  Created by Vik Denic on 6/9/14.
//  Copyright (c) 2014 Aaron & Vik. All rights reserved.
//

#import "ClosetViewController.h"


@interface ClosetViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ClosetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//CollectionView Delegate Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ClosetCell" forIndexPath:indexPath];
    [cell.layer setBorderWidth:2.0f];
    [cell.layer setBorderColor:[UIColor redColor].CGColor];



//    NSArray *array = [self.flickrDictionary objectForKey:@"photos"];
//        self.dictionary = [resultsArray objectAtIndex:indexPath.row];
//        NSDictionary *groupDictionary = [self.dictionary objectForKey:@"group"];
//        NSDictionary *venueDictionary = [self.dictionary objectForKey:@"venue"];
//
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyMeetUpCell"];
//        cell.textLabel.text = groupDictionary[@"name"];
//        cell.detailTextLabel.text = venueDictionary[@"address_1"];

    return cell;
}





@end
