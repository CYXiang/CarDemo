//
//  BSTool.m
//  Global
//
//  Created by fanny on 15/12/7.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import "BSTool.h"

@implementation BSTool

/**
 *  画线/创建一个View
 *
 *  @param color 设置背景色
 *
 *  @return 返回创建的View
 */
+ (UIView *)createViewWithColor:(UIColor*)color {
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = color;
    return view;
}

/**
 *  画线/分割线 默认色为#E8E8E8
 *
 *  @return 返回创建的View
 */
+ (UIView *)createLine{
    return [self createViewWithColor:Color_E8E8E8];
}

/**
 *  画线/分割线 默认色为#E8E8E8 ,并设置尺寸
 *
 *  @return 返回创建的View
 */
+ (UIView *)createLineWithFrame:(CGRect)rect
{
    UIView *view = [self createViewWithColor:Color_E8E8E8];
    view.frame = rect;
    return view;
}

/**
 *  处理字符串中的空格与换行
 *
 *  @param string 传入的字符串
 *
 *  @return 返回处理字符串
 */
+ (NSString *) validateLengthIsNullString:(NSString *)string
{
    NSString *newStrng = [string copy];
    //去除前后的空格与换行
    newStrng = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //去除中间的空格
    newStrng = [newStrng stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return newStrng;
}

/**
 *  倒计时GCD通用方法
 *  通常用的计时器都是用NSTimer，但是NSTimer在线程很吃紧的时候效果不佳，使用GCD计时相对更好
 *
 *  @param seconds   倒计时间 单位：秒
 *  @param showLable 需要显示的文本框
 *  @param endBlock  倒计时结束后，回调的Block
 */
+ (void)startTimerWithSeconds:(long)seconds showLable:(UILabel *)showLable endBlock:(void (^)())endBlock
{
    [self startTimerWithSeconds:seconds showLable:showLable strFormat:nil endBlock:endBlock];
}

/**
 *  倒计时GCD通用方法
 *  通常用的计时器都是用NSTimer，但是NSTimer在线程很吃紧的时候效果不佳，使用GCD计时相对更好
 *
 *  @param seconds   倒计时间 单位：秒
 *  @param strFormat 格式化样式，如 "剩%@自动关闭"
 *  @param showLable 需要显示的文本框
 *  @param endBlock  倒计时结束后，回调的Block
 */
+ (void)startTimerWithSeconds:(long)seconds showLable:(UILabel *)showLable strFormat:(NSString *)format endBlock:(void (^)())endBlock
{
    __block long timeout = seconds; // 倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout < 0){ // 倒计时结束，回调block
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                if (endBlock) {
                    endBlock();
                }
            });
        } else{
            
            NSString *strTime = [NSString stringWithFormat:@"%02ld分%02ld秒",(long)(timeout % 3600 / 60), (long)(timeout  % 60)];
            //回到主界面,显示倒计时
            dispatch_async(dispatch_get_main_queue(), ^{
                if (format) { // 判断是否要格式化
                    showLable.text = [NSString stringWithFormat:format,strTime];
                } else {
                    showLable.text = strTime;
                }
            });
            
            timeout--;
        }
    });
    
    dispatch_resume(_timer);
}


@end
