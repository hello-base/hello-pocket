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
@private
    NSArray *_allItems;
    NSArray *_activeItems;
    NSArray *_inactiveItems;

    int _allItemsCount;
    int _activeItemsCount;
    int _inactiveItemsCount;
}

@property (nonatomic, strong) IBOutlet UISegmentedControl *filter;
@property (nonatomic, strong) UILabel *itemCount;

@property (nonatomic, strong) NSArray *allItems;
@property (nonatomic, strong) NSArray *activeItems;
@property (nonatomic, strong) NSArray *inactiveItems;

@property (nonatomic, readwrite) int allItemsCount;
@property (nonatomic, readwrite) int activeItemsCount;
@property (nonatomic, readwrite) int inactiveItemsCount;


- (IBAction)filterIndexChanged;

@end
