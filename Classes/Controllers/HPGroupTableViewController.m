//
//  HPGroupTableViewController.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/29/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPGroupTableViewController.h"

#import "Group.h"
#import "HPGroupDetailViewController.h"
#import "PartitionObjectsHelper.h"
#import "SVProgressHUD.h"

@implementation HPGroupTableViewController

#pragma mark - View Lifecycle

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SegueToGroupDetail"]) {
        Group *group = [[self.items objectAtIndex:self.tableView.indexPathForSelectedRow.section] objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        HPGroupDetailViewController *detail = [segue destinationViewController];
        [detail setGroup:group];
        [detail setTitle:group.name];
    }
}

#pragma mark - Data Source Methods

- (void)loadItems
{
    [SVProgressHUD showInView:[self view]];

    [Group fetchWithBlock:^(NSArray *records) {
        self.items = [PartitionObjectsHelper partitionObjects:records collationStringSelector:@selector(name)];

        // Create a UILabel with the total artist count.
        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        count.textAlignment = UITextAlignmentCenter;
        count.textColor = [UIColor grayColor];
        count.text = [NSString stringWithFormat:@"%d Groups", [records count]];
        self.tableView.tableFooterView = count;

        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self.tableView reloadData];
        });
    }];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupCell"];
    Group *group = [[self.items objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = group.name;
    cell.detailTextLabel.text = group.kanji;
    if ([group.name isEqualToString:group.kanji]) {
        cell.detailTextLabel.text = nil;
    }

    return cell;
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
