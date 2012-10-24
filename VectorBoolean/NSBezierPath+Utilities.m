//
//  NSBezierPath+Utilities.m
//  VectorBrush
//
//  Created by Andrew Finnell on 5/28/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import "NSBezierPath+Utilities.h"


@implementation NSBezierPath (FBUtilities)

- (NSPoint) az_pointAtIndex:(NSUInteger)index
{
    return [self az_elementAtIndex:index].point;
}

- (NSBezierElement) az_elementAtIndex:(NSUInteger)index
{
    NSBezierElement element = {};
    NSPoint points[3] = {};
    element.kind = [self elementAtIndex:index associatedPoints:points];
    switch (element.kind) {
        case NSMoveToBezierPathElement:
        case NSLineToBezierPathElement:
        case NSClosePathBezierPathElement:
            element.point = points[0];
            break;
            
        case NSCurveToBezierPathElement:
            element.controlPoints[0] = points[0];
            element.controlPoints[1] = points[1];
            element.point = points[2];
            break;
    }
    return element;
}

- (NSBezierPath *) az_subpathWithRange:(NSRange)range
{
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path az_copyAttributesFrom:self];
    for (NSUInteger i = 0; i < range.length; i++) {
        NSBezierElement element = [self az_elementAtIndex:range.location + i];
        if ( i == 0 )
            [path moveToPoint:element.point];
        else
            [path az_appendElement:element];
    }
    return path;
}

- (void) az_copyAttributesFrom:(NSBezierPath *)path
{
    [self setLineWidth:[path lineWidth]];
    [self setLineCapStyle:[path lineCapStyle]];
    [self setLineJoinStyle:[path lineJoinStyle]];
    [self setMiterLimit:[path miterLimit]];
    [self setFlatness:[path flatness]];
}

- (void) az_appendPath:(NSBezierPath *)path
{
    NSBezierElement previousElement = [self elementCount] > 0 ? [self az_elementAtIndex:[self elementCount] - 1] : (NSBezierElement){};
    for (NSUInteger i = 0; i < [path elementCount]; i++) {
        NSBezierElement element = [path az_elementAtIndex:i];
        
        // If the first element is a move to where we left off, skip it
        if ( element.kind == NSMoveToBezierPathElement ) {
            if ( NSEqualPoints(element.point, previousElement.point) )
                continue;
            else
                element.kind = NSLineToBezierPathElement; // change it to a line to
        }
        
        [self az_appendElement:element];
        previousElement = element;
    }
}

- (void) az_appendElement:(NSBezierElement)element
{
    switch (element.kind) {
        case NSMoveToBezierPathElement:
            [self moveToPoint:element.point];
            break;
        case NSLineToBezierPathElement:
            [self lineToPoint:element.point];
            break;
        case NSCurveToBezierPathElement:
            [self curveToPoint:element.point controlPoint1:element.controlPoints[0] controlPoint2:element.controlPoints[1]];
            break;
        case NSClosePathBezierPathElement:
            [self closePath];
            break;
    }
}

@end
