//
//  HPArtistDetailViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/24/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPDetailTableViewController.h"

@class Artist;

@interface HPArtistDetailViewController : HPDetailTableViewController

@property (nonatomic, strong) id detailItem;
@property (nonatomic, assign) Artist *artist;
@property (nonatomic, strong) NSArray *memberships;
@property (nonatomic, strong) NSArray *photos;

@end
