//
//  NSDate+Private.m
//  FootBallAide
//
//  Created by Maple_Li on 15/1/7.
//  Copyright (c) 2015年 Maple_Li. All rights reserved.
//

#import "NSDate+Private.h"

@implementation NSDate (Private)

/**
 *  根据时间戮获取日期与时间
 *
 *  @param style 日期类型
 *  @param time  时间戳
 *
 *  @return 返回日期与时间 11-25 17:40  或  11月25日 17:40
 */
+ (NSString *)getDayandMonth_TimeStyle:(DateStyleType)style withCurrentTime:(NSString *)time
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    if (style == DateStyleTypeDayandMonth) {
        [formatter setDateFormat:@"MM月dd日  HH:mm"];
    }else if (style == DateStyleTypedayandmonth){
        [formatter setDateFormat:@"MM-dd  HH:mm"];
    }
    
    
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[time integerValue]];
    NSString * dateString = [formatter stringFromDate:date];
    
    return dateString;
}

/**
 *  根据时间戮获取日期与星期
 *
 *  @param time 时间戳
 *
 *  @return 返回日期与星期  11月25日  星期一
 */
+ (NSString *)getDayandMonth_WeekByCurrentTime:(NSString*)time
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM月dd日  EEEE"];
    
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[time integerValue]];
    NSString * dateString = [formatter stringFromDate:date];
    
    return dateString;
}

/**
 *  根据时间戮获取日期与时间
 *
 *  @param time 时间戳
 *
 *  @return 返回时间 17:40
 */
+ (NSString *)getClockTimeByCurrentTime:(NSString*)time
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"HH:mm"];
    
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[time integerValue]];
    NSString * dateString = [formatter stringFromDate:date];
    
    return dateString;
}


/**
 *  根據時間戳判斷是否到當時超過半個小時
 *
 *  @param time 時間戳
 *
 *  @return 返回判斷結果
 */
+ (BOOL)isMore_Than_Half_An_HourForCurrentTime:(NSString*)time
{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[time integerValue]];
    
    NSTimeInterval timeInterval = [date timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = timeInterval/60/60;
    if (temp >= 0.5) {
        return YES;
    }
    
    return NO;
}


/**
 *  根據時間戳判斷是否到當時超過一天
 *
 *  @param timej 時間戳
 *
 *  @return 返回判斷結果
 */
+ (BOOL)isMore_than_A_DayForCurrentTime:(NSString*)time
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM月dd日"];
    
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[time integerValue]];
    NSString * dateString = [formatter stringFromDate:date];
    
    NSString * toDateStrng = [formatter stringFromDate:[NSDate date]];
    
    if ([dateString isEqualToString:toDateStrng]) {
        return NO;
    }else{
        return YES;
    }
    
    return NO;
}


/**
 *  根據時間戳判斷是否到當時超過一周
 *
 *  @param time 時間戳
 *
 *  @return 返回判斷結果
 */
+ (BOOL)isMore_Than_A_WeekForCurrentTime:(NSString*)time
{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[time integerValue]];
    
    NSTimeInterval timeInterval = [date timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = timeInterval/60/60/24;
    if (temp >= 7) {
        return YES;
    }
    
    return NO;
}

/**
 *  獲取當前時間戳
 *
 *  @return 返回時間戳
 */
+ (NSString *)getTimestampForNow
{
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //    NSInteger interval = [zone secondsFromGMTForDate:datenow];
    //    NSDate *localeDate = [datenow  dateByAddingTimeInterval: interval];
    //    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[localeDate timeIntervalSince1970]];
    return [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
}

/**
 *  获取所有年份
 *
 *  @return 返回数组
 */
#pragma mark - 获取公历所有年份
+ (NSMutableArray*)getAllYears
{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    for (int i = 1900; i <= 2015; i++) {
        [array addObject:[NSString stringWithFormat:@"%d",i]];
    }
    return array;
}


/**
 *  获取所有月份
 *
 *  @return 返回月份数组
 */
#pragma mark - 获取公历所有月份
+ (NSMutableArray*)getAllMonths
{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    for (int i = 1; i < 13; i++) {
        if (i < 10) {
            [array addObject:[NSString stringWithFormat:@"0%d",i]];
        }else{
            [array addObject:[NSString stringWithFormat:@"%d",i]];
        }
        
    }
    return array;
}

/**
 *  根据年份与月份获取当年当月天数
 *
 *  @param year  年份
 *  @param month 月份
 *
 *  @return 返回天数数组
 */
#pragma mark - 获取公历当年当月总天数
+ (NSMutableArray*)getAllDayByYear:(int)year andMont:(int)month
{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    int day = 0;
    if (((year%4==0 && year%100!=0)||(year%400==0))) {
        if ((month == 1)|| (month == 3)||(month == 5)||(month == 7)||(month == 8)||(month == 10)||(month == 12)) {
            day = 31;
        }else if ((month == 4)|| (month == 6)||(month == 9)||(month == 11)){
            day = 30;
        }else{
            day = 29;
        }
    } else {
        if ((month == 1)|| (month == 3)||(month == 5)||(month == 7)||(month == 8)||(month == 10)||(month == 12)) {
            day = 31;
        }else if ((month == 4)|| (month == 6)||(month == 9)||(month == 11)){
            day = 30;
        }else{
            day = 28;
        }
    }
    for (int i = 1; i <= day; i++) {
        if (i < 10) {
            [array addObject:[NSString stringWithFormat:@"0%d",i]];
        } else {
            [array addObject:[NSString stringWithFormat:@"%d",i]];
        }
        
    }
    return array;
}



@end
