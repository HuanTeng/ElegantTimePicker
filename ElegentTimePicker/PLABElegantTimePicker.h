//
//  PLABElegantTimePicker.h
//  ElegantTimePickerExample
//
//  Created by Longyi Li on 8/15/14.
//  Copyright (c) 2014 PhantomLab. All rights reserved.
//

#import <UIKit/UIKit.h>


#define PLAB_ETPSV_PICKER_HEIGHT    175

@protocol PLABElegantTimePickerDelegate <NSObject>

- (void) pickerValueDidChangeWithHourIndex:(int)hour_index andMinIndex:(int)minIndex;

@end

@interface PLABElegantTimePicker : UIView

@property (nonatomic, weak) id<PLABElegantTimePickerDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withHourIndex:(int) hourIndex andMinIndex:(int)minIndex;

@end
