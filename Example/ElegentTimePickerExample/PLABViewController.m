//
//  PLABViewController.m
//  ElegantTimePickerExample
//
//  Created by Longyi Li on 8/15/14.
//  Copyright (c) 2014 PhantomLab. All rights reserved.
//

#import "PLABViewController.h"
#import "PLABElegantTimePicker.h"

@interface PLABViewController ()
<PLABElegantTimePickerDelegate>
@end

@implementation PLABViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
//    PLABElegantTimePickerColumnView* tmpView = [[PLABElegantTimePickerColumnView alloc] initWithType:PLAB_ETPSV_TYPE_HOUR];
//    [self.view addSubview:tmpView];
//    tmpView.frame = CGRectMake(50, 50, CGRectGetWidth( tmpView.frame), CGRectGetHeight( tmpView.frame));
    
//    PLABElegantTimePickerTableViewCell* cell = [[PLABElegantTimePickerTableViewCell alloc] initWithReuseIdentifier:@"resue" type:PLAB_ETPSV_TYPE_HOUR andContentInt:0];
    
    
//    PLABElegantTimePickerColumnView* cell = [[PLABElegantTimePickerColumnView alloc] initWithType:PLAB_ETPSV_TYPE_HOUR];
//    [cell selectRowWithIndex:5];
//    cell.delegate = self;
//        PLABElegantTimePickerColumnView* cell2 = [[PLABElegantTimePickerColumnView alloc] initWithType:PLAB_ETPSV_TYPE_MIN];
//        [cell2 selectRowWithIndex:5];
//    [self.view addSubview:cell];
//        [self.view addSubview:cell2];
//    cell.frame = CGRectMake(0, 50, 160, 150);
//    cell2.frame = CGRectMake(160, 50, 160, 150);
//        cell2.delegate = self;
//    
//    

    PLABElegantTimePicker* v = [[PLABElegantTimePicker alloc] initWithFrame:CGRectMake(0, 30, 320, 150) withHourIndex:7 andMinIndex:1];
    v.delegate = self;
    [self.view addSubview:v];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pickerValueDidChangeWithHourIndex:(NSInteger)hour_index andMinIndex:(NSInteger)minIndex
{
    
}


@end
