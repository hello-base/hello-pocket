//
//  HPArtistTableViewController.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/27/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPArtistTableViewController.h"

#import "Artist.h"
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

#pragma mark - Data Source Methods

- (void)loadArtists
{
    [SVProgressHUD showInView:[self view]];
    
    NSDictionary *limit = [NSDictionary dictionaryWithObject:@"0" forKey:@"limit"];
    [Artist fetchManyWithURLString:@"/artists" parameters:limit block:^(NSArray *records) {
        self.artists = records;
        [self.tableView reloadData];
    }];
}

#pragma mark - TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.artists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell"];
    Artist *artist = [self.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = artist.kanji;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:nil animated:YES];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self setArtists:nil];
}

@end
