//
//  BSMemberRequest.h
//  Global
//
//  Created by fanny on 15/12/10.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "BSBaseRequest.h"
#import "BSUserInfo.h"
#import "ICAutCodeModel.h"//验证码模型

@interface BSMemberRequest : BSBaseRequest

/**
 *  获取验证码
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)sendSMSCodeWithParameter:(NSDictionary *)param
                         success:(void (^)(ICAutCodeModel *result))success
                            warn:(void (^)(NSString *warnMsg))warn
                         failure:(void (^)(NSError *error))failure;

/**
 *  验证验证码
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)checkSMSCodeWithParameter:(NSDictionary *)param
                          success:(void (^)(id result))success
                             warn:(void (^)(NSString *warnMsg))warn
                          failure:(void (^)(NSError *error))failure;

/**
 *  手机号码快捷登录
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)quickLoginWithParameter:(NSDictionary *)param
                        success:(void (^)(BSUserInfo *result))success
                           warn:(void (^)(NSString *warnMsg))warn
                        failure:(void (^)(NSError *error))failure;


/**
 *  绑定用户手机
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)bindMobileWithParameter:(NSDictionary *)param
                        success:(void (^)(id result))success
                           warn:(void (^)(NSString *warnMsg))warn
                        failure:(void (^)(NSError *error))failure;

/**
 *  修改绑定手机
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)editBindMobileWithParameter:(NSDictionary *)param
                        success:(void (^)(id result))success
                           warn:(void (^)(NSString *warnMsg))warn
                        failure:(void (^)(NSError *error))failure;

/**
 *  修改用户密码
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)editPasswordWithParameter:(NSDictionary *)param
                          success:(void (^)(ICAutCodeModel *result))success
                             warn:(void (^)(NSString *warnMsg))warn
                          failure:(void (^)(NSError *error))failure;

/**
 *  找回密码（忘记密码）
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中） forget
 */
+ (void)finePasswordWithParameter:(NSDictionary *)param
                          success:(void (^)(ICAutCodeModel *result))success
                             warn:(void (^)(NSString *warnMsg))warn
                          failure:(void (^)(NSError *error))failure;

/**
 *  修改用户性别
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)editGenderWithParameter:(NSDictionary *)param
                        success:(void (^)(id result))success
                           warn:(void (^)(NSString *warnMsg))warn
                        failure:(void (^)(NSError *error))failure
                   tokenInvalid:(void (^)())tokenInvalid;

/**
 *  修改用户昵称
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn    请求失败后，返回对应错误码信息
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)editNickNameWithParameter:(NSDictionary *)param
                          success:(void (^)(id result))success
                             warn:(void (^)(NSString *warnMsg))warn
                          failure:(void (^)(NSError *error))failure;


@end
