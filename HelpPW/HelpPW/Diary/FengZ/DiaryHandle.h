//
//  DiaryHandle.h
//  HelpPW
//
//  Created by BurNIng on 16/1/27.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DiaryModel;
@interface DiaryHandle : NSObject
+ (BOOL)insectInfoDiary:(DiaryModel *)diary; // 写入日记
+ (DiaryModel *)SelectActivityWithTitle:(NSString *)title; // 根据标题找日记
+ (DiaryModel *)SelectActivityWithTime:(NSString *)time; // 根据创建时间找日记
+ (NSMutableArray *)selectDiarySqlite; // 读取所有日记

@end
