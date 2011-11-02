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
#import "LRIndexedCollationWithSearch.h"
#import "PartitionObjectsHelper.h"
#import "SVProgressHUD.h"

@interface HPArtistTableViewController ()
@property (readwrite, nonatomic, strong) NSArray *artists;

- (void)loadArtists;
@end

@implementation HPArtistTableViewController

@synthesize artists = _artists;

#pragma mark - View Lifecycle

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [self loadArtists];
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
    if ([[segue identifier] isEqualToString:@"SegueToArtistDetail"]) {
        Artist *artist = [[self.artists objectAtIndex:self.tableView.indexPathForSelectedRow.section] objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        HPArtistDetailViewController *detail = [segue destinationViewController];
        [detail setArtist:artist];
        [detail setTitle:[artist name]];
    }
}

#pragma mark - Data Source Methods

- (void)loadArtists
{
    [SVProgressHUD showInView:[self view]];

    NSDictionary *limit = [NSDictionary dictionaryWithObject:@"0" forKey:@"limit"];
    [Artist fetchManyWithURLString:@"/artists" parameters:limit block:^(NSArray *records) {
        self.artists = [PartitionObjectsHelper partitionObjects:records collationStringSelector:@selector(name)];

        // Create a UILabel with the total artist count.
        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        count.textAlignment = UITextAlignmentCenter;
        count.textColor = [UIColor grayColor];
        count.text = [NSString stringWithFormat:@"%d Artists", [records count]];
        self.tableView.tableFooterView = count;

        [self.tableView reloadData];
    }];
}

#pragma mark - TableView Methods

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [[LRIndexedCollationWithSearch currentCollation] sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [[LRIndexedCollationWithSearch currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[[LRIndexedCollationWithSearch currentCollation] sectionTitles] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.artists objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    BOOL showSection = [[self.artists objectAtIndex:section] count] != 0;
    return (showSection) ? [[[LRIndexedCollationWithSearch currentCollation] sectionTitles] objectAtIndex:section] : nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell"];
    Artist *artist = [[self.artists objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = artist.kanji;

    return cell;
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self setArtists:nil];
}

@end
