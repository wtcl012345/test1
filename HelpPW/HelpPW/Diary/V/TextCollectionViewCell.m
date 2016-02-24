//
//  TextCollectionViewCell.m
//  HelpPW
//
//  Created by BurNIng on 16/1/27.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "TextCollectionViewCell.h"
#import "DiaryModel.h"

@interface TextCollectionViewCell ()
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *contentL;
@property (nonatomic, strong) UILabel *timeL;
@end

@implementation TextCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        self.titleL.textAlignment = NSTextAlignmentCenter;
        self.titleL.textColor = [UIColor blackColor];
        self.titleL.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.titleL];
        
        self.contentL = [[UILabel alloc] initWithFrame:CGRectMake(0, self.titleL.frame.size.height, frame.size.width, frame.size.height-self.titleL.frame.size.height-20)];
        self.contentL.font = [UIFont systemFontOfSize:14];
        self.contentL.textColor = [UIColor blackColor];
        self.contentL.numberOfLines = 0;
        [self.contentView addSubview:self.contentL];
        
        self.timeL = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentL.frame.size.height+self.contentL.frame.origin.y, frame.size.width, 20)];
        self.timeL.textColor = [UIColor magentaColor];
        self.timeL.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.timeL];
    }
    return self;
}

- (void)setDiary:(DiaryModel *)diary {
    _diary = diary;
    self.titleL.text = diary.title;
    self.contentL.text = diary.content;
    self.timeL.text = diary.time;
}

@end
