//
//  HPListTableViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/4/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPListTableViewController : UITableViewController {
@private
    NSMutableArray *_items;
}

@property (nonatomic, strong) NSMutableArray *items;

- (void)loadItems;
- (void)showTableView;
- (void)hideTableView;

@end
