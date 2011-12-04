//
//  Group.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/29/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "Group.h"

#import "HPHelloRankingAPIClient.h"
#import "NSDate+RFC2822.h"
#import "SVProgressHUD.h"

@implementation Group

@synthesize pk = _pk;
@synthesize name = _name;
@synthesize kanji = _kanji;
@synthesize active = _active;
@synthesize started = _started;
@synthesize ended = _ended;
@synthesize members = _members;
@synthesize activeMembers = _activeMembers;
@synthesize inactiveMembers = _inactiveMembers;
@synthesize note = _note;
@synthesize classification = _classification;
@synthesize scope = _scope;
@synthesize status = _status;

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }

    self.pk = [attributes valueForKeyPath:@"id"];
    self.name = [attributes valueForKeyPath:@"name"];
    self.kanji = [attributes valueForKeyPath:@"kanji"];
    self.active = [attributes valueForKeyPath:@"active"];
    self.started = [NSDate dateFromRFC2822:[attributes valueForKeyPath:@"started"]];
    self.members = [attributes valueForKeyPath:@"members"];
    self.activeMembers = [attributes valueForKeyPath:@"active_members"];
    self.inactiveMembers = [attributes valueForKeyPath:@"inactive_members"];
    self.note = [attributes valueForKeyPath:@"note"];
    self.classification = [attributes valueForKeyPath:@"classification"];
    self.scope = [attributes valueForKeyPath:@"scope"];
    self.status = [attributes valueForKeyPath:@"status"];

    // The following dates can be null, so we must test for it.
    if (![[attributes valueForKeyPath:@"ended"] isKindOfClass:[NSNull class]]) {
        self.ended = [NSDate dateFromRFC2822:[attributes valueForKeyPath:@"ended"]];
    }

    return self;
}

+ (void)fetchWithBlock:(void (^)(NSArray *))block
{
    NSDictionary *limit = [NSDictionary dictionaryWithObject:@"0" forKey:@"limit"];
    [[HPHelloRankingAPIClient sharedClient] getPath:@"groups/" parameters:limit success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSMutableArray *mutableRecords = [NSMutableArray array];
        for (NSDictionary *attributes in [JSON valueForKeyPath:@"objects"]) {
            Group *group = [[Group alloc] initWithAttributes:attributes];
            [mutableRecords addObject:group];
        }
        if (block) {
            block([NSArray arrayWithArray:mutableRecords]);
            [SVProgressHUD dismissWithSuccess:@"Success!"];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block([NSArray array]);
            [SVProgressHUD dismissWithError:@"Whoops!"];
        }
    }];
}

@end
