//
//  HPHelloRankingAPIClient.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/23/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPClient.h"

extern NSString * const kHPHelloRankingBaseURLString;

@interface HPHelloRankingAPIClient : AFHTTPClient
    + (HPHelloRankingAPIClient *)sharedClient;
@end
