//
//  NSBezierPath+Boolean.h
//  VectorBoolean
//
//  Created by Andrew Finnell on 5/31/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSBezierPath (Boolean)

- (NSBezierPath *) az_union:(NSBezierPath *)path;
- (NSBezierPath *) az_intersect:(NSBezierPath *)path;
- (NSBezierPath *) az_difference:(NSBezierPath *)path;
- (NSBezierPath *) az_xor:(NSBezierPath *)path;

@end
