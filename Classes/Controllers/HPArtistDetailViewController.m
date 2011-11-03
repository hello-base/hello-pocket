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

@interface HPArtistDetailViewController ()
- (void)configureView;
- (void)loadMemberships;
@end

@implementation HPArtistDetailViewController

@synthesize detailItem = _detailItem;
@synthesize memberships = _memberships;

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
        Artist *artist = self.detailItem;
    }
}

- (void)loadMemberships
{
    
}

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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
