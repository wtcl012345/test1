//
//  CalendarViewController.m
//  HelpPW
//
//  Created by 何亚运 on 16/1/27.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "CalendarViewController.h"
#import "HYYCalendar.h"
@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HYYCalendar *calendar = [[HYYCalendar alloc] initWithCurrentDate:[[NSDate date]initWithTimeIntervalSinceNow:0] andFrame:CGRectMake(10, 30, [UIScreen mainScreen].bounds.size.width-20, [UIScreen mainScreen].bounds.size.height-60)];
    [self.view addSubview:calendar];
    
    UISwipeGestureRecognizer *swipGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismissVC:)];
    swipGR.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipGR];

    
}

- (void)dismissVC:(UISwipeGestureRecognizer *)gr {
    [self dismissViewControllerAnimated:YES completion:nil];
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
