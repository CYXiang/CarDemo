//
//  BSHUDView.m
//  BiShe
//
//  Created by fanny on 15/12/4.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import "BSHUDView.h"


@implementation BSHUDView

//+ (void)showStateHUDWithText:(NSString *)text {
//    UIWindow *window = [[UIApplication sharedApplication].delegate window];
//    window.userInteractionEnabled = NO;
//    CGSize size = [Tool contentWidthWithText:text fontSize:14 maxHeight:32];
//    __block UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width + 20, size.height + 20)];
//    lab.backgroundColor = [UIColor colorWithHexString:@"000000"];
//    lab.textColor = [UIColor colorWithHexString:@"ffffff"];
//    lab.font = [UIFont systemFontOfSize:14];
//    lab.text = text;
//    lab.center = window.center;
//    lab.textAlignment = NSTextAlignmentCenter;
//    lab.layer.masksToBounds = YES;
//    lab.layer.cornerRadius = 2.0;
//    lab.alpha = 0;
//    [window addSubview:lab];
//    
//    [UIView animateWithDuration:0.25 animations:^{
//        lab.alpha = 0.6;
//    } completion:^(BOOL finished) {
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [UIView animateWithDuration:0.5 animations:^{
//                lab.alpha = 0;
//            } completion:^(BOOL finished) {
//                [lab removeFromSuperview];
//                window.userInteractionEnabled = YES;
//            }];
//        });
//        
//        
//    }];
//}
//
//
//+ (void)showLoadingWithText:(NSString *)string {
//    UIWindow *window = [[UIApplication sharedApplication].delegate window];
//    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
//    [window addSubview:hud];
//    hud.tag = 999999999;
//    if ([string isEqualToString:@""] || string == nil) {
//        hud.labelText = @"正在加载数据";
//    } else {
//        hud.labelText = string;
//    }
//    hud.dimBackground = NO;
//    [hud show:YES];
//}
//
//+ (void)hiddenLoding {
//    UIWindow *window = [[UIApplication sharedApplication].delegate window];
//    [[window viewWithTag:999999999] removeFromSuperview];
//}

@end
