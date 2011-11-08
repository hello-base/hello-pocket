//
//  HPGroupListCell.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/8/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPGroupListCell.h"

@implementation HPGroupListCell

@synthesize group = _group;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
