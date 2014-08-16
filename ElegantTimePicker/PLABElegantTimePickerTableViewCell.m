//
//  PLABElegantTiimePickerTableViewCell.m
//  ElegantTimePickerExample
//
//  Created by Longyi Li on 8/15/14.
//  Copyright (c) 2014 PhantomLab. All rights reserved.
//

#import "PLABElegantTimePickerTableViewCell.h"

#define PLAB_ETPSV_SINLE_CELL_WIDTH         160
#define PLAB_ETPSV_SINLE_CELL_HEIGHT        50

#define PLAB_ETPSV_SINLE_CELL_HOUR_COUNT    24
#define PLAB_ETPSV_SINLE_CELL_MIN_COUNT     12

@interface PLABElegantTimePickerTableViewCell()
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) UILabel* label;

@end

@implementation PLABElegantTimePickerTableViewCell

- (id) initWithReuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type andContentInt:(NSInteger)contentInt
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        _type = type;
        [self doLayout];
        self.contentInt = contentInt;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;

}

- (void) doLayout
{
    if (!self.label)
    {
        self.label = [[UILabel alloc] init];
        self.label.font = [UIFont fontWithName:@"AvenirNext-Medium" size:46];
        if (self.type == PLAB_ETPSV_TYPE_HOUR)
        {
            self.label.frame = CGRectMake(89, 0, PLAB_ETPSV_SINLE_CELL_WIDTH, PLAB_ETPSV_SINLE_CELL_HEIGHT);
        }
        else
        {
            self.label.frame = CGRectMake(20, 0, PLAB_ETPSV_SINLE_CELL_WIDTH, PLAB_ETPSV_SINLE_CELL_HEIGHT);
        }
        
        self.label.textColor = [UIColor colorWithWhite:0.4 alpha:1];
        self.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1];
        [self addSubview:self.label];
    }
}

- (void) setContentInt:(NSInteger)contentInt
{
    self.label.text = [NSString stringWithFormat:@"%.2d", contentInt];
}

@end
