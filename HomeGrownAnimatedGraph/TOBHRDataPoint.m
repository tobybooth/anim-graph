//
//  TOBHRDataPoint.m
//  HomeGrownStaticGraph
//
//  Created by Toby Booth on 8/13/14.
//  Copyright (c) 2014 Toby Booth. All rights reserved.
//

#import "TOBHRDataPoint.h"

@implementation TOBHRDataPoint

- (instancetype)initHRDataPointWithXValue:(int)x YValue:(int)y
{
    TOBHRDataPoint *dataPoint = [[TOBHRDataPoint alloc] init];
    dataPoint.seconds = x;
    dataPoint.hrRecord = y;
    
    return dataPoint;
}

@end
