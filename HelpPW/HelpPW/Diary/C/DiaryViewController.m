//
//  DiaryViewController.m
//  HelpPW
//
//  Created by BurNIng on 16/1/26.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "DiaryViewController.h"
#import "WriteViewController.h"
#import "DiaryHandle.h"
#import "DiaryModel.h"
#import "DiaryCollectionViewCell.h"
#import "TextCollectionViewCell.h"
#import "DiaryDetailViewController.h"
#import "CalendarViewController.h"

@interface DiaryViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionV;
@property (nonatomic, strong) NSMutableArray *diaryArr;
@end

@implementation DiaryViewController

- (void)viewWillAppear:(BOOL)animated {
//  获取本地所有日记
    self.diaryArr = [NSMutableArray arrayWithArray:[DiaryHandle selectDiarySqlite]];
    
    [self.collectionV reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    
//  创建按钮视图，放两个按钮。一个日记，一个日历。
    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    buttonView.backgroundColor = [UIColor redColor];
//  日记按钮
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 2, 40, 40);
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTitle:@"日记" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(doWriteDiary:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:button1];
//  日历按钮
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(60, 2, 40, 40);
    [button2 setTitle:@"日历" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(doPushDate) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:button2];
//  添加到右边按钮上
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonView];

//  获取本地所有日记
    self.diaryArr = [NSMutableArray arrayWithArray:[DiaryHandle selectDiarySqlite]];
    
//  显示日记
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(kWidth/2.5, kWidth/2.5+20);
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.minimumLineSpacing = 20;
    flowLayout.sectionInset = UIEdgeInsetsMake(30, 20, 20, 20);
    self.collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeigth-64) collectionViewLayout:flowLayout];
    self.collectionV.dataSource = self;
    self.collectionV.delegate = self;
    self.collectionV.backgroundColor = [UIColor cyanColor];
    [self.collectionV registerClass:[DiaryCollectionViewCell class] forCellWithReuseIdentifier:@"diary"];
    [self.collectionV registerClass:[TextCollectionViewCell class] forCellWithReuseIdentifier:@"text"];
    [self.view addSubview:self.collectionV];
    
    
}
//  写日记按钮事件
- (void)doWriteDiary:(UIButton *)button {
    WriteViewController *writeVC = [[WriteViewController alloc] init];
    UINavigationController *naviC = [[UINavigationController alloc] initWithRootViewController:writeVC];
    [self presentViewController:naviC animated:YES completion:^{
    }];
}
//  日历按钮事件
- (void)doPushDate {
    CalendarViewController *calendarVC = [[CalendarViewController alloc] init];
    [self presentViewController:calendarVC animated:YES completion:nil];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.diaryArr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DiaryModel *diary = self.diaryArr[indexPath.item];
    if (diary.photoData1) {
        DiaryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"diary" forIndexPath:indexPath];
        cell.diary = diary;
        return cell;
    } else {
        TextCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"text" forIndexPath:indexPath];
        cell.diary = diary;
        return cell;
    }
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DiaryDetailViewController *ddVC = [[DiaryDetailViewController alloc] init];
    DiaryModel *diary = self.diaryArr[indexPath.item];
    ddVC.diary = diary;
    [self.navigationController pushViewController:ddVC animated:YES];
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
