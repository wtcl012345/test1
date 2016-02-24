//
//  DiaryChangeView.m
//  HelpPW
//
//  Created by BurNIng on 16/1/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "DiaryChangeView.h"
#import "DiaryModel.h"

@interface DiaryChangeView ()
@property (nonatomic, strong) UITextField *titleTF; // 标题
@property (nonatomic, strong) UITextView *textV; // 正文
@end

@implementation DiaryChangeView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        //  标题Label和TF
        UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 80, 40)];
        titleL.text = @"心情标题";
        titleL.font = [UIFont systemFontOfSize:20];
        [self addSubview:titleL];
        
        self.titleTF = [[UITextField alloc] initWithFrame:CGRectMake(titleL.frame.size.width+titleL.frame.origin.x+10, titleL.frame.origin.y+5, kWidth - titleL.frame.size.width-titleL.frame.origin.x-30, 30)];
        self.titleTF.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:self.titleTF];
        
        //  正文TV
        self.textV = [[UITextView alloc] initWithFrame:CGRectMake(titleL.frame.origin.x, titleL.frame.origin.y+titleL.frame.size.height+20, kWidth-titleL.frame.origin.x-20, kHeigth/4)];
        self.textV.font = [UIFont systemFontOfSize:17];
        self.textV.layer.borderWidth = 0.3;
        self.textV.layer.cornerRadius = 10;
        [self addSubview:self.textV];
        
    }
    return self;
}
- (void)setDiaryM:(DiaryModel *)diaryM {
    _diaryM = diaryM;
    self.titleTF.text = self.diaryM.title;
    self.textV.text = self.diaryM.content;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
