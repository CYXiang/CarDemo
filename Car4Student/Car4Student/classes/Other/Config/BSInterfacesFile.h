//
//  BSInterfacesFile.h
//  BiShe
//
//  Created by fanny on 15/12/4.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#ifndef BSInterfacesFile_h
#define BSInterfacesFile_h

// 开发环境
#define DEV

// 内网
#ifdef DEV

//#测试环境@不用绑定host
#define Host    @"http://t-apichebao.bishe.com"

/**
 *  是否开启https SSL 验证
 *
 *  @return YES为开启，NO为关闭
 */
#define openHttpsSSL NO

#else
// 正式环境，HTTPS
#define Host    @"http://t-apichebao.bishe.com"

/**
 *  是否开启https SSL 验证
 *
 *  @return YES为开启，NO为关闭
 */
#define openHttpsSSL YES

#endif

/**
 *  SSL 证书名称，仅支持cer格式。“app.bishe.com.cer”,则填“app.bishe.com”
 */
#define certificate @"app.bishe.com"

//  获取用户的车辆信息列表接口
#define mine_myList             @"/car/myList"
//  删除车辆信息接口
#define mine_removeCar          @"/car/remove"
//  编辑车辆信息接口
#define mine_eidtInfo           @"/car/eidtInfo"

#define home_illegal            @"/check/illegal"
//  获取某车辆信息接口
#define home_carInfo            @"/car/carInfo"
//  用户消息推送开关接口
#define mine_settingPush        @"/Users/setting"

//  用户意见提交
#define mine_Feedback           @"/Feedback/opinion"

/**************************************************************************************************************/


/**************************************************************************************************************/

/**
 *  用户相关接口
*/
//  登录
#define account_login           @"/Login/login/"
//  注册
#define account_register        @"/Login/register/"
//  获取用户信息
#define account_getUserInfo     @"?fenlicore_c=site&fenlicore_a=userInfo&m=api"
//  第三方微信登陆
#define account_wechatLogin     @"?fenlicore_c=site&fenlicore_a=wechatlogin&m=api"
//  退出登录
#define account_logout          @"/Login/logout/"

//  发送验证码
#define account_sendsmscode     @"/Sms/sendAutCode/"
//  验证验证码
#define account_checksmscode    @"?fenlicore_c=site&fenlicore_a=checksmscode&m=api"


//  绑定用户手机
#define account_bindMobile      @"/Login/bind"
//  修改绑定手机
#define account_editBindMobile  @"?fenlicore_c=user&fenlicore_a=modPhone&m=api"

//  修改用户密码
#define account_editPwd         @"/Users/revisepwd/"
//  忘记密码/修改密码
#define account_finePwd         @"/Login/forget/"

//  修改昵称
#define account_nickName        @"/Users/editInfo"


/**************************************************************************************************************/
/**
 *  支付相关
 */
// 获取支付剩余时间接口
#define pay_overtime            @"?m=Api&fenlicore_c=Pay&fenlicore_a=getPaymentOvertime"
// 支付成功or失败
#define pay_result              @"?fenlicore_c=Pay&fenlicore_a=getPaymentDetailApp&m=Api"

#endif /* BSInterfacesFile_h */
