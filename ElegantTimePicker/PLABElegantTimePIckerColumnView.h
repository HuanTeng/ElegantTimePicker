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

- (void) didSelectRowWithType:(NSInteger)type andIndex:(NSInteger)index;

@end


@interface PLABElegantTimePickerColumnView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, assign) NSInteger type;
@property (nonatomic, weak) id<PLABElegantTimePickerColumnViewDelegate> delegate;
@property (nonatomic, readonly) NSInteger index;
- (id) initWithType:(NSInteger) type andIndex:(NSInteger)index;
- (void) selectRowWithIndex:(NSInteger) index;

@end
