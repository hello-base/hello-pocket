//
//  HPArtistTableViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/27/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPListTableViewController.h"

@interface HPArtistTableViewController : HPListTableViewController {
    NSArray *_allItems;
    NSArray *_activeItems;
    NSArray *_inactiveItems;
}

@property (nonatomic, strong) IBOutlet UISegmentedControl *filter;
@property (nonatomic, strong) NSArray *allItems;
@property (nonatomic, strong) NSArray *activeItems;
@property (nonatomic, strong) NSArray *inactiveItems;

- (IBAction)filterIndexChanged;

@end
