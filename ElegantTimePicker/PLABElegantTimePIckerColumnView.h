//
//  PLABElegantTimePickerColumnView.h
//  ElegantTimePickerExample
//
//  Created by Longyi Li on 8/15/14.
//  Copyright (c) 2014 PhantomLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLABElegantTimePickerTableViewCell.h"

#define PLAB_ETPSV_SINLE_CELL_WIDTH         70
#define PLAB_ETPSV_SINLE_CELL_HEIGHT        50

@protocol PLABElegantTimePickerColumnViewDelegate <NSObject>

- (void) didSelectRowWithType:(int)type andIndex:(int)index;

@end


@interface PLABElegantTimePickerColumnView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, assign) int type;
@property (nonatomic, weak) id<PLABElegantTimePickerColumnViewDelegate> delegate;
@property (nonatomic, readonly) int index;
- (id) initWithType:(int) type andIndex:(int)index;
- (void) selectRowWithIndex:(int) index;

@end
