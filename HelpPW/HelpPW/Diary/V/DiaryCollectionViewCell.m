//
//  DiaryCollectionViewCell.m
//  HelpPW
//
//  Created by BurNIng on 16/1/27.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "DiaryCollectionViewCell.h"
#import "DiaryModel.h"

@interface DiaryCollectionViewCell ()
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *timeL;
@property (nonatomic, strong) UILabel *titleL;

@end

@implementation DiaryCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
        [self.contentView addSubview:self.imageV];
        
        self.titleL = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-60, frame.size.width, 40)];
        self.titleL.backgroundColor = [UIColor blackColor];
        self.titleL.alpha = 0.65;
        self.titleL.textColor = [UIColor whiteColor];
        self.titleL.textAlignment = NSTextAlignmentCenter;
//        self.titleL.font = [UIFont systemFontOfSize:14];
        self.titleL.adjustsFontSizeToFitWidth = YES;
        self.titleL.numberOfLines = 2;
        [self.contentView addSubview:self.titleL];
        
        self.timeL = [[UILabel alloc] initWithFrame:CGRectMake(0, self.imageV.frame.size.height, frame.size.width, 20)];
        self.timeL.textColor = [UIColor magentaColor];
        self.timeL.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.timeL];
    }
    return self;
}

- (void)setDiary:(DiaryModel *)diary {
    _diary = diary;
    self.imageV.image = diary.image1;
    self.timeL.text = diary.time;
    self.titleL.text = diary.title;
}

@end
