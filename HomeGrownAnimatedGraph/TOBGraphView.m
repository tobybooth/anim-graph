//
//  TOBGraphView.m
//  HomeGrownStaticGraph
//
//  Created by Toby Booth on 8/12/14.
//  Copyright (c) 2014 Toby Booth. All rights reserved.
//

#import "TOBGraphView.h"
#import "TOBHRDataStore.h"
#import "TOBHRDataPoint.h"

@interface TOBGraphView ()

@property (nonatomic) int isRed;

@end


@implementation TOBGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.isRed = 0;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    TOBHRDataStore *ds = [TOBHRDataStore sharedStore];
    NSArray *graphData = [ds allHRBeats];
//    TOBHRDataPoint *startPoint = graphData[0];
    TOBHRDataPoint *startPoint = [graphData firstObject]; // will not crash if theres no item
    
    
    // Multipliers to size graph data to graph area
    float xAxisRatio = bounds.size.width / 60;  //for one minute of data
    float yAxisRatio = bounds.size.height / 120;  //HRRange of 120 beats - will change based on age
    int offset = (30 - [graphData count]) * 2;
    
    // Draw the line
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(offset * xAxisRatio, bounds.size.height - (startPoint.hrRecord - 50) * yAxisRatio)];

    for (int i = 0; i < [graphData count]; i++) {
        TOBHRDataPoint *point = graphData[i];
        [path addLineToPoint:CGPointMake((point.seconds - startPoint.seconds + offset) * xAxisRatio, bounds.size.height - (point.hrRecord - 50) * yAxisRatio)];
    }
    
    path.lineWidth = 3;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineCapStyle = kCGLineCapRound;
    [[UIColor redColor] setStroke];
    [path stroke];
    
    [[UIColor clearColor] setStroke];
    [path addLineToPoint:CGPointMake(path.currentPoint.x, bounds.size.height)];
    [path addLineToPoint:CGPointMake(offset * xAxisRatio, bounds.size.height)];
    [[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.3] setFill];
    [path closePath];
    [path fill];
    [path stroke];
    
    [self setNeedsDisplay];
}


@end
