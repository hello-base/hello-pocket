//
//  HPArtistTableViewController.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/27/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPArtistTableViewController.h"

#import "Artist.h"
#import "HPArtistDetailViewController.h"
#import "PartitionObjectsHelper.h"
#import "SVProgressHUD.h"

@implementation HPArtistTableViewController

@synthesize filter;
@synthesize itemCount;
@synthesize allItems = _allItems;
@synthesize allItemsCount = _allItemsCount;
@synthesize activeItems = _activeItems;
@synthesize activeItemsCount = _activeItemsCount;
@synthesize inactiveItems = _inactiveItems;
@synthesize inactiveItemsCount = _inactiveItemsCount;

#pragma mark - View Lifecycle

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [filter addTarget:self action:@selector(filterIndexChanged) forControlEvents:UIControlEventValueChanged];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setFilter:nil];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SegueToArtistDetail"]) {
        Artist *artist = [[self.items objectAtIndex:self.tableView.indexPathForSelectedRow.section] objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        HPArtistDetailViewController *detail = [segue destinationViewController];
        [detail setDetailItem:artist];
        [detail setTitle:[artist name]];
    }
}

#pragma mark - Data Source Methods

- (void)loadItems
{
    [SVProgressHUD showInView:[self view]];

    [Artist fetchWithBlock:^(NSArray *records) {
        NSArray *bucket = [NSArray arrayWithArray:records];
        
        self.allItems = [PartitionObjectsHelper partitionObjects:bucket collationStringSelector:@selector(name)];
        self.allItemsCount = [bucket count];
        
        NSPredicate *filterActive = [NSPredicate predicateWithFormat:@"status == 1"];
        NSArray *activeBucket = [NSArray arrayWithArray:[bucket filteredArrayUsingPredicate:filterActive]];
        self.activeItems = [PartitionObjectsHelper partitionObjects:activeBucket collationStringSelector:@selector(name)];
        self.activeItemsCount = [activeBucket count];                        
        
        NSPredicate *filterInactive = [NSPredicate predicateWithFormat:@"status == 2"];
        NSArray *inactiveBucket = [NSArray arrayWithArray:[bucket filteredArrayUsingPredicate:filterInactive]];
        self.inactiveItems = [PartitionObjectsHelper partitionObjects:inactiveBucket collationStringSelector:@selector(name)];
        self.inactiveItemsCount = [inactiveBucket count];

        // Set the initial item list to active artists.
        self.items = self.activeItems;
        
        // Create a UILabel with the total artist count.
        self.itemCount = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 52)];
        self.itemCount.text = [NSString stringWithFormat:@"%d Artists", self.activeItemsCount];
        self.itemCount.textAlignment = UITextAlignmentCenter;
        self.itemCount.textColor = [UIColor grayColor];
        self.tableView.tableFooterView = itemCount;

        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self.tableView reloadData];
        });
    }];
}

- (IBAction)filterIndexChanged
{
    switch (self.filter.selectedSegmentIndex) {
        case 0:
            self.items = self.activeItems;
            self.itemCount.text = [NSString stringWithFormat:@"%d Artists", self.activeItemsCount];
            [self.tableView reloadData];
            break;
        case 1:
            self.items = self.inactiveItems;
            self.itemCount.text = [NSString stringWithFormat:@"%d Artists", self.inactiveItemsCount];            
            [self.tableView reloadData];
            break;
        case 2:
            self.items = self.allItems; 
            self.itemCount.text = [NSString stringWithFormat:@"%d Artists", self.allItemsCount];
            [self.tableView reloadData];
            break;
        default:
            break;
    }
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistListCell"];
    Artist *artist = [[self.items objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = artist.kanji;

    return cell;
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
