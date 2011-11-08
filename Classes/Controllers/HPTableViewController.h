//
//  HPListTableViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/4/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *items;

- (void)hideTableView;
- (void)showTableView;
- (void)loadItems;
- (NSUInteger)count;

@end
