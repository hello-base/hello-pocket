//
//  Membership.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/3/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;
@class Group;

@interface Membership : NSObject {
@private    
    NSNumber *_primaryGroup;
    NSDate *_joined;
    NSDate *_left;
    
    NSNumber *_isLeader;
    NSDate *_leadershipStart;
    NSDate *_leadershipEnd;
    NSNumber *_leadershipTeunure;
}

@property (nonatomic, assign) Artist *artist;
@property (nonatomic, assign) Group *group;

@property (nonatomic, strong) NSNumber *primaryGroup;
@property (nonatomic, strong) NSDate *joined;
@property (nonatomic, strong) NSDate *left;

@property (nonatomic, strong) NSNumber *isLeader;
@property (nonatomic, strong) NSDate *leadershipStart;
@property (nonatomic, strong) NSDate *leadershipEnd;
@property (nonatomic, strong) NSNumber *leadershipTenure;

@end
