//
//  HPIdolTableViewController.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/27/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPIdolTableViewController.h"

#import "Idol.h"
#import "HPIdolDetailViewController.h"
#import "HPIdolListCell.h"
#import "PartitionObjectsHelper.h"
#import "SVProgressHUD.h"

@implementation HPIdolTableViewController

@synthesize filter;
@synthesize itemCount;
@synthesize allItems = _allItems;
@synthesize activeItems = _activeItems;
@synthesize inactiveItems = _inactiveItems;

#pragma mark - View Lifecycle

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 70.0f;
}

- (void)viewDidUnload
{
    [self setItemCount:nil];
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
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ToIdolDetail"]) {
        Idol *idol = [[self.items objectAtIndex:self.tableView.indexPathForSelectedRow.section] objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        HPIdolDetailViewController *detail = [segue destinationViewController];
        [detail setDetailItem:idol];
        [detail setTitle:[idol name]];
    }
}

#pragma mark - Data Source Methods

- (void)loadItems
{
    [SVProgressHUD showWithStatus:@"Loading..." maskType:SVProgressHUDMaskTypeClear];

    [Idol fetchWithBlock:^(NSArray *records) {
        NSArray *bucket = [NSArray arrayWithArray:records];

        NSPredicate *filterActive = [NSPredicate predicateWithFormat:@"status == 1"];
        NSPredicate *filterInactive = [NSPredicate predicateWithFormat:@"status == 2"];
        self.allItems = [PartitionObjectsHelper partitionObjects:bucket collationStringSelector:@selector(name)];
        self.activeItems = [PartitionObjectsHelper partitionObjects:[bucket filteredArrayUsingPredicate:filterActive] collationStringSelector:@selector(name)];
        self.inactiveItems = [PartitionObjectsHelper partitionObjects:[bucket filteredArrayUsingPredicate:filterInactive] collationStringSelector:@selector(name)];

        // Set the initial item list to active idols.
        self.items = self.activeItems;

        [self addFooterWithCount:[self count] withLabel:@"idols"];

        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self.tableView reloadData];
            [self showTableView];
        });
    }];
}

- (IBAction)filterIndexChanged
{
    static NSString *labelText = @"idols";
    switch (self.filter.selectedSegmentIndex) {
        case 0:
            self.items = self.activeItems;
            [self addFooterWithCount:[self count] withLabel:labelText];
            [self.tableView reloadData];
            break;
        case 1:
            self.items = self.inactiveItems;
            [self addFooterWithCount:[self count] withLabel:labelText];
            [self.tableView reloadData];
            break;
        case 2:
            self.items = self.allItems;
            [self addFooterWithCount:[self count] withLabel:labelText];
            [self.tableView reloadData];
            break;
        default:
            break;
    }
}

#pragma mark - TableView Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPIdolListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IdolListCell"];
    Idol *idol = [[self.items objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.idol = idol;

    return cell;
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
