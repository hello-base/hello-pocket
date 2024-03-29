//
//  Group.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/29/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic, strong) NSNumber *pk;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *kanji;

@property (nonatomic, strong) NSNumber *active;
@property (nonatomic, strong) NSDate *started;
@property (nonatomic, strong) NSDate *ended;
@property (nonatomic, strong) NSNumber *members;
@property (nonatomic, strong) NSNumber *activeMembers;
@property (nonatomic, strong) NSNumber *inactiveMembers;
@property (nonatomic, strong) NSString *note;

@property (nonatomic, strong) NSNumber *classification;
@property (nonatomic, strong) NSNumber *scope;
@property (nonatomic, strong) NSNumber *status;

- (id)initWithAttributes:(NSDictionary *)attributes;
+ (void)fetchWithBlock:(void (^)(NSArray *records))block;

@end
