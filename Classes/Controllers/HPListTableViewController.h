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
    NSArray *_items;
}

@property (nonatomic, strong) NSArray *items;

- (void)loadItems;

@end
