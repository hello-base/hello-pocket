//
//  HPArtistDetailViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/24/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Artist;

@interface HPArtistDetailViewController : UIViewController

@property (nonatomic, assign) Artist *artist;

@property (nonatomic, strong) id detailItem;
@property (nonatomic, strong) IBOutlet UILabel *detailDescriptionLabel;

@end
