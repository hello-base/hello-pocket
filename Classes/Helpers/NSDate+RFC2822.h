//
//  NSDate+RFC2822.h
//  Hello! Pocket
//
//  Created by Bryan Veloso on 11/4/11.
//  Copyright (c) 2011 Revyver, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (RFC2822)

+ (NSDate *)dateFromRFC2822:(NSString *)rfc2822;

@end
