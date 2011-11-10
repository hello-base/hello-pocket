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

@interface Membership : NSObject

@property (nonatomic, strong) Artist *artist;
@property (nonatomic, strong) Group *group;

@property (nonatomic, strong) NSNumber *primaryGroup;
@property (nonatomic, strong) NSDate *joined;
@property (nonatomic, strong) NSDate *left;

@property (nonatomic, strong) NSNumber *isLeader;
@property (nonatomic, strong) NSDate *leadershipStart;
@property (nonatomic, strong) NSDate *leadershipEnd;
@property (nonatomic, strong) NSNumber *leadershipTenure;

- (id)initWithAttributes:(NSDictionary *)attributes;
+ (void)fetchManyWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *records))block;

@end
