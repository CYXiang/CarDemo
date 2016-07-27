//
//  BSTool.h
//  Global
//
//  Created by fanny on 15/12/7.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSTool : NSObject

/**
 *  画线/创建一个View
 *
 *  @param color 设置背景色
 *
 *  @return 返回创建的View
 */
+ (UIView *)createViewWithColor:(UIColor*)color;

/**
 *  画线/分割线 默认色为#E8E8E8
 *
 *  @return 返回创建的View
 */
+ (UIView *)createLine;

/**
 *  画线/分割线 默认色为#E8E8E8 ,并设置尺寸
 *
 *  @return 返回创建的View
 */
+ (UIView *)createLineWithFrame:(CGRect)rect;

/**
 *  处理字符串中的空格与换行
 *
 *  @param string 传入的字符串
 *
 *  @return 返回处理字符串
 */
+ (NSString *) validateLengthIsNullString:(NSString *)string;

/**
 *  倒计时GCD通用方法
 *  通常用的计时器都是用NSTimer，但是NSTimer在线程很吃紧的时候效果不佳，使用GCD计时相对更好
 *
 *  @param seconds   倒计时间 单位：秒
 *  @param showLable 需要显示的文本框
 *  @param endBlock  倒计时结束后，回调的Block
 */
+ (void)startTimerWithSeconds:(long)seconds showLable:(UILabel *)showLable endBlock:(void (^)())endBlock;

/**
 *  倒计时GCD通用方法
 *  通常用的计时器都是用NSTimer，但是NSTimer在线程很吃紧的时候效果不佳，使用GCD计时相对更好
 *
 *  @param seconds   倒计时间 单位：秒
 *  @param strFormat 格式化样式，如 "剩%@自动关闭"
 *  @param showLable 需要显示的文本框
 *  @param endBlock  倒计时结束后，回调的Block
 */
+ (void)startTimerWithSeconds:(long)seconds showLable:(UILabel *)showLable strFormat:(NSString *)format endBlock:(void (^)())endBlock;


@end
