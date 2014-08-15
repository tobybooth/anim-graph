//
//  TOBHRDataGenerator.h
//  HomeGrownStaticGraph
//
//  Created by Toby Booth on 8/12/14.
//  Copyright (c) 2014 Toby Booth. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TOBHRDataPoint;

@interface TOBHRDataGenerator : NSObject
@property (nonatomic, strong) TOBHRDataPoint *hrDataPoint;

- (TOBHRDataPoint *)generateData;
+ (instancetype)initWithStartingHR:(int)rate;


@end
