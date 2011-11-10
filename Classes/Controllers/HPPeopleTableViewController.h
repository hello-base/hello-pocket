//
//  HPPeopleTableViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/6/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPTableViewController.h"

@interface HPPeopleTableViewController : HPTableViewController

@property (nonatomic, retain) UILabel *countLabel;

- (void)createCountLabel;
- (void)addFooterWithCount:(NSUInteger)count withLabel:(NSString *)string;

@end
