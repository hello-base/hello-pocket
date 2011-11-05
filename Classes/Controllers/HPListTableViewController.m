//
//  HPListTableViewController.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/4/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPListTableViewController.h"

@implementation HPListTableViewController

@synthesize items = _items;

- (void)loadItems
{
    NSLog(@"Must be implemented in a subclass.");
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_items && [_items count] > 0) {
        [self.tableView reloadData];
    } else {
        [self loadItems];
    }
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self setItems:nil];
}

@end
