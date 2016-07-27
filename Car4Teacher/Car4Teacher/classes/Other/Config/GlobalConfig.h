//
//  GlobalConfig.h
//
//
//  Created by Yiwan on 14-5-4.
//  Copyright (c) 2014年 Yiwan. All rights reserved.






//#ifndef __OPTIMIZE__
//#define NSLog(...) NSLog(__VA_ARGS__)
//#else
//#define NSLog(...) {}
//#endif

//打印调试
#if DEBUG
#define DR_NSLog(fmt,...)    NSLog((@"%s [Line %d] " fmt),__PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);  /**<输出语句*/
#else
#define DR_NSLog(fmt, ...)
#endif



//#define COLOR_RGBA(r,g,b,a) [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:a]
//
////全局色值设定
//#define Color_Red @"f24979"         //
//#define Color_Line @"e2e2e2"        //分割线颜色
//#define GlobalBgColor   @"F8F8F8"   // 全局背景色
//#define GlobalBg [UIColor colorWithHexString:@"F8F8F8"] // 全局背景

//屏幕与系统判定
//#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//
//#define iOS7 ([UIDevice currentDevice].systemVersion.doubleValue >= 7.0)
//#define iPhone5 ([UIScreen mainScreen].bounds.size.width == 320)
//#define iPhone4s ([UIScreen mainScreen].bounds.size.height == 480)
//#define IS_IPHONE_6P (IS_IPHONE && [UIScreen mainScreen].bounds.size.height == 736.0)

// 判断 iPhone4s
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断 iPhone5
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断iphone6
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断iphone6+
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//屏幕大小
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

// 可视范围的起点与调试
#define Visual_Y        64
#define Visual_Height   (ScreenHeight - Visual_Y)
#define Visual_Width    ScreenWidth

//适配6P屏幕调字体
//#define FontSize(size) (IS_IPHONE_6P ? size*1.3 : size)

//边线或分割线
#define Line_side_heihgt     0.5

// 边距
#define padding_24 (24/2)
#define padding_16 (16/2)

//
#define delegateTabBar ((BSTabBarController *)[(AppDelegate *)[[UIApplication sharedApplication] delegate] tabBar])

#define WeakSelf(o)  __weak typeof(o) weakSelf = o;

//通知相关key
#define NSNoti_defaul           [NSNotificationCenter defaultCenter]
#define PUSH_Login              @"pushLogin"    /**<通知弹出登录窗口*/

//沙盒
#define NSUser_defaul           [NSUserDefaults standardUserDefaults]
#define KEY_HistoryArray        @"HistoryArray"

// 用户名记录
#define Record_userName         @"userName"

// 加密，开启签名私钥
#define Private_Key             @"hg/*{s]9|g"

// 友盟Key
#define UMENG_APPKEY            @"5677ab6e67e58ee1ef002535"


// 公共设置字号与色值
#define Font_18                 [UIFont systemFontOfSize:(18/2)]
#define Font_20                 [UIFont systemFontOfSize:(20/2)]
#define Font_22                 [UIFont systemFontOfSize:(22/2)]
#define Font_24                 [UIFont systemFontOfSize:(24/2)]
#define Font_26                 [UIFont systemFontOfSize:(26/2)]
#define Font_28                 [UIFont systemFontOfSize:(28/2)]
#define Font_30                 [UIFont systemFontOfSize:(30/2)]
#define Font_32                 [UIFont systemFontOfSize:(32/2)]
#define Font_48                 [UIFont systemFontOfSize:(48/2)]

// 加粗
#define Font_bold_24            [UIFont boldSystemFontOfSize:(24/2)]


#define Color_2F2F2F            [UIColor colorWithHexString:@"2F2F2F"]      //整体色调
#define Color_777777            [UIColor colorWithHexString:@"777777"]
#define Color_A1A1A1            [UIColor colorWithHexString:@"A1A1A1"]
#define Color_FFFFFF            [UIColor colorWithHexString:@"FFFFFF"]
#define Color_E8F0F5            [UIColor colorWithHexString:@"E8F0F5"]
#define Color_EBEBEB            [UIColor colorWithHexString:@"EBEBEB"]
#define Color_E6F2EE            [UIColor colorWithHexString:@"E6F2EE"]
#define Color_E8E8E8            [UIColor colorWithHexString:@"E8E8E8"]
#define Color_EEEEEE            [UIColor colorWithHexString:@"EEEEEE"]
#define Color_EE0066            [UIColor colorWithHexString:@"EE0066"]
#define Color_C2C2C2            [UIColor colorWithHexString:@"C2C2C2"]
#define Color_F2F2F2            [UIColor colorWithHexString:@"F2F2F2"]
#define Color_D6B176            [UIColor colorWithHexString:@"D6B176"]
#define Color_B1B1B1            [UIColor colorWithHexString:@"B1B1B1"]
#define Color_D5B275            [UIColor colorWithHexString:@"D5B275"]
#define Color_F24979            [UIColor colorWithHexString:@"F24979"]
#define Color_000000            [UIColor colorWithHexString:@"000000"]

#define Color_0F68C3            [UIColor colorWithHexString:@"0f68c3"]
#define Color_F8F8F8            [UIColor colorWithHexString:@"f8f8f8"]
#define Color_FF7623            [UIColor colorWithHexString:@"ff7623"]
#define Color_666666            [UIColor colorWithHexString:@"666666"]
#define Color_999999            [UIColor colorWithHexString:@"999999"]


// 随机色
#define BSColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define BSRandomColor BSColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))


