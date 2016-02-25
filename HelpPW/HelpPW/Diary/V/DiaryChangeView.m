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
@property (nonatomic, strong) NSMutableArray *imageArr; // 图片
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
        self.textV = [[UITextView alloc] initWithFrame:CGRectMake(titleL.frame.origin.x, titleL.frame.origin.y+titleL.frame.size.height+20, kWidth-titleL.frame.origin.x-20, kHeigth/3)];
        self.textV.font = [UIFont systemFontOfSize:17];
        self.textV.layer.borderWidth = 0.3;
        self.textV.layer.cornerRadius = 10;
        [self addSubview:self.textV];
        
        //  图片Button
        self.imageArr = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < 3; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(self.textV.frame.origin.x+(kWidth/4+10)*i+10, self.textV.frame.origin.y+self.textV.frame.size.height+20, kWidth/4, kWidth/4);
            [self addSubview:button];
            [self.imageArr addObject:button];
        }
        
        
        
        
    }
    return self;
}
- (void)setDiaryM:(DiaryModel *)diaryM {
    _diaryM = diaryM;
    self.titleTF.text = self.diaryM.title;
    self.textV.text = self.diaryM.content;
    if (diaryM.image1) {
        UIButton *button = self.imageArr[0];
        [button setImage:diaryM.image1 forState:UIControlStateNormal];
        [button addTarget:self action:@selector(changePhoto:) forControlEvents:UIControlEventTouchUpInside];
    }
    if (diaryM.image2) {
        UIButton *button = self.imageArr[1];
        [button setImage:diaryM.image2 forState:UIControlStateNormal];
        [button addTarget:self action:@selector(changePhoto:) forControlEvents:UIControlEventTouchUpInside];
    }
    if (diaryM.image3) {
        UIButton *button = self.imageArr[2];
        [button setImage:diaryM.image3 forState:UIControlStateNormal];
        [button addTarget:self action:@selector(changePhoto:) forControlEvents:UIControlEventTouchUpInside];
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
