//
//  TOBHRDataStore.m
//  HomeGrownStaticGraph
//
//  Created by Toby Booth on 8/12/14.
//  Copyright (c) 2014 Toby Booth. All rights reserved.
//

#import "TOBHRDataStore.h"

@interface TOBHRDataStore ()

@property (nonatomic, strong) NSMutableArray *privateHRData;

@end

@implementation TOBHRDataStore

#pragma mark - Initializers

+ (instancetype)sharedStore;
{
    static TOBHRDataStore *sharedStore;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[TOBHRDataStore sharedStore]"];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _privateHRData = [[NSMutableArray alloc] init];
        NSLog(@" ");
    }
    return self;
}

#pragma mark - Actions

- (void)addDataPointToStore:(TOBHRDataPoint *)hrDataPoint
{
    if ([self.privateHRData count] < 31) {
        [self.privateHRData addObject:hrDataPoint];
    } else {
        [self.privateHRData removeObjectAtIndex:0];
        [self.privateHRData addObject:hrDataPoint];
    }
}

- (NSArray *)allHRBeats
{
    return [self.privateHRData copy];
}
@end
