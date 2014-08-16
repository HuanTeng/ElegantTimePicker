//
//  PLABElegantTiimePickerTableViewCell.h
//  ElegantTimePickerExample
//
//  Created by Longyi Li on 8/15/14.
//  Copyright (c) 2014 PhantomLab. All rights reserved.
//

#import <UIKit/UIKit.h>


#define PLAB_ETPSV_TYPE_HOUR     1
#define PLAB_ETPSV_TYPE_MIN      2

@interface PLABElegantTimePickerTableViewCell : UITableViewCell

- (id) initWithReuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type andContentInt:(NSInteger)contentInt;

@property (nonatomic, assign) NSInteger contentInt;

@end
