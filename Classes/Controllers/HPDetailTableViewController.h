//
//  HPDetailTableViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/5/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPDetailTableViewController : UITableViewController

@property (nonatomic, strong) id detailItem;

- (UITableViewCell *)createCellForIdentifier:(NSString *)identifier tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath style:(UITableViewCellStyle)style selectable:(BOOL)selectable;

@end
