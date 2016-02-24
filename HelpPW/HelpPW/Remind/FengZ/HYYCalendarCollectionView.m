//
//  HYYCalendarCollectionView.m
//  Calendar
//
//  Created by 何亚运 on 16/1/28.
//  Copyright © 2016年 YaYunHe. All rights reserved.
//

#import "HYYCalendarCollectionView.h"
#import "HYYCalendarCustomCell.h"

@interface HYYCalendarCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@end
static NSInteger i = 1;
static NSInteger j = 1;
@implementation HYYCalendarCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = frame.size.width/64;
        layout.minimumLineSpacing = frame.size.height/49;
        layout.itemSize = CGSizeMake(frame.size.width/8, frame.size.height/7);
        layout.sectionInset = UIEdgeInsetsMake(frame.size.height/49, frame.size.width/64, frame.size.height/49, frame.size.width/64);
        self.collectionV = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        self.collectionV.backgroundColor = [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1.0];
        self.collectionV.delegate = self;
        self.collectionV.dataSource = self;
        [self.collectionV registerClass:[HYYCalendarCustomCell class] forCellWithReuseIdentifier:@"cell"];
        [self addSubview:self.collectionV];
    }
    return self;
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 42;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HYYCalendarCustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1.0];

    NSInteger firstDayOfMonthIndate = [self whereWeekOfFirstDayOfMonthIndate]; // 第一天星期几
    NSInteger totalDaysOfMonth = [self totalDaysInCurrrentDateMonth:self.date]; // 当前月的总天数
    NSInteger totalDaysOfLastMonth = [self totalDaysInCurrrentDateMonth:[self previousMonthDate]]; // 上个月的总天数
        if (indexPath.item >= firstDayOfMonthIndate && indexPath.item < firstDayOfMonthIndate+totalDaysOfMonth) {
            cell.dayLbale.text = [NSString stringWithFormat:@"%ld",i++];
            cell.dayLbale.textColor = [UIColor blackColor];
            cell.markLabel.backgroundColor = [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1.0];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd"];
            NSDate *dd = [NSDate dateWithTimeIntervalSinceNow:0];
            NSString *string = [formatter stringFromDate:dd];
            
            NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
            [formatter1 setDateFormat:@"yyyy-MM"];
            NSString *str = [[formatter1 stringFromDate:self.date] stringByAppendingString:[NSString stringWithFormat:@"-%@",cell.dayLbale.text]];
            if ([string isEqualToString:str] ) {
                cell.dayLbale.textColor = [UIColor redColor];
                cell.markLabel.backgroundColor = [UIColor magentaColor];
            }
            
            
        }
        if (indexPath.item>=firstDayOfMonthIndate+totalDaysOfMonth) {
             cell.dayLbale.text = [NSString stringWithFormat:@"%ld",j++];
             cell.dayLbale.textColor = [UIColor grayColor];
        }
        if (indexPath.item < firstDayOfMonthIndate) {
            cell.dayLbale.text = [NSString stringWithFormat:@"%ld",totalDaysOfLastMonth-firstDayOfMonthIndate+indexPath.item+1];
            cell.dayLbale.textColor = [UIColor grayColor];
        }


    return cell;
}
// 获取date当前月有多少天
- (NSInteger)totalDaysInCurrrentDateMonth:(NSDate *)date {
    NSRange range = [[NSCalendar currentCalendar]rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}
// 获取date当前月的第一天是星期几
- (NSInteger)whereWeekOfFirstDayOfMonthIndate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:1];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self.date];
    [components setDay:1];
    NSDate *firstDay = [calendar dateFromComponents:components];
    NSDateComponents *firstComponents = [calendar components:NSCalendarUnitWeekday fromDate:firstDay];
    return firstComponents.weekday-1;
}
//  获取下个月日期
- (NSDate *)nextMonthDate {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = 1;
    NSDate *nextMonthDate = [[NSCalendar currentCalendar]dateByAddingComponents:components toDate:self.date options:NSCalendarMatchStrictly];
    return nextMonthDate;
}
//  获取上个月日期
- (NSDate *)previousMonthDate {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = -1;
    NSDate *previousMonthDate = [[NSCalendar currentCalendar]dateByAddingComponents:components toDate:self.date options:NSCalendarMatchStrictly];
    return previousMonthDate;
}
// 重写date的setter方法
- (void)setDate:(NSDate *)date {
    _date = date;
    i = 1;
    j = 1;
    [self.collectionV reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"item::::%ld",indexPath.item);
//    NSLog(@"///////////%ld",[self whereWeekOfFirstDayOfMonthIndate]);
//    NSLog(@"********%ld",indexPath.item-[self whereWeekOfFirstDayOfMonthIndate]+1);
//    
}

@end
