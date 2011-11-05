//
//  HPDetailTableViewController.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/5/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPDetailTableViewController.h"

@implementation HPDetailTableViewController

@synthesize detailItem = _detailItem;

- (UITableViewCell *)createCellForIdentifier:(NSString *)identifier tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath style:(UITableViewCellStyle)style selectable:(BOOL)selectable
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:identifier];
        cell.selectionStyle = selectable ? UITableViewCellSelectionStyleBlue : UITableViewCellSelectionStyleNone;
        
        SEL initCellSelector = NSSelectorFromString([NSString stringWithFormat:@"initCellFor%@:indexPath:", identifier]);
        if ([self respondsToSelector:initCellSelector]) {
            [self performSelector:initCellSelector withObject:cell withObject:indexPath];
        }
    }

    SEL customizeCellSelector = NSSelectorFromString([NSString stringWithFormat:@"customizeCellFor%@:indexPath:", identifier]);
    if ([self respondsToSelector:customizeCellSelector]) {
        [self performSelector:customizeCellSelector withObject:cell withObject:indexPath];
    }

    return cell;
}

@end
