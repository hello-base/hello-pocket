//
//  Membership.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/3/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "Membership.h"

#import "Artist.h"
#import "Group.h"

@implementation Membership

@synthesize artist;
@synthesize group;
@synthesize primaryGroup = _primaryGroup;
@synthesize joined = _joined;
@synthesize left = _left;
@synthesize isLeader = _isLeader;
@synthesize leadershipStart = _leadershipStart;
@synthesize leadershipEnd = _leadershipEnd;
@synthesize leadershipTenure = _leadershipTenure;

@end
