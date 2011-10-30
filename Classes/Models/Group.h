//
//  Group.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/29/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject {
@private
    NSDate *_modified;

    NSString *_name;
    NSString *_kanji;

    NSNumber *_active;
    NSDate *_formation;
    NSDate *_inactive;
    NSNumber *_members;
    NSNumber *_activMembers;
    NSNumber *_inactivMembers;
    NSString *_note;

    NSNumber *_classification;
    NSNumber *_scope;
    NSNumber *_status;
}

@property (nonatomic, strong) NSDate *modified;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *kanji;

@property (readwrite, strong) NSNumber *active;
@property (nonatomic, strong) NSDate *formation;
@property (nonatomic, strong) NSDate *inactive;
@property (nonatomic, strong) NSNumber *members;
@property (nonatomic, strong) NSNumber *activeMembers;
@property (nonatomic, strong) NSNumber *inactiveMembers;
@property (nonatomic, strong) NSString *note;

@property (nonatomic, strong) NSNumber *classification;
@property (nonatomic, strong) NSNumber *scope;
@property (nonatomic, strong) NSNumber *status;

- (id)initWithAttributes:(NSDictionary *)attributes;
+ (void)fetchManyWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *records))block;

@end
