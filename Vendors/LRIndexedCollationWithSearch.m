//
//  LRSearchableIndexCollation.m
//
//  Copyright (c) 2010 Luke Redpath
//  Licensed under the MIT License
//

#import "LRIndexedCollationWithSearch.h"


@implementation LRIndexedCollationWithSearch

@dynamic sectionTitles;
@dynamic sectionIndexTitles;

+ (id)currentCollation;
{
  UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
  return [[self alloc] initWithCollation:collation];
}

- (id)initWithCollation:(UILocalizedIndexedCollation *)_collation;
{
  if (self = [super init]) {
    collation = _collation;
  }
  return self;
}

#pragma mark -

- (NSInteger)sectionForObject:(id)object collationStringSelector:(SEL)selector
{
  return [collation sectionForObject:object collationStringSelector:selector];
}

- (NSInteger)sectionForSectionIndexTitleAtIndex:(NSInteger)indexTitleIndex
{
  if(indexTitleIndex == 0) { 
    return NSNotFound;
  }
  return [collation sectionForSectionIndexTitleAtIndex:indexTitleIndex-1];
}

- (NSArray *)sortedArrayFromArray:(NSArray *)array collationStringSelector:(SEL)selector
{
  return [collation sortedArrayFromArray:array collationStringSelector:selector];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)sectionTitles;
{
  return [collation sectionTitles];
}

- (NSArray *)sectionIndexTitles;
{
  return [[NSArray arrayWithObject:UITableViewIndexSearch] arrayByAddingObjectsFromArray:[collation sectionIndexTitles]];
}

@end
