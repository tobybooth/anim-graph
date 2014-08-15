//
//  TOBGraphViewController.m
//  HomeGrownStaticGraph
//
//  Created by Toby Booth on 8/12/14.
//  Copyright (c) 2014 Toby Booth. All rights reserved.
//

#import "TOBGraphViewController.h"
#import "TOBHRDataGenerator.h"
#import "TOBHRDataPoint.h"
#import "TOBHRDataStore.h"
#import "TOBGraphView.h"

@interface TOBGraphViewController ()

@property (nonatomic, weak) IBOutlet TOBGraphView *graphView;
@property (weak, nonatomic) IBOutlet UILabel *hrLabel;

@end

@implementation TOBGraphViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
     NSTimer *timer = [NSTimer timerWithTimeInterval: 0.5
                                             target: self
                                            selector: @selector(updateGraph:)
                                           userInfo: nil
                                            repeats: YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

    
//    [timer fire];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// TODO possibly rename this method
- (void)updateGraph:(NSTimer *)t
{

    TOBHRDataGenerator *hrg = [TOBHRDataGenerator initWithStartingHR:60];
    
    TOBHRDataStore *sharedStore = [TOBHRDataStore sharedStore];

    // generate data
    TOBHRDataPoint *dataPoint = [hrg generateData];
    [sharedStore addDataPointToStore:dataPoint];
    [self.graphView setNeedsDisplay];
    self.hrLabel.text = [NSString stringWithFormat:@"%d", dataPoint.hrRecord];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
