//
//  HYYCalendarCustomCell.m
//  Calendar
//
//  Created by 何亚运 on 16/1/28.
//  Copyright © 2016年 YaYunHe. All rights reserved.
//

#import "HYYCalendarCustomCell.h"

#define showLabelWidth self.frame.size.width
@interface HYYCalendarCustomCell ()

@end
@implementation HYYCalendarCustomCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createLabel];
    }
    return self;
}

// 创建label
- (void)createLabel {
    self.dayLbale = [[UILabel alloc] initWithFrame:CGRectMake(showLabelWidth/4, showLabelWidth/4, showLabelWidth/2, showLabelWidth/2)];
    self.dayLbale.center = self.contentView.center;
    self.dayLbale.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.dayLbale];
    
    self.markLabel = [[UILabel alloc] initWithFrame:CGRectMake(showLabelWidth*3/8, 0, showLabelWidth/4, showLabelWidth/4)];
    self.markLabel.layer.masksToBounds = YES;
    self.markLabel.layer.cornerRadius = showLabelWidth/8;
    self.markLabel.backgroundColor = [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1.0];
    [self.contentView addSubview:self.markLabel];
    
}


@end
