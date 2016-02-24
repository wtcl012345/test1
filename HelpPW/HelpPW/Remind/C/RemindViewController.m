//
//  RemindViewController.m
//  HelpPW
//
//  Created by BurNIng on 16/1/26.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RemindViewController.h"
#import "PregnancyBudgetViewController.h"
@interface RemindViewController ()

@end

@implementation RemindViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
//    [uf setBool:NO forKey:@"haveDate"];
    BOOL YesOrNo = [uf boolForKey:@"haveDate"];
    if (YesOrNo == NO) {
        PregnancyBudgetViewController *pbVC = [[PregnancyBudgetViewController alloc] init];
        UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:pbVC];
        [self presentViewController:naVC animated:YES completion:^{
        }];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
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
