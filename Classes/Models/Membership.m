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

@implementation Membership

@synthesize artist;
@synthesize artistID = _artistID;
@synthesize group;
@synthesize groupID = _groupID;
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

    self.artistID = [attributes valueForKeyPath:@"artist.id"];
    self.groupID = [attributes valueForKeyPath:@"group.id"];
    self.primaryGroup = [attributes valueForKeyPath:@"primary_group"];
    self.joined = [attributes valueForKeyPath:@"joined"];
    self.left = [attributes valueForKeyPath:@"left"];
    self.isLeader = [attributes valueForKeyPath:@"leader"];
    self.leadershipStart = [attributes valueForKeyPath:@"leadership.start"];
    self.leadershipEnd = [attributes valueForKeyPath:@"leadership.end"];
    self.leadershipTenure = [attributes valueForKeyPath:@"leadership.tenure"];

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
