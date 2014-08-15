//
//  TOBHRDataGenerator.m
//  HomeGrownStaticGraph
//
//  Created by Toby Booth on 8/12/14.
//  Copyright (c) 2014 Toby Booth. All rights reserved.
//

#import "TOBHRDataGenerator.h"
#import "TOBHRDataPoint.h"

@interface TOBHRDataGenerator ()

@property (nonatomic) int rate;
@property (nonatomic) int seconds;

@end

@implementation TOBHRDataGenerator

+ (instancetype)initWithStartingHR:(int)rate
{
    static TOBHRDataGenerator *generator;
    
    if (!generator) {
        generator = [[self alloc] init];
        generator.rate = rate;
    }
    

//    generator.seconds = 0;
    
    return generator;
}

- (TOBHRDataPoint *)generateData
{
    TOBHRDataPoint *hrDataPoint = [[TOBHRDataPoint alloc] initHRDataPointWithXValue:self.seconds
                                                                             YValue:self.rate];

    self.seconds += 2;
    self.rate += (arc4random() % 10) - 3;

    
//    self.hrDataPoint.seconds = self.seconds;
//    self.hrDataPoint.hrRecord = self.rate;
    
    return hrDataPoint;
}



@end
