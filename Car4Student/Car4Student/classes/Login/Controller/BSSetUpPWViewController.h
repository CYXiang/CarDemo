//
//  BSSetUpPWViewController.h
//  Global
//
//  Created by fanny on 15/12/7.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,BSSetUpPasswordOptionType) {
    BSSetUpPasswordOptionTypeForget = 1,     /**<忘记密码*/
    BSSetUpPasswordOptionTypeSetUp = 2,
    BSSetUpPasswordOptionTypeQuickLogin = 3     /**<手机号快速登录*/
};


/**
 *  设置密码
 */
@interface BSSetUpPWViewController : ICBaseViewController

@property (nonatomic, assign) BSSetUpPasswordOptionType optionType;     /**<设置密码类型(注册/忘记密码)*/

@property(nonatomic, copy)NSString *account;    /**<账户（手机号）*/
@property(nonatomic, copy)NSString *smsCode;    /**<验证码*/
@property (nonatomic, copy) NSString *session_id;/**<<#注释#>*/

@end
