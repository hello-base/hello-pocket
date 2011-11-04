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

- (void)showTableView
{
	self.tableView.hidden = NO;
}

- (void)hideTableView
{
	self.tableView.hidden = YES;
}

#pragma mark - View Lifecycle

- (void)loadView
{
    [super loadView];
    
    self.tableView.hidden = YES;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    if (_items && [_items count] > 0) {
        [self.tableView reloadData];
        [self showTableView];
    }else{
        [self loadItems];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
    
    // Deselect the selected row.
    NSIndexPath *selection = [self.tableView indexPathForSelectedRow];
    if (selection) {
        [self.tableView deselectRowAtIndexPath:selection animated:YES];
    }
}

@end
