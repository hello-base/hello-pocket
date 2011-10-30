//
//  HPGroupDetailViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/30/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Group;

@interface HPGroupDetailViewController : UIViewController

@property (nonatomic, assign) Group *group;

@property (nonatomic, strong) id detailItem;
@property (nonatomic, strong) IBOutlet UILabel *detailDescriptionLabel;

@end
