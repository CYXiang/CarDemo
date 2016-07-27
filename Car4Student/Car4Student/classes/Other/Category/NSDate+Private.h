//
//  NSDate+Private.h
//  FootBallAide
//
//  Created by Maple_Li on 15/1/7.
//  Copyright (c) 2015年 Maple_Li. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DateStyleType) {
    DateStyleTypeDayandMonth,   /**<XX月XX日*/
    DateStyleTypedayandmonth    /**<XX-XX*/
};

@interface NSDate (Private)


/**
 *  根据时间戮获取日期与时间
 *
 *  @param style 日期类型
 *  @param time  时间戳
 *
 *  @return 返回日期与时间 11-25 17:40  或  11月25日 17:40
 */
+ (NSString *)getDayandMonth_TimeStyle:(DateStyleType)style withCurrentTime:(NSString *)time;

/**
 *  根据时间戮获取日期与星期
 *
 *  @param time 时间戳
 *
 *  @return 返回日期与星期  11月25日  星期一
 */
+ (NSString *)getDayandMonth_WeekByCurrentTime:(NSString*)time;

/**
 *  根据时间戮获取日期与时间
 *
 *  @param time 时间戳
 *
 *  @return 返回时间 17:40
 */
+ (NSString *)getClockTimeByCurrentTime:(NSString*)time;

/**
 *  根據時間戳判斷是否到當時超過半個小時
 *
 *  @param time 時間戳
 *
 *  @return 返回判斷結果
 */
+ (BOOL)isMore_Than_Half_An_HourForCurrentTime:(NSString*)time;

/**
 *  根據時間戳判斷是否到當時超過一天
 *
 *  @param timej 時間戳
 *
 *  @return 返回判斷結果
 */
+ (BOOL)isMore_than_A_DayForCurrentTime:(NSString*)timej;

/**
 *  根據時間戳判斷是否到當時超過一周
 *
 *  @param time 時間戳
 *
 *  @return 返回判斷結果
 */
+ (BOOL)isMore_Than_A_WeekForCurrentTime:(NSString*)time;


/**
 *  獲取當前時間戳
 *
 *  @return 返回時間戳
 */
+ (NSString *)getTimestampForNow;

/**
 *  获取所有年份
 *
 *  @return 返回数组
 */
+ (NSMutableArray*)getAllYears;

/**
 *  获取所有月份
 *
 *  @return 返回月份数组
 */
+ (NSMutableArray*)getAllMonths;

/**
 *  根据年份与月份获取当年当月天数
 *
 *  @param year  年份
 *  @param month 月份
 *
 *  @return 返回天数数组
 */
+ (NSMutableArray*)getAllDayByYear:(int)year andMont:(int)month;


@end
