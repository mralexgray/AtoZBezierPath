//
//  NSBezierPath+Boolean.m
//  VectorBoolean
//
//  Created by Andrew Finnell on 5/31/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import "NSBezierPath+Boolean.h"
#import "NSBezierPath+Utilities.h"
#import "FBBezierGraph.h"

@implementation NSBezierPath (Boolean)

- (NSBezierPath *) az_union:(NSBezierPath *)path
{
    FBBezierGraph *thisGraph = [FBBezierGraph bezierGraphWithBezierPath:self];
    FBBezierGraph *otherGraph = [FBBezierGraph bezierGraphWithBezierPath:path];
    NSBezierPath *result = [[thisGraph unionWithBezierGraph:otherGraph] bezierPath];
    [result az_copyAttributesFrom:self];
    return result;
}

- (NSBezierPath *) az_intersect:(NSBezierPath *)path
{
    FBBezierGraph *thisGraph = [FBBezierGraph bezierGraphWithBezierPath:self];
    FBBezierGraph *otherGraph = [FBBezierGraph bezierGraphWithBezierPath:path];
    NSBezierPath *result = [[thisGraph intersectWithBezierGraph:otherGraph] bezierPath];
    [result az_copyAttributesFrom:self];
    return result;
}

- (NSBezierPath *) az_difference:(NSBezierPath *)path
{
    FBBezierGraph *thisGraph = [FBBezierGraph bezierGraphWithBezierPath:self];
    FBBezierGraph *otherGraph = [FBBezierGraph bezierGraphWithBezierPath:path];
    NSBezierPath *result = [[thisGraph differenceWithBezierGraph:otherGraph] bezierPath];
    [result az_copyAttributesFrom:self];
    return result;
}

- (NSBezierPath *) az_xor:(NSBezierPath *)path
{
    FBBezierGraph *thisGraph = [FBBezierGraph bezierGraphWithBezierPath:self];
    FBBezierGraph *otherGraph = [FBBezierGraph bezierGraphWithBezierPath:path];
    NSBezierPath *result = [[thisGraph xorWithBezierGraph:otherGraph] bezierPath];
    [result az_copyAttributesFrom:self];
    return result;
}

@end
