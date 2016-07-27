//
//  BSLoginRequest.m
//  Global
//
//  Created by fanny on 15/12/9.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "BSLoginRequest.h"

@class BSUserInfo;
@implementation BSLoginRequest

/**
 *  登录请求
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)loginRequestWithParameter:(NSDictionary *)param
                          success:(void (^)(BSUserInfo * result))success
                             warn:(void (^)(NSString *warnMsg))warn
                          failure:(void (^)(NSError *error))failure {
    [self postResultHUDWithUrl:account_login param:param resultClass:[BSUserInfo class] success:success warn:warn failure:failure tokenInvalid:nil];
}

/**
 *  注册请求
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)registerRequestWithParameter:(NSDictionary *)param
                             success:(void (^)(BSUserInfo * result))success
                                warn:(void (^)(NSString *warnMsg))warn
                             failure:(void (^)(NSError *error))failure {
    [self postResultHUDWithUrl:account_register param:param resultClass:[BSUserInfo class] success:success warn:warn failure:failure tokenInvalid:nil];
}

/**
 *  获取用户数据请求
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)getUserInfoWithParametar:(NSDictionary *)param
                         success:(void (^)(BSUserInfo * result))success
                            warn:(void (^)(NSString *warnMsg))warn
                         failure:(void (^)(NSError *error))failure
                    tokenInvalid:(void (^)())tokenInvalid {
    [self postResultWithUrl:account_getUserInfo param:param resultClass:[BSUserInfo class] success:success warn:warn failure:failure tokenInvalid:tokenInvalid];
}

/**
 *  退出请求
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)logoutRequestWithParameter:(NSDictionary *)param
                           success:(void (^)(id result))success
                              warn:(void (^)(NSString *warnMsg))warn
                           failure:(void (^)(NSError *error))failure {
    
    [self postResultHUDWithUrl:account_logout
                         param:param
                   resultClass:nil
                       success:success
                          warn:warn
                       failure:failure
                  tokenInvalid:nil];
}

@end
