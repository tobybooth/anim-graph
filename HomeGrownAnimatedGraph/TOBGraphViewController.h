//
//  TOBGraphViewController.h
//  HomeGrownStaticGraph
//
//  Created by Toby Booth on 8/12/14.
//  Copyright (c) 2014 Toby Booth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TOBGraphViewController : UIViewController

@property (nonatomic, retain) NSTimer *timer;
- (void)updateGraph:(NSTimer *)t;


@end
