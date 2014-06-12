//
//  EditPhotoViewController.m
//  Coppd
//
//  Created by Vik Denic on 6/11/14.
//  Copyright (c) 2014 Aaron & Vik. All rights reserved.
//

#import "EditPhotoViewController.h"
#import <Parse/Parse.h>
#import "Photo.h"

@interface EditPhotoViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation EditPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageView.image = self.imageTaken;
}

- (IBAction)onSubmitButtonPressed:(id)sender
{
    //I must resize image again

    CGSize sacleSize = CGSizeMake(150, 150);
    UIGraphicsBeginImageContextWithOptions(sacleSize, NO, 0.0);
    [self.imageTaken drawInRect:CGRectMake(0, 0, sacleSize.width, sacleSize.height)];
    UIImage * resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    NSData *imageData = UIImagePNGRepresentation(resizedImage);
    PFFile *imageFile = [PFFile fileWithData:imageData];

    // Save PFFile
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (!error) {

             // Create a PFObject around a PFFile and associate it with the current user
             Photo *uploadedImage = [Photo objectWithClassName:@"Photo"];
             [uploadedImage setObject:imageFile forKey:@"image"];

//             [userPhoto setObject:[PFUser currentUser] forKey:@"user"];
//             userPhoto[@"caption"] = self.textView.text;

             [uploadedImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
              {
                  if (!error) {

                      [self dismissViewControllerAnimated:YES completion:nil];
                  }
                  else{
                      NSLog(@"Error: %@ %@", error, [error userInfo]);
                  }
              }];
         }
     }];

    
}


@end
