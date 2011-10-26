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

@property (nonatomic, retain) NSDate *modified;

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *kanji;

@property (nonatomic, retain) NSString *alias;
@property (nonatomic, retain) NSString *aliasKanji;
@property (nonatomic, retain) NSString *bloodtype;
@property (nonatomic, retain) NSString *familyKanji;
@property (nonatomic, retain) NSString *familyName;
@property (nonatomic, retain) NSString *givenKanji;
@property (nonatomic, retain) NSString *givenName;
@property (nonatomic, retain) NSString *nicknames;
@property (nonatomic, retain) NSString *note;

@property (nonatomic, retain) NSNumber *scope;
@property (nonatomic, retain) NSNumber *status;

- (id)initWithAttributes:(NSDictionary *)attributes;
+ (void)artistsWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *records))block;

@end
