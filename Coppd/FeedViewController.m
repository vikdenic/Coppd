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
#import "EditPhotoViewController.h"

//UITableViewDelegate, UITableViewDataSource,
@interface FeedViewController () <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate>

@property (nonatomic,strong) PFLogInViewController *loginViewController;
@property (nonatomic, strong) PFSignUpViewController *signUpViewController;
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;

@property (nonatomic, strong) UIImagePickerController *cameraController;

@property (strong, nonatomic) UIImage *imageTaken;
@property (strong, nonatomic) NSDate *date;

@end

@implementation FeedViewController

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [logInController dismissViewControllerAnimated:YES completion:nil];
    //query for data and reload tableview

    [self retrieveFromParse];
    [self.feedTableView reloadData];
}

-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [signUpController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [PFUser logOut];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    //camera stuff
    self.cameraController = [[UIImagePickerController alloc] init];
    self.cameraController.delegate = self;
    self.cameraController.allowsEditing = YES;

    self.cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;

    [self.feedTableView reloadData];
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
//        [self.feedTableView reloadData];
    }
}

-(void)retrieveFromParse
{
    PFQuery *retrievePhotos = [PFQuery queryWithClassName:@"Photo"];

    [retrievePhotos findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        self.photosArray = objects;
        [self.feedTableView reloadData];
    }];
}

#pragma mark - Take Picture

- (IBAction)onButtonPressed:(UIButton *)sender
{
    [self presentViewController:self.cameraController animated:NO completion:^{
        //
    }];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:NO completion:^{
        // Segues to SaveViewController after user picks photo
        self.imageTaken = [info valueForKey:UIImagePickerControllerOriginalImage];

        // Extracts and stores creation date of image as NSDate reference
        NSDictionary *metaData = [info objectForKey:@"UIImagePickerControllerMediaMetadata"];
        self.date = [[NSDate alloc]init];
        self.date = [[metaData objectForKey:@"{Exif}"] objectForKey:@"DateTimeOriginal"];
//        NSLog(@"DATE IS %@", self.date);

        [self performSegueWithIdentifier:@"EditSegue" sender:self];
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
    }];

    return cell;
}

#pragma mark - Segues and Unwinds

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual: @"EditSegue"])
    {
        EditPhotoViewController *editPhotoViewController = segue.destinationViewController;

        editPhotoViewController.imageTaken = self.imageTaken;
        editPhotoViewController.date = self.date;
    }
}

- (IBAction)unwindSegueAfterPhotoSubmit:(UIStoryboardSegue *)sender
{
    //take image >data >pffile >parse
    NSData *imageData = UIImagePNGRepresentation(self.imageTaken);
//    NSString *fileName = [NSString stringWithFormat
    PFFile *imageFile = [PFFile fileWithData:imageData];
    PFObject *photo = [PFObject objectWithClassName:@"Photo"];
    [photo setObject:imageFile forKey:@"image"];

}


- (IBAction)unwindSegueToMasterViewControllerOnCancel:(UIStoryboardSegue *)sender
{

}




#pragma mark - random stuff
//Dismiss keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

//- (IBAction)likeButtonPressed:(UIButton *)sender
//{
//
//    
//}

@end
