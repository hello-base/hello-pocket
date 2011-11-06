//
//  HPListTableViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/4/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
@private
    UITableView *_tableView;
    NSArray *_items;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *items;

- (void)loadItems;
- (NSUInteger)count;

@end