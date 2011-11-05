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
#import "HPHelloRankingAPIClient.h"
#import "NSDate+RFC2822.h"

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

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }

    if ([attributes valueForKeyPath:@"artist"]) {
        self.artist = [[Artist alloc] initWithAttributes:[attributes valueForKeyPath:@"artist"]];
    }
    if ([attributes valueForKeyPath:@"group"]) {
        self.group = [[Group alloc] initWithAttributes:[attributes valueForKeyPath:@"group"]];
    }

    self.primaryGroup = [attributes valueForKeyPath:@"primary_group"];
    self.joined = [NSDate dateFromRFC2822:[attributes valueForKeyPath:@"joined"]];
    self.isLeader = [attributes valueForKeyPath:@"leader"];
    self.leadershipTenure = [attributes valueForKeyPath:@"leadership.tenure"];

    // The following dates can be null, so we must test for it.
    if (![[attributes valueForKeyPath:@"left"] isKindOfClass:[NSNull class]]) {
        self.left = [NSDate dateFromRFC2822:[attributes valueForKeyPath:@"left"]];
    }
    if (![[attributes valueForKeyPath:@"leadership.start"] isKindOfClass:[NSNull class]]) {
        self.leadershipStart = [NSDate dateFromRFC2822:[attributes valueForKeyPath:@"leadership.start"]];
    }
    if (![[attributes valueForKeyPath:@"leadership.end"] isKindOfClass:[NSNull class]]) {
        self.leadershipEnd = [NSDate dateFromRFC2822:[attributes valueForKeyPath:@"leadership.end"]];
    }

    return self;
}

+ (void)fetchManyWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *))block
{
    NSDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [[HPHelloRankingAPIClient sharedClient] getPath:urlString parameters:mutableParameters success:^(id object) {
        NSMutableArray *mutableRecords = [NSMutableArray array];
        for (NSDictionary *attributes in [object valueForKeyPath:@"objects"]) {
            Membership *membership = [[Membership alloc] initWithAttributes:attributes];
            [mutableRecords addObject:membership];
        }
        if (block) {
            block([NSArray arrayWithArray:mutableRecords]);
        }
    } failure:^(NSHTTPURLResponse *response, NSError *error) {
        if (block) {
            block([NSArray array]);
        }
    }];
}

@end
