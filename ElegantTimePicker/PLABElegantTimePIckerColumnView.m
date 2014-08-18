//
//  PLABElegantTimePickerColumnView.m
//  ElegantTimePickerExample
//
//  Created by Longyi Li on 8/15/14.
//  Copyright (c) 2014 PhantomLab. All rights reserved.
//

#import "PLABElegantTimePickerColumnView.h"
#import "PLABElegantTimePickerTableViewCell.h"


#define PLAB_ETPSV_SINLE_CELL_HOUR_COUNT    24
#define PLAB_ETPSV_SINLE_CELL_MIN_COUNT     12
#define PLAB_ETPSV_LARGE_NUMBER             99999


@interface PLABElegantTimePickerColumnView()
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, assign) NSInteger initIndex;
@property (nonatomic, assign) NSInteger index;
@end

@implementation PLABElegantTimePickerColumnView

- (id)initWithFrame:(CGRect)frame
{
    assert(NO);
    return [self init];
}

- (id) initWithType:(NSInteger) type andIndex:(NSInteger)index
{
    self = [super initWithFrame:CGRectMake(0, 0, PLAB_ETPSV_SINLE_CELL_WIDTH, PLAB_ETPSV_SINLE_CELL_HEIGHT)];
    if (self) {
        self.type = type;
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self addSubview:self.tableView];
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.tableView.showsHorizontalScrollIndicator = NO;
        self.tableView.showsVerticalScrollIndicator = NO;
        self.tableView.separatorColor = [UIColor clearColor];
        self.initIndex = index;
        self.index = index;
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
    if (self.initIndex >= 0)
    {
        [self selectRowWithIndex:self.initIndex];
    }
    self.initIndex = -1;
}

- (void) selectRowWithIndex:(NSInteger) index
{
    NSInteger tableViewIndexInMiddle = PLAB_ETPSV_LARGE_NUMBER / PLAB_ETPSV_SINLE_CELL_HOUR_COUNT / 2 * PLAB_ETPSV_SINLE_CELL_HOUR_COUNT + index;
    NSIndexPath* path = [NSIndexPath indexPathForRow:tableViewIndexInMiddle inSection:0];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* reuseId = self.type == PLAB_ETPSV_TYPE_HOUR ? @"PLAB_ETPSV_TYPE_HOUR" : @"PLAB_ETPSV_TYPE_MIN";
    NSInteger contentInt = [self contentIntWithIndex:indexPath.row];
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell)
    {
        cell = [[PLABElegantTimePickerTableViewCell alloc] initWithReuseIdentifier:reuseId type:self.type andContentInt:contentInt];
    }
    else
    {
        [(PLABElegantTimePickerTableViewCell*)cell setContentInt:contentInt];
    }
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return PLAB_ETPSV_LARGE_NUMBER;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return PLAB_ETPSV_SINLE_CELL_HEIGHT;
}

- (NSInteger) uniqueRowCount
{
    return self.type == PLAB_ETPSV_TYPE_HOUR ? PLAB_ETPSV_SINLE_CELL_HOUR_COUNT :PLAB_ETPSV_SINLE_CELL_MIN_COUNT;
}


- (NSInteger) contentIntWithIndex:(NSInteger) index
{
    if (self.type == PLAB_ETPSV_TYPE_HOUR)
    {
        return index % PLAB_ETPSV_SINLE_CELL_HOUR_COUNT;
    }
    else if (self.type == PLAB_ETPSV_TYPE_MIN)
    {
        NSInteger interval = 60/PLAB_ETPSV_SINLE_CELL_MIN_COUNT;
        return (index % PLAB_ETPSV_SINLE_CELL_MIN_COUNT) * interval;
    }
    else
    {
        assert(NO);
        return 0;
    }
    
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate)
        return;
    [self scrollViewDidEndDecelerating:scrollView];
}


- (void)scrollViewDidEndDecelerating:(UITableView *)tableView
{
    NSIndexPath* path = [tableView indexPathForRowAtPoint: CGPointMake(tableView.contentOffset.x, tableView.contentOffset.y+tableView.rowHeight/2)];
    [tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:YES];
    self.index = ((path.row + 1) % self.uniqueRowCount);
    if ([self.delegate respondsToSelector:@selector(didSelectRowWithType:andIndex:)])
    {
        [self.delegate didSelectRowWithType:self.type andIndex:self.index];
    }
    
    
}

@end
