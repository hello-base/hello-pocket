//
//  HPArtistDetailViewController.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/24/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPArtistDetailViewController.h"

#import "Artist.h"
#import "Group.h"
#import "Membership.h"

@interface HPArtistDetailViewController ()
- (void)configureView;
- (void)loadMemberships;
@end

@implementation HPArtistDetailViewController

@synthesize artist = _artist;
@synthesize detailItem = _detailItem;
@synthesize memberships = _memberships;
@synthesize photos = _photos;

enum Sections {
    kHeaderSection = 0,
    kTitleSection,
    kBasicInfoSection,
    kMembershipSection,
    kBodySection,
    NUM_SECTIONS
};

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
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
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

#pragma mark - Detail Item Management

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if ([self.detailItem isKindOfClass:[Artist class]]) {
        self.artist = self.detailItem;
    }

    // [self loadMemberships];
    NSString *urlString = [NSString stringWithFormat:@"/artists/%@/memberships/", self.artist.pk];
    NSDictionary *limit = [NSDictionary dictionaryWithObject:@"0" forKey:@"limit"];
    [Membership fetchManyWithURLString:urlString parameters:limit block:^(NSArray *records) {
        self.memberships = records;

        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self.tableView reloadData];
        });
    }];
}

- (void)loadMemberships
{

}

#pragma mark - TableView Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 52.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case kHeaderSection:
            return nil;
        case kMembershipSection:
            return @"Memberships";
        default:
            return nil;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return NUM_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case kHeaderSection:
            return 1;
        case kMembershipSection:
            return [self.memberships count];
        default:
            return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier;
    BOOL selectable = YES;
    UITableViewCellStyle style = UITableViewCellStyleDefault;

    // Header Section
    if (indexPath.section == kHeaderSection) {
        identifier = @"Cell";
    }

    // Basic Info Section
    if (indexPath.section == kBasicInfoSection) {
        identifier = @"Basic";
    }

    // Membership (Resumé) Section
    if (indexPath.section == kMembershipSection) {
        identifier = @"Membership";
        style = UITableViewCellStyleSubtitle;
    }

    return [self createCellForIdentifier:identifier tableView:tableView indexPath:indexPath style:style selectable:selectable];
}

#pragma mark - Cell Creation Methods

- (void)initCellForCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    cell.textLabel.textColor = [UIColor blueColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0];
}

- (void)customizeCellForCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [NSString stringWithFormat:@"Row: %d", indexPath.row];
}

- (void)initCellForMembership:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath
{
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)customizeCellForMembership:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath
{
    Membership *membership = [self.memberships objectAtIndex:indexPath.row];
    cell.textLabel.text = membership.group.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", membership.joined];

    if ([membership.group.name isEqualToString:@"Soloist"]) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
