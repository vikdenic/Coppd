//
//  Photo.h
//  Coppd
//
//  Created by AE on 6/11/14.
//  Copyright (c) 2014 Aaron & Vik. All rights reserved.
//

#import <Parse/Parse.h>

@interface Photo : PFObject

@property PFFile *image;
@property PFUser *user;
@property int *likes;

@end
