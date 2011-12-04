//
//  Membership.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/3/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Idol;
@class Group;

@interface Membership : NSObject

@property (nonatomic, strong) Idol *idol;
@property (nonatomic, strong) Group *group;

@property (nonatomic, strong) NSNumber *primaryGroup;
@property (nonatomic, strong) NSDate *started;
@property (nonatomic, strong) NSDate *ended;

@property (nonatomic, strong) NSNumber *isLeader;
@property (nonatomic, strong) NSDate *leadershipStarted;
@property (nonatomic, strong) NSDate *leadershipEnded;
@property (nonatomic, strong) NSNumber *leadershipTenure;

- (id)initWithAttributes:(NSDictionary *)attributes;
+ (void)fetchManyWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *records))block;

@end
