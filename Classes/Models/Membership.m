//
//  Membership.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/3/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "Membership.h"

#import "Idol.h"
#import "Group.h"
#import "HPHelloRankingAPIClient.h"
#import "NSDate+RFC2822.h"

@implementation Membership

@synthesize idol;
@synthesize group;
@synthesize primaryGroup = _primaryGroup;
@synthesize started = _started;
@synthesize ended = _ended;
@synthesize isLeader = _isLeader;
@synthesize leadershipStarted = _leadershipStarted;
@synthesize leadershipEnded = _leadershipEnded;
@synthesize leadershipTenure = _leadershipTenure;

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }

    if ([attributes valueForKeyPath:@"idol"]) {
        self.idol = [[Idol alloc] initWithAttributes:[attributes valueForKeyPath:@"idol"]];
    }
    if ([attributes valueForKeyPath:@"group"]) {
        self.group = [[Group alloc] initWithAttributes:[attributes valueForKeyPath:@"group"]];
    }

    self.primaryGroup = [attributes valueForKeyPath:@"primary_group"];
    self.started = [NSDate dateFromRFC2822:[attributes valueForKeyPath:@"started"]];
    self.isLeader = [attributes valueForKeyPath:@"leader"];
    self.leadershipTenure = [attributes valueForKeyPath:@"leadership.tenure"];

    // The following dates can be null, so we must test for it.
    if (![[attributes valueForKeyPath:@"ended"] isKindOfClass:[NSNull class]]) {
        self.ended = [NSDate dateFromRFC2822:[attributes valueForKeyPath:@"ended"]];
    }
    if (![[attributes valueForKeyPath:@"leadership.started"] isKindOfClass:[NSNull class]]) {
        self.leadershipStart = [NSDate dateFromRFC2822:[attributes valueForKeyPath:@"leadership.started"]];
    }
    if (![[attributes valueForKeyPath:@"leadership.ended"] isKindOfClass:[NSNull class]]) {
        self.leadershipEnd = [NSDate dateFromRFC2822:[attributes valueForKeyPath:@"leadership.ended"]];
    }

    return self;
}

+ (void)fetchManyWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *))block
{
    NSDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [[HPHelloRankingAPIClient sharedClient] getPath:urlString parameters:mutableParameters success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSMutableArray *mutableRecords = [NSMutableArray array];
        for (NSDictionary *attributes in [JSON valueForKeyPath:@"objects"]) {
            Membership *membership = [[Membership alloc] initWithAttributes:attributes];
            [mutableRecords addObject:membership];
        }
        if (block) {
            block([NSArray arrayWithArray:mutableRecords]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block([NSArray array]);
        }
    }];
}

@end
