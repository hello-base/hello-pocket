//
//  HPListTableViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/4/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPListTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
@private
    UITableView *_tableView;
    NSArray *_items;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *items;

- (void)loadItems;

@end
