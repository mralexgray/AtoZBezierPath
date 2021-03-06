//
//  Geometry.h
//  VectorBrush
//
//  Created by Andrew Finnell on 5/28/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>


CGFloat FBDistanceBetweenPoints(NSPoint point1, NSPoint point2);
CGFloat FBDistancePointToLine(NSPoint point, NSPoint lineStartPoint, NSPoint lineEndPoint);
NSPoint FBLineNormal(NSPoint lineStart, NSPoint lineEnd);
NSPoint FBLineMidpoint(NSPoint lineStart, NSPoint lineEnd);

NSPoint FBAddPoint(NSPoint point1, NSPoint point2);
NSPoint FBScalePoint(NSPoint point, CGFloat scale);
NSPoint FBUnitScalePoint(NSPoint point, CGFloat scale);
NSPoint FBSubtractPoint(NSPoint point1, NSPoint point2);
CGFloat FBDotMultiplyPoint(NSPoint point1, NSPoint point2);
CGFloat FBPointLength(NSPoint point);
CGFloat FBPointSquaredLength(NSPoint point);
NSPoint FBNormalizePoint(NSPoint point);
NSPoint FBNegatePoint(NSPoint point);
NSPoint FBRoundPoint(NSPoint point);

BOOL FBArePointsClose(NSPoint point1, NSPoint point2);
BOOL FBArePointsCloseWithOptions(NSPoint point1, NSPoint point2, CGFloat threshold);
BOOL FBAreValuesClose(CGFloat value1, CGFloat value2);
BOOL FBAreValuesCloseWithOptions(CGFloat value1, CGFloat value2, CGFloat threshold);
