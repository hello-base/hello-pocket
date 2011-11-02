//
//  PartitionObjectsHelper.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/2/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PartitionObjectsHelper : NSObject
+ (NSArray *)partitionObjects:(NSArray *)array collationStringSelector:(SEL)selector;
@end
