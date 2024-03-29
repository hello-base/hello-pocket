//
//  HPListTableViewController.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/4/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPTableViewController.h"

@implementation HPTableViewController

@synthesize tableView = _tableView;
@synthesize items = _items;

- (void)hideTableView
{
    self.tableView.hidden = YES;
}

- (void)showTableView
{
    self.tableView.hidden = NO;
}

- (void)loadItems
{
    NSLog(@"Must be implemented in a subclass.");
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.hidden = YES;

    if (_items && [_items count] > 0) {
        [self.tableView reloadData];
    } else {
        [self loadItems];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.tableView = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSIndexPath *selection = [(UITableView *)_tableView indexPathForSelectedRow];
    if (selection) [_tableView deselectRowAtIndexPath:selection animated:YES];
}

# pragma - Convenience Methods

- (NSUInteger)count
{
    NSUInteger count = 0;
    for (NSArray *section in _items) {
        count += [section count];
    }
    return count;
}

#pragma mark - TableView Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Override in a subclass.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Override in a subclass.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Override in a subclass.
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Override in a subclass.
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self setItems:nil];
}

@end
