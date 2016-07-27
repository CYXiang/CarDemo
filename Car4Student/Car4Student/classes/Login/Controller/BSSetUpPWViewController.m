//
//  BSSetUpPWViewController.m
//  Global
//
//  Created by fanny on 15/12/7.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import "BSSetUpPWViewController.h"
#import "BSLoginRequest.h"  //注册
#import "BSMemberRequest.h" //请求

@interface BSSetUpPWViewController ()<UITextFieldDelegate>
{
    UITextField * accountTF;    /**<密码输入框*/
    UITextField * passwordTF;    /**<再次密码输入框*/
    UIButton * sendCode;    /**<获取验证码按钮*/
}

@end

@implementation BSSetUpPWViewController

static NSInteger const lineHeight = 42;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = Color_F8F8F8;
    
    //分割线
    UIView * lineView = [BSTool createLine];
    lineView.backgroundColor = Color_FFFFFF;
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(73);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(lineHeight));
    }];
    
    //密码输入框
    accountTF = [[UITextField alloc] init];
    accountTF.delegate = self;
    accountTF.font = Font_28;
    accountTF.textColor = Color_2F2F2F;
    accountTF.keyboardType = UIKeyboardTypePhonePad;
    accountTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [accountTF setValue:Font_28 forKeyPath:@"_placeholderLabel.font"];
    [accountTF setValue:Color_C2C2C2 forKeyPath:@"_placeholderLabel.textColor"];
    [lineView addSubview:accountTF];
    [accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_left).offset(padding_24);
        make.right.equalTo(lineView.mas_right).offset(-padding_24);
        make.centerY.equalTo(lineView.mas_centerY);
    }];
    
    //密码输入框下的lineBlack
    UIView * lineView1 = [BSTool createLine];
    lineView1.backgroundColor = Color_FFFFFF;
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(9);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(lineHeight));
    }];
    
    //密码输入框
    passwordTF = [[UITextField alloc] init];
    passwordTF.delegate = self;
    passwordTF.font = Font_28;
    passwordTF.textColor = Color_2F2F2F;
    passwordTF.keyboardType = UIKeyboardTypeDefault;
    passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTF.secureTextEntry = YES;
    [passwordTF setValue:Font_28 forKeyPath:@"_placeholderLabel.font"];
    [passwordTF setValue:Color_C2C2C2 forKeyPath:@"_placeholderLabel.textColor"];
    [lineView1 addSubview:passwordTF];
    [passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.with.equalTo(lineView1.mas_left).offset(padding_24);
        make.right.with.equalTo(lineView1.mas_right).offset(-padding_24);
        make.centerY.equalTo(lineView1);
    }];
    
    
    //保存按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.layer.cornerRadius = 2;
    loginBtn.backgroundColor = Color_0F68C3;
    loginBtn.titleLabel.font = Font_28;
    [loginBtn setTitleColor:Color_FFFFFF forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(setUpSaveButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).offset(36);
        make.left.equalTo(self.view).offset(padding_24);
        make.right.equalTo(self.view).offset(-padding_24);
        make.height.equalTo(loginBtn.mas_width).multipliedBy(0.12);
    }];
    
    switch (self.optionType) {
        
        case BSSetUpPasswordOptionTypeForget: {
            accountTF.keyboardType = UIKeyboardTypePhonePad;
            passwordTF.keyboardType = UIKeyboardTypeNumberPad;
//            accountTF.secureTextEntry = YES;  //密码隐藏
//            passwordTF.secureTextEntry = YES;  //密码隐藏
            accountTF.placeholder = @"请正确的输入11位的手机号码";
            passwordTF.placeholder = @"请输入手机短信中的验证码";

            
            //验证码
            sendCode = [UIButton buttonWithType:UIButtonTypeCustom];
            sendCode.titleLabel.font = Font_24;
            sendCode.layer.masksToBounds = YES;
            sendCode.layer.borderWidth = 0.5;
            sendCode.layer.cornerRadius = 2;
            sendCode.layer.borderColor = Color_0F68C3.CGColor;
            [sendCode setTitle:@"获取验证码" forState:UIControlStateNormal];
            [sendCode setTitleColor:Color_0F68C3 forState:UIControlStateNormal];
            [sendCode addTarget:self action:@selector(setUpPasswordCheckBtnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [lineView1 addSubview:sendCode];
            [sendCode mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(lineView1);
                make.right.equalTo(lineView1.mas_right).offset(-12);
                make.width.equalTo(@80);
                make.height.equalTo(@28);
            }];
            
            [passwordTF mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lineView1.mas_left).offset(padding_24);
                make.right.equalTo(sendCode.mas_left).offset(-10);
                make.centerY.equalTo(lineView1.mas_centerY);
            }];
            
            
            [loginBtn setTitle:@"验证" forState:UIControlStateNormal];
            break;
        }
        case BSSetUpPasswordOptionTypeSetUp: {
            accountTF.keyboardType = UIKeyboardTypeDefault;
            passwordTF.keyboardType = UIKeyboardTypeDefault;
            accountTF.secureTextEntry = YES;  //密码隐藏
            passwordTF.secureTextEntry = YES;  //密码隐藏
            accountTF.placeholder = @"请输入新密码";
            passwordTF.placeholder = @"请确认新密码";
            
            [loginBtn setTitle:@"提交" forState:UIControlStateNormal];
            break;
        }
        case BSSetUpPasswordOptionTypeQuickLogin: {
            accountTF.keyboardType = UIKeyboardTypePhonePad;
            passwordTF.keyboardType = UIKeyboardTypeDefault;
            accountTF.secureTextEntry = YES;  //密码隐藏
            passwordTF.secureTextEntry = YES;  //密码隐藏
            
            [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
            break;
        }
        default: {
            break;
        }
    }
    
}

#pragma mark --  保存按钮事件
- (void)setUpSaveButtonClick:(UIButton *)sender {
    
    switch (self.optionType) {
        case BSSetUpPasswordOptionTypeForget: {
            //修改密码
            
            if ([[BSTool validateLengthIsNullString:accountTF.text] length] == 0) {
                [MBProgressHUD showText:@"请输入手机号码"];
                break;
            }
            
            if (![accountTF.text isValidateMobile]) {
                [MBProgressHUD showText:@"手机号码格式不对"];
                break;
            }
            
            if (![passwordTF.text isPureNumandCharacters]) {
                [MBProgressHUD showText:@"请输入六位纯数字验证码"];
                break;
            }
            
            BSSetUpPWViewController * setup = [[BSSetUpPWViewController alloc] init];
            setup.title = @"修改密码";
            setup.account = accountTF.text;
            setup.smsCode = passwordTF.text;
            setup.session_id = self.session_id;
            setup.optionType = BSSetUpPasswordOptionTypeSetUp;
            [self.navigationController pushViewController:setup animated:YES];
            
            break;
        }
        case BSSetUpPasswordOptionTypeSetUp: {
            //重新设置密码
            
            if (![accountTF.text isPassword]) {
                [MBProgressHUD showText:@"输入的密码格式不对"];
                return;
            }
            
            WeakSelf(self)
            NSString *session = self.session_id;
            NSDictionary *parameter = @{@"mobile_number":self.account,@"captcha":self.smsCode,@"password":accountTF.text,@"repassword":passwordTF.text,@"session_id":session};
            [BSMemberRequest finePasswordWithParameter:parameter success:^(ICAutCodeModel *result) {
                
                [MBProgressHUD showText:[NSString stringWithFormat:@"%@",result.tip]];
                [weakSelf.navigationController popToRootViewControllerAnimated:YES];
            } warn:^(NSString *warnMsg) {
                [MBProgressHUD showText:warnMsg];
                
            } failure:^(NSError *error) {
                
            }];
            break;
        }
        case BSSetUpPasswordOptionTypeQuickLogin: {
            //快速登录
            
            break;
        }
        default: {
            break;
        }
    }
}

// 获取验证码
- (void)setUpPasswordCheckBtnButtonClick:(UIButton *)sender {
    NSDictionary *parameter = @{@"phone":accountTF.text,@"action":@"forget"};
    [BSMemberRequest sendSMSCodeWithParameter:parameter success:^(ICAutCodeModel *result) {
        self.session_id = result.session_id;
        
        [self setTimer];
        [accountTF resignFirstResponder];
        [passwordTF becomeFirstResponder];
        [MBProgressHUD showText:[NSString stringWithFormat:@"%@",result.tip]];
    } warn:^(NSString *warnMsg) {
        [MBProgressHUD showText:warnMsg];
        
    } failure:^(NSError *error) {
        
    }];
    
}
// MARK:倒计时
- (void)setTimer {
    __block int timeout = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        // 倒计时结束
        if (timeout <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                sendCode.userInteractionEnabled = YES;
                [sendCode setTitle:@"获取验证码" forState:UIControlStateNormal];
                [sendCode setTitleColor:Color_A1A1A1 forState:UIControlStateNormal];
            });
        }
        else {
            int seconds = timeout % 61;
            NSString *strTime = [NSString stringWithFormat:@"%.2d",seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [sendCode setTitleColor:Color_A1A1A1 forState:UIControlStateNormal];
                [sendCode setTitle:[NSString stringWithFormat:@"%@秒",strTime] forState:UIControlStateNormal];
                sendCode.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
}

#pragma mark -- 点击空白处收起键盘
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
