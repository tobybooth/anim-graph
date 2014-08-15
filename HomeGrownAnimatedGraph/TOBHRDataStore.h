//
//  TOBHRDataStore.h
//  HomeGrownStaticGraph
//
//  Created by Toby Booth on 8/12/14.
//  Copyright (c) 2014 Toby Booth. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TOBHRDataPoint;

@interface TOBHRDataStore : NSObject

@property (nonatomic, copy) NSArray *allHRBeats;

+ (instancetype)sharedStore;
- (void)addDataPointToStore:(TOBHRDataPoint *)hrDataPoint;

@end


