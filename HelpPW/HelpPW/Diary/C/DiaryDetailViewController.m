//
//  DiaryDetailViewController.m
//  HelpPW
//
//  Created by BurNIng on 16/1/27.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "DiaryDetailViewController.h"
#import "DiaryModel.h"
#import "DiaryChangeView.h"
#import "PhotoViewController.h"

@interface DiaryDetailViewController ()
@property (nonatomic, strong) UIScrollView *scrollV;
@property (nonatomic, assign) BOOL isChange;
@property (nonatomic, strong) DiaryChangeView *changeV;
@property (nonatomic, strong) UIImageView *imageV1;
@property (nonatomic, strong) UIImageView *imageV2;
@property (nonatomic, strong) UIImageView *imageV3;

@end

@implementation DiaryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.diary.title;
    
    self.scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeigth-64)];
    
    UILabel *contentL = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, kWidth-40, 0)];
    contentL.text = self.diary.content;
    contentL.numberOfLines = 0;
    [contentL sizeToFit];
    [self.scrollV addSubview:contentL];
    
    
    UITapGestureRecognizer *tapGR1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPhoto1:)];
    UITapGestureRecognizer *tapGR2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPhoto2:)];
    UITapGestureRecognizer *tapGR3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPhoto3:)];
    
    // 三张图片展示
    CGFloat height = contentL.frame.origin.y+contentL.frame.size.height; // 滑动量
    
    if (self.diary.image1) {
        self.imageV1 = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth/4, contentL.frame.origin.y+contentL.frame.size.height+10, kWidth/2, self.diary.image1.size.height*(kWidth/2)/self.diary.image1.size.width)];
        self.imageV1.userInteractionEnabled = YES;
        [self.imageV1 addGestureRecognizer:tapGR1];
        self.imageV1.image = self.diary.image1;
        [self.scrollV addSubview:self.imageV1];
        height = self.imageV1.frame.origin.y+self.imageV1.frame.size.height;
    }
    
    if (self.diary.image2) {
        self.imageV2 = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth/4, self.imageV1.frame.origin.y+self.imageV1.frame.size.height+10, kWidth/2, self.diary.image2.size.height*(kWidth/2)/self.diary.image2.size.width)];
        self.imageV2.userInteractionEnabled = YES;
        [self.imageV2 addGestureRecognizer:tapGR2];
        self.imageV2.image = self.diary.image2;
        [self.scrollV addSubview:self.imageV2];
        height = self.imageV2.frame.origin.y+self.imageV2.frame.size.height;
    }
    
    if (self.diary.image3) {
        self.imageV3 = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth/4, self.imageV2.frame.origin.y+self.imageV2.frame.size.height+10, kWidth/2, self.diary.image3.size.height*(kWidth/2)/self.diary.image3.size.width)];
        self.imageV3.userInteractionEnabled = YES;
        [self.imageV3 addGestureRecognizer:tapGR3];
        self.imageV3.image = self.diary.image3;
        [self.scrollV addSubview:self.imageV3];
        height = self.imageV3.frame.origin.y+self.imageV3.frame.size.height;
    }
    
    //  时间
    UILabel *timeL = [[UILabel alloc] initWithFrame:CGRectMake(20, height+20, kWidth-40, 20)];
    timeL.textAlignment = NSTextAlignmentCenter;
    timeL.text = self.diary.time;
    timeL.alpha = 0.6;
    [self.scrollV addSubview:timeL];
    
    self.scrollV.contentSize = CGSizeMake(kWidth, timeL.frame.origin.y+timeL.frame.size.height+10);

    [self.view addSubview:self.scrollV];
        
//  修改按钮
    UIBarButtonItem *changeB = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(changeDiary:)];
    self.navigationItem.rightBarButtonItem = changeB;
    
    self.isChange = NO;
}

//  修改按钮事件
- (void)changeDiary:(UIBarButtonItem *)barButton {
    if (self.isChange == NO) {
        self.changeV = [[DiaryChangeView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeigth-64)];
        self.changeV.diaryM = self.diary;
        [self.view addSubview:self.changeV];
        [self.navigationItem.rightBarButtonItem setTitle:@"完成"];
        self.isChange = YES;
    } else {
#warning 修改数据库
        [self.changeV removeFromSuperview];
        [self.navigationItem.rightBarButtonItem setTitle:@"编辑"];
        self.isChange = NO;
    }
}

//  点击图片 放大全屏查看
- (void)showPhoto1:(UITapGestureRecognizer *)tapGR {
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    [self presentViewController:photoVC animated:YES completion:^{
        photoVC.image = self.diary.image1;
    }];
}
- (void)showPhoto2:(UITapGestureRecognizer *)tapGR {
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    [self presentViewController:photoVC animated:YES completion:^{
        photoVC.image = self.diary.image2;
    }];

}
- (void)showPhoto3:(UITapGestureRecognizer *)tapGR {
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    [self presentViewController:photoVC animated:YES completion:^{
        photoVC.image = self.diary.image3;
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
