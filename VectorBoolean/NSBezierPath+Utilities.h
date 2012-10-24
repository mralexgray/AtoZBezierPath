//
//  NSBezierPath+Utilities.h
//  VectorBrush
//
//  Created by Andrew Finnell on 5/28/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef struct NSBezierElement {
    NSBezierPathElement kind;
    NSPoint point;
    NSPoint controlPoints[2];
} NSBezierElement;

@interface NSBezierPath (FBUtilities)

- (NSPoint) az_pointAtIndex:(NSUInteger)index;
- (NSBezierElement) az_elementAtIndex:(NSUInteger)index;

- (NSBezierPath *) az_subpathWithRange:(NSRange)range;

- (void) az_copyAttributesFrom:(NSBezierPath *)path;
- (void) az_appendPath:(NSBezierPath *)path;
- (void) az_appendElement:(NSBezierElement)element;

@end
