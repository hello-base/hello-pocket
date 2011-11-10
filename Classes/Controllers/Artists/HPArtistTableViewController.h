//
//  HPIdolTableViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/27/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPPeopleTableViewController.h"

@interface HPIdolTableViewController : HPPeopleTableViewController

@property (nonatomic, weak) IBOutlet UISegmentedControl *filter;
@property (nonatomic, strong) UILabel *itemCount;

@property (nonatomic, strong) NSArray *allItems;
@property (nonatomic, strong) NSArray *activeItems;
@property (nonatomic, strong) NSArray *inactiveItems;

- (IBAction)filterIndexChanged;

@end
