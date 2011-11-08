//
//  Artist.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/23/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject

@property (nonatomic, strong) NSNumber *pk;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *kanji;

@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSString *aliasKanji;
@property (nonatomic, strong) NSDate *birthdate;
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
+ (void)fetchWithBlock:(void (^)(NSArray *records))block;
+ (void)fetchWithString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(Artist *artist))block;

@end
