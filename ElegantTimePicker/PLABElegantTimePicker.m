//
//  PLABElegantTimePicker.m
//  ElegantTimePickerExample
//
//  Created by Longyi Li on 8/15/14.
//  Copyright (c) 2014 PhantomLab. All rights reserved.
//

#import "PLABElegantTimePicker.h"
#import "PLABElegantTimePickerColumnView.h"


@interface PLABElegantTimePicker()
<PLABElegantTimePickerColumnViewDelegate>

@property (nonatomic, strong) PLABElegantTimePickerColumnView* hourColumnView;
@property (nonatomic, strong) PLABElegantTimePickerColumnView* minColumnView;

@end

@implementation PLABElegantTimePicker
- (id)initWithFrame:(CGRect)frame withHourIndex:(NSInteger)hourIndex andMinIndex:(NSInteger)minIndex
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hourColumnView = [[PLABElegantTimePickerColumnView alloc] initWithType:PLAB_ETPSV_TYPE_HOUR andIndex:hourIndex];
        self.minColumnView = [[PLABElegantTimePickerColumnView alloc] initWithType:PLAB_ETPSV_TYPE_MIN andIndex:minIndex];
        self.hourColumnView.delegate = self;
        self.minColumnView.delegate = self;
        UIImage* seperatorImage = [UIImage imageNamed:@"background_Elegant_picker_seperator"];
        UIImageView* seperatorImageView = [[UIImageView alloc] initWithImage:seperatorImage];
        
        UIImageView* topCoverImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_Elegant_picker_top"]];
        UIImageView* bottomCoverImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_Elegant_picker_bottom"]];
        
        
        [self addSubview:self.hourColumnView];
        [self addSubview:self.minColumnView];
        [self addSubview:topCoverImageView];
        [self addSubview:bottomCoverImageView];
        [self addSubview:seperatorImageView];
        [seperatorImageView sizeToFit];
        [topCoverImageView sizeToFit];
        [bottomCoverImageView sizeToFit];
        
        seperatorImageView.frame = CGRectMake(160, 0, CGRectGetWidth(seperatorImageView.bounds), CGRectGetHeight(seperatorImageView.bounds));
        topCoverImageView.frame = CGRectMake(0, 0, CGRectGetWidth(topCoverImageView.bounds), CGRectGetHeight(topCoverImageView.bounds));
        bottomCoverImageView.frame = CGRectMake(0, PLAB_ETPSV_PICKER_HEIGHT - CGRectGetHeight(topCoverImageView.bounds), CGRectGetWidth(bottomCoverImageView.bounds), CGRectGetHeight(topCoverImageView.bounds));
        
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    NSInteger upperMargin = (PLAB_ETPSV_PICKER_HEIGHT - PLAB_ETPSV_SINLE_CELL_HEIGHT*3)/2;
    self.hourColumnView.frame = CGRectMake(0, upperMargin, 160, CGRectGetHeight(self.bounds));
    self.minColumnView.frame = CGRectMake(160, upperMargin, 160, CGRectGetHeight(self.bounds));
}

- (void) didSelectRowWithType:(NSInteger)type andIndex:(NSInteger)index
{
    if (self.delegate)
    {
        [self.delegate pickerValueDidChangeWithHourIndex:self.hourColumnView.index andMinIndex:self.minColumnView.index];
    }
}

@end
