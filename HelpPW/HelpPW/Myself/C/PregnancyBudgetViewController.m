//
//  PregnancyBudgetViewController.m
//  HelpPW
//
//  Created by 何亚运 on 16/1/27.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "PregnancyBudgetViewController.h"
#import "UIColor+AddColor.h"
@interface PregnancyBudgetViewController ()
@property (nonatomic, strong) UILabel *label; // 显示计算结果
@property (nonatomic, strong) UIButton *button; // 开始计算按钮
@property (nonatomic, strong) UIDatePicker *picker; // 选取日期
@property (nonatomic, strong) UIButton *completeB; // 完成按钮
@property (nonatomic, strong) UIDatePicker *datePicker; // 显示日期
@property (nonatomic, strong) UIView *myView;
@end
@implementation PregnancyBudgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"预产期估算";
    self.navigationController.navigationBar.backgroundColor = [UIColor cyanColor];

    self.view.backgroundColor = [UIColor qianweise];
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(15, 80, kWidth-30, kHeigth*3/4)];
    self.myView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myView];
    self.myView.layer.masksToBounds = YES;
    self.myView.layer.cornerRadius = 10;
    [self setTitleL];
    [self setDatePicker];
    [self setBeginB];
    [self setCompleteB];
    [self setShowLabel];

}
//  最上层字体Label
- (void)setTitleL {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, self.myView.bounds.size.width-60, 30)];
    label.text = @"请选择您的末次月经时间";
    [self.myView addSubview:label];
}

//  创建datePicker
- (void)setDatePicker{
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(15, 60, self.myView.bounds.size.width-60, 160)];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"Chinese"];
    [self.myView addSubview:self.datePicker];
    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
}
 //  开始计算按钮
- (void)setBeginB {
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(15, self.datePicker.frame.origin.y+20+150, 100, 30);
    [self.button setTitle:@"开始计算" forState:UIControlStateNormal];
    [self.myView addSubview:self.button];
    self.button.backgroundColor = [UIColor tanguolu];
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius = 10;
    [self.button addTarget:self action:@selector(affirmDate:)forControlEvents:UIControlEventTouchUpInside];
}
//  完成按钮
- (void)setCompleteB{
    self.completeB = [UIButton buttonWithType:UIButtonTypeSystem];
    self.completeB.frame = CGRectMake(self.myView.bounds.size.width-115, self.button.frame.origin.y, 100, 30);
    self.completeB.backgroundColor = [UIColor tanguolu];
    self.completeB.layer.masksToBounds = YES;
    self.completeB.layer.cornerRadius = 10;
    [self.completeB setTitle:@"确认保存" forState:UIControlStateNormal];
    [self.myView addSubview:self.completeB];
    [self.completeB addTarget:self action:@selector(completeAff:)forControlEvents:UIControlEventTouchUpInside];
}
//  显示计算结果的label
- (void)setShowLabel{
    UILabel *labelT = [[UILabel alloc] initWithFrame:CGRectMake(15, self.button.frame.origin.y+30, self.myView.bounds.size.width-60, 30)];
    labelT.text = @"您的预产期是:";
    labelT.font = [UIFont systemFontOfSize:15];
    [self.myView addSubview:labelT];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(self.myView.bounds.size.width/4, self.button.frame.origin.y+60, self.myView.bounds.size.width/2, 30)];
    self.label.font = [UIFont systemFontOfSize:20];
    self.label.textColor = [UIColor redColor];
    self.label.layer.masksToBounds = YES;
    self.label.layer.cornerRadius = 10;
    self.label.textAlignment = NSTextAlignmentCenter;
//    self.label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"labelBG.jpg"]];
    self.label.backgroundColor = [UIColor tanguolu];
    [self.myView addSubview:self.label];
    UILabel *desL = [[UILabel alloc] initWithFrame:CGRectMake(15, self.label.frame.origin.y+40, self.myView.bounds.size.width-30, 30)];
    desL.font = [UIFont systemFontOfSize:15];
    desL.text = @"      结果仅供参考,真正分娩可能发生在预产期的前后两周内.如果您的月经周期不太规律,或者挤不太清楚末次月经的日期,请在妊娠早起根据妇科检查来推算.";
    desL.numberOfLines = 0;
    [desL sizeToFit];
    [self.myView addSubview:desL];
    self.myView.frame = CGRectMake(15, 80, kWidth-30, desL.frame.origin.y+desL.frame.size.height+20);
}



//  只要选取时间,此方法就会走动
- (void)dateChanged:(UIDatePicker *)sender {
    self.picker = (UIDatePicker *)sender;
}
//  开始计算的button
- (void)affirmDate:(id)sender {
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    // 如果没滑动datePicker的情况下给一个当前的时间
    if (!self.picker.date) {
        NSDate *date1 = [NSDate dateWithTimeIntervalSinceNow:8*60*60];
        self.picker = [[UIDatePicker alloc] init];
        self.picker.date = date1;
    }
    // 依据末次月经计算预产期
    NSDate *date = [NSDate dateWithTimeInterval:280*24*60*60 sinceDate:self.picker.date];
    // 将输入的值存入本地,判断下次是否进入输入预产期界面
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
//    [uf setBool:YES forKey:@"haveDate"];
    [uf setObject:self.picker.date forKey:@"beginDate"];
    [uf setObject:date forKey:@"overDate"];

    [f setDateFormat:@"yyyy年MM月dd日"];
    NSString *str = [f stringFromDate:date];
    NSArray *arr = [str componentsSeparatedByString:@" "];
    self.label.text = arr[0];
    
}
//  完成计算按钮
- (void)completeAff:(UIButton *)button {
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
    [uf setBool:YES forKey:@"haveDate"];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
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
