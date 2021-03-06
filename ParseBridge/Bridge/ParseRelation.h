//
//  ParseRelation.h
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//


#import <BridgeKit/JavaObject.h>
#import "ParseObject.h"

@class ParseQuery;

@interface ParseRelation : ParseObject

- (ParseQuery *)query;
- (void)addObject:(ParseObject *)object;
- (void)removeObject:(ParseObject *)object;

@end
