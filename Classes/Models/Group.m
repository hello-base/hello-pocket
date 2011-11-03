//
//  Group.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 10/29/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "Group.h"

#import "HPHelloRankingAPIClient.h"
#import "SVProgressHUD.h"

@implementation Group

@synthesize modified = _modified;
@synthesize name = _name;
@synthesize kanji = _kanji;
@synthesize active = _active;
@synthesize formation = _formation;
@synthesize inactive = _inactive;
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

    self.modified = [attributes valueForKeyPath:@"modified"];
    self.name = [attributes valueForKeyPath:@"name"];
    self.kanji = [attributes valueForKeyPath:@"kanji"];
    self.active = [attributes valueForKeyPath:@"active"];
    self.formation = [attributes valueForKeyPath:@"formation"];
    self.inactive = [attributes valueForKeyPath:@"inactive"];
    self.members = [attributes valueForKeyPath:@"members"];
    self.activeMembers = [attributes valueForKeyPath:@"active_members"];
    self.inactiveMembers = [attributes valueForKeyPath:@"inactive_members"];
    self.note = [attributes valueForKeyPath:@"note"];
    self.classification = [attributes valueForKeyPath:@"classification"];
    self.scope = [attributes valueForKeyPath:@"scope"];
    self.status = [attributes valueForKeyPath:@"status"];

    return self;
}

+ (void)fetchManyWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters block:(void (^)(NSArray *))block
{
    NSDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [[HPHelloRankingAPIClient sharedClient] getPath:urlString parameters:mutableParameters success:^(id object) {
        NSMutableArray *mutableRecords = [NSMutableArray array];
        for (NSDictionary *attributes in [object valueForKeyPath:@"objects"]) {
            Group *group = [[Group alloc] initWithAttributes:attributes];
            [mutableRecords addObject:group];
        }
        if (block) {
            block([NSArray arrayWithArray:mutableRecords]);
            [SVProgressHUD dismissWithSuccess:@"Success!"];
        }
    } failure:^(NSHTTPURLResponse *response, NSError *error) {
        if (block) {
            block([NSArray array]);
            [SVProgressHUD dismissWithError:@"Whoops!"];
        }
    }];
}

@end
