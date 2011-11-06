//
//  HPPeopleTableViewController.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/6/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPPeopleTableViewController.h"

@implementation HPPeopleTableViewController

@synthesize countLabel;

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createCountLabel];
}

#pragma mark - View Builder Methods

- (void)createCountLabel
{
    CGRect labelRect = CGRectMake(0.0f, 0.0f, self.tableView.bounds.size.width, 52.0f);

    countLabel = [[UILabel alloc] initWithFrame:labelRect];
    countLabel.textAlignment = UITextAlignmentCenter;
    countLabel.backgroundColor = [UIColor clearColor];
    countLabel.shadowColor = [UIColor whiteColor];
    countLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
    countLabel.font = [UIFont systemFontOfSize:16.0f];
    countLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;

    if (self.tableView.style == UITableViewStylePlain) countLabel.textColor = [UIColor colorWithWhite:0.3f alpha:1.0f];
    else countLabel.textColor = [UIColor colorWithRed:76.0f/255.0f green:86.0f/255.0f blue:108.0f/255.0f alpha:1.0];
}

- (void)addFooterWithCount:(NSUInteger)count withLabel:(NSString *)string
{
    countLabel.text = [[NSString stringWithFormat:@"%d %@", count, string] copy];

    if (self.tableView.tableFooterView != nil) self.tableView.tableFooterView = nil;
    self.tableView.tableFooterView = countLabel;
}

#pragma mark - TableView Methods

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.items objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    BOOL showSection = [[self.items objectAtIndex:section] count] != 0;
    return (showSection) ? [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section] : nil;
}

@end
