//
//  ExceptionMsgTips.m
//  Haigoucang
//
//  Created by apple开发 on 15/10/19.
//  Copyright © 2015年 apple开发. All rights reserved.
//

#import "ExceptionMsgTips.h"
#import <Security/Security.h>

@implementation ExceptionMsgTips


+ (NSString *)getExceptionMessageAtCode:(int)code {
    NSString *msg = @"系统繁忙";
    
    switch (code) {
/******************************************************************************************************************************/
        case 270000:
            msg = @"参数缺失";
            break;
        case 272001:
            msg = @"token已过期，需要重新登录";
            break;
/***************手机号***************************************************************************************************************/
            
        case 272010:
            msg = @"手机参数缺失";
            break;
        case 272011:
            msg = @"手机参数错误";
            
            break;
        case 272012:
            msg = @"手机还没有注册";
            
            break;
        case 272013:
            msg = @"手机已注册";
            
            break;
            
            
/****************用户**************************************************************************************************************/
            
        case 272020:
            msg = @"用户名参数缺失";
            break;
        case 272021:
            msg = @"用户已注册";
            
            break;
        case 272023:
            msg = @"用户还没有注册";
            
            break;
        case 272024:
            msg = @"用户id参数缺失";
            
            break;
        case 272025:
            msg = @"用户已绑定手机";
            
            break;
        case 272026:
            msg = @"昵称太长";
            
            break;
        case 272027:
            msg = @"昵称没有填写";
            
            break;
            
/****************验证码**************************************************************************************************************/
        case 272030:
            msg = @"验证码参数缺失";
            
            break;
        case 272031:
            msg = @"验证码不正确";
            
            break;
        case 272032:
            msg = @"验证码已过期";
            
            break;
            
/*****************密码*************************************************************************************************************/
        case 272040:
            msg = @"密码参数缺失";
            break;
        case 272043:
            msg = @"密码格式不正确";
            break;
        case 272044:
            msg = @"密码错误";
            break;
        case 272045:
            msg = @"密码参数缺失";
            break;
        case 272046:
            msg = @"密码格式不正确";
            
            break;
        case 272047:
            msg = @"原密码参数缺失";
            
            break;
        case 272048:
            msg = @"新密码参数缺失";
            
            break;
        case 272049:
            msg = @"原密码不正确";
            
            break;
            
/*****************登录*************************************************************************************************************/
            
        case 272050:
            msg = @"手机号或密码错误";
            
            break;
        case 272051:
            msg = @"用户名或密码错误";
            
            break;
        case 272053:
            msg = @"绑定失败";
            
            break;
        case 272054:
            msg = @"性别参数缺失";
            
            break;
        case 273001:
            msg = @"用户名不能为空";
            
            break;
        case 273002:
            msg = @"查询用户信息出错";
            
            break;
        case 273003:
            msg = @"修改失败";
            
            break;
        case 273004:
            msg = @"绑定失败";
            
            break;
            
        case 275001:
            msg = @"登陆失效";
            
            break;
        case 275002:
            msg = @"无该用户信息";
            
            break;
        case 275003:
            msg = @"该商户下没有用户";
            
            break;
        
        case 275005:
            msg = @"帐号或密码错误";
            break;
        case 275006:
            msg = @"注册失败";
            
            break;
        case 275007:
            msg = @"用户名已经存在";
            
            break;
        case 275008:
            msg = @"邮箱地址已经存在";
            
            break;
        case 275009:
            msg = @"必填参数缺失";
            
            
            break;
        case 275011:
            msg = @"帐号没有填写";
            
            break;
        case 275012:
            msg = @"密码没有填写";
            
            break;
        case 275013:
            msg = @"确认密码没有填写";
            
            break;
        case 275014:
            msg = @"邮箱地址没有填写";
            
            break;
            
        case 275015:
            msg = @"新密码没有填写";
            break;
        case 275016:
            msg = @"密码须由4-20位字母、数字、下划线(_)组合";
            
            break;
        case 275017:
            msg = @"新密码与旧密码相同";
            
            break;
        case 275018:
            msg = @"用户名须由4-20位字母、数字、下划线(_)组合";
            
            break;
        case 275019:
            msg = @"昵称没有填写";
            break;
        case 275020:
            msg = @"原密码没有填写";
            break;
        case 275021:
            msg = @"邮箱地址不正确";
            break;
        case 275022:
            msg = @"两次输入的密码不相同";
            break;
        case 275023:
            msg = @"用户没有登录";
            break;
        case 275024:
            msg = @"验证码没有填写";
            break;
        case 275025:
            msg = @"验证码不正确";
            break;
        case 275054:
            msg = @"性别参数缺失";
            break;
            
            
        case 275026:
            msg = @"手机号码没有填写";
            break;
        case 275027:
            msg = @"手机号码不正确";
            break;
        case 275028:
            msg = @"该手机号码已注册";
            break;
        case 275029:
            msg = @"'该帐号没有绑定手机号，无法找回密码";
            break;
        case 275030:
            msg = @"请先获取验证码";
            break;
        case 275031:
            msg = @"验证码已超时，请重新获取验证码";
            break;
        case 275032:
            msg = @"性别没有选择";
            break;
        case 275033:
            msg = @"原密码错误";
            break;
            
        case 276000:
            msg = @"请填写正确的身份证号码";
            break;
        case 276001:
            msg = @"实名认证失败";
            break;
        case 276002:
            msg = @"请输入正确的手机号码";
            break;
        case 276003:
            msg = @"请输入正确的邮件地址";
            break;
        case 276004:
            msg = @"名字只能是中文，英文，或中英文，长度为3-20字节";
            break;
        case 276005:
            msg = @"名字不能空，长度为3-20字节";
            break;
        case 276006:
            msg = @"请选择省";
            break;
        case 276007:
            msg = @"请选择市";
            break;
        case 276008:
            msg = @"请选择区";
            break;
        case 276009:
            msg = @"请选择街道";
            break;
        case 276010:
            msg = @"请输入详细的地址，最少3个字";
            break;
        case 276011:
            msg = @"请输入内容";
            break;
        case 276012:
            msg = @"请输入正确的联系方式，手机号或者邮件号";
            break;
        case 276013:
            msg = @"请先登录";
            break;
        case 276014:
            msg = @"操作错误";
            break;
        case 276017:
            msg = @"设置默认地址失败";
            break;

/*****************三级联动地址信息*************************************************************************************************************/

        case 276015:
            msg = @"父级id缺失";
            break;
        case 276016:
            msg = @"地址id缺失";
            break;
        case 277001:
            msg = @"请输入代金券激活码";
            break;
        case 277002:
            msg = @"请输入正确的代金券激活码";
            break;
        case 278001:
            msg = @"用户接口异常";
            break;
            /*
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
        case 00000:
            msg = @"_";
            break;
*/
            
        default:
            msg = @"未知错误";
            break;
    }
    
    return msg;
}


- (SecKeyRef)getPublicKey {
    NSString *certPath = [[NSBundle mainBundle] pathForResource:@"keystore" ofType:@"gem"];
    SecCertificateRef myCer = nil;
    NSData *certificateData = [[NSData alloc] initWithContentsOfFile:certPath];
    myCer = SecCertificateCreateWithData(kCFAllocatorDefault, (CFDataRef)certificateData);
    SecPolicyRef myPolicy = SecPolicyCreateBasicX509();
    SecTrustRef mytrust;
    OSStatus status = SecTrustCreateWithCertificates(myCer, myPolicy, &mytrust);
    SecTrustResultType trustResult;
    if (status == noErr) {
        status = SecTrustEvaluate(mytrust, &trustResult);
    }
    return SecTrustCopyPublicKey(mytrust);
}

@end
