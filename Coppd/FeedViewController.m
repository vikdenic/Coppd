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

    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//Dismiss keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - Delegates

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FeedCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell"];

    return cell;
}






@end
