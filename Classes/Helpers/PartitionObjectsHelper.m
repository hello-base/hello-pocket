//
//  PartitionObjectsHelper.m
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/2/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import "PartitionObjectsHelper.h"

@implementation PartitionObjectsHelper

+ (NSArray *)partitionObjects:(NSArray *)array collationStringSelector:(SEL)selector
{
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    NSInteger sectionCount = [[collation sectionTitles] count];
    NSMutableArray *unsortedSections = [NSMutableArray arrayWithCapacity:sectionCount];

    for (int i = 0; i < sectionCount; i++) {
        [unsortedSections addObject:[NSMutableArray array]];
    }

    for (id object in array) {
        NSInteger index = [collation sectionForObject:object collationStringSelector:selector];
        [[unsortedSections objectAtIndex:index] addObject:object];
    }

    NSMutableArray *sections = [NSMutableArray arrayWithCapacity:sectionCount];

    for (NSMutableArray *section in unsortedSections) {
        [sections addObject:[collation sortedArrayFromArray:section collationStringSelector:selector]];
    }

    return sections;
}

@end
