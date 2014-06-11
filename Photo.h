//
//  Photo.h
//  Coppd
//
//  Created by AE on 6/11/14.
//  Copyright (c) 2014 Aaron & Vik. All rights reserved.
//

#import <Parse/Parse.h>

@interface Photo : PFObject <PFSubclassing>

@property PFFile *photo;
+ (id)parseClassName;

@end
