//
//  HPHelloRankingAPIClient.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/23/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "HPHelloRankingAPIClient.h"

#import "AFJSONRequestOperation.h"

NSString * const kHPHelloRankingBaseURLString = @"http://gentle-dusk-3420.herokuapp.com/api/v1/";

@implementation HPHelloRankingAPIClient

+ (HPHelloRankingAPIClient *)sharedClient
{
    static HPHelloRankingAPIClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kHPHelloRankingBaseURLString]];
    });

    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }

    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    // [self setDefaultHeader:@"X-Hello-Ranking-API-Key" value:kHPHelloRankingClientID];
    // [self setDefaultHeader:@"X-Hello-Ranking-API-Version" value:@"1"];
    [self setDefaultHeader:@"X-UDID" value:[[UIDevice currentDevice] uniqueIdentifier]];

    return self;
}

@end
