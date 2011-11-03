//
//  Artist.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/23/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject {
@private
    NSDate *_modified;

    NSString *_name;
    NSString *_kanji;

    NSString *_alias;
    NSString *_aliasKanji;
    NSString *_bloodtype;
    NSString *_familyKanji;
    NSString *_familyName;
    NSString *_givenKanji;
    NSString *_givenName;
    NSString *_nicknames;
    NSString *_note;

    NSNumber *_scope;
    NSNumber *_status;
}

@property (nonatomic, strong) NSDate *modified;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *kanji;

@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSString *aliasKanji;
@property (nonatomic, strong) NSString *bloodtype;
@property (nonatomic, strong) NSString *familyKanji;
@property (nonatomic, strong) NSString *familyName;
@property (nonatomic, strong) NSString *givenKanji;
@property (nonatomic, strong) NSString *givenName;
@property (nonatomic, strong) NSString *nicknames;
@property (nonatomic, strong) NSString *note;

@property (nonatomic, strong) NSNumber *scope;
@property (nonatomic, strong) NSNumber *status;

- (id)initWithAttributes:(NSDictionary *)attributes;
+ (void)fetchManyWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *records))block;

@end
