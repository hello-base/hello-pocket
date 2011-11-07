//
//  HPGroupDetailViewController.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/30/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPDetailTableViewController.h"

@class Group;

@interface HPGroupDetailViewController : HPDetailTableViewController {
@private
    NSArray *_members;
    NSArray *_activeMembers;
    NSArray *_inactiveMembers;
    NSArray *_photos;
}

@property (nonatomic, assign) Group *group;

@property (nonatomic, strong) id detailItem;
@property (nonatomic, strong) NSArray *members;
@property (nonatomic, strong) NSArray *activeMembers;
@property (nonatomic, strong) NSArray *inactiveMembers;
@property (nonatomic, strong) NSArray *photos;

@end
