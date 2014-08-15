//
//  TOBHRDataPoint.h
//  HomeGrownStaticGraph
//
//  Created by Toby Booth on 8/13/14.
//  Copyright (c) 2014 Toby Booth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TOBHRDataPoint : NSObject

@property (nonatomic) int seconds;
@property (nonatomic) int hrRecord;

- (instancetype)initHRDataPointWithXValue:(int)x YValue:(int)y;

@end
