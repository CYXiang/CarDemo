//
//  ExceptionMsgTips.h
//  Haigoucang
//
//  Created by apple开发 on 15/10/19.
//  Copyright © 2015年 apple开发. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  错误码对照
 */
@interface ExceptionMsgTips : NSObject

/**
 *  用户操作相关请求返回错误
 *
 *  @param code 错误码
 *
 *  @return 提示信息
 */
+ (NSString *)getExceptionMessageAtCode:(int)code;


@end
