//
//  BSBindViewController.m
//  Global
//
//  Created by apple开发 on 16/1/20.
//
//

#import "BSBindViewController.h"
#import "BSMemberRequest.h" //请求
#import "BSLoginRequest.h"  //请求接口
#import "BSLoginViewController.h"

@interface BSBindViewController ()<UITextFieldDelegate>
{
    UITextField * accountTF;    /**<账号输入框*/
    UITextField * codeTF;       /**<验证码输入框*/
    UITextField * passwordTF;    /**<密码输入框*/
    UIButton * sendCode;    /**<获取验证码按钮*/
}

@end

@implementation BSBindViewController

static NSInteger const lineHeight = 42;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;
    
    
    //界面初始化
    [self initLoginLayout];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController.navigationBar setBarTintColor:Color_0F68C3];
    
    UIColor * color = [UIColor whiteColor];
    
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
}

#pragma mark -- 初始化
- (void)initLoginLayout {
    
    //账号输入框下的view
    UIView * lineBlack = [BSTool createLine];
    lineBlack.backgroundColor = Color_FFFFFF;
    [self.view addSubview:lineBlack];
    [lineBlack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(73);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(lineHeight));
    }];
    
    //账号输入框
    accountTF = [[UITextField alloc] init];
    accountTF.delegate = self;
    accountTF.font = Font_28;
    accountTF.textColor = Color_2F2F2F;
    accountTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [accountTF setValue:Font_28 forKeyPath:@"_placeholderLabel.font"];
    [accountTF setValue:Color_C2C2C2 forKeyPath:@"_placeholderLabel.textColor"];
    [lineBlack addSubview:accountTF];
    [accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineBlack.mas_left).offset(padding_24);
        make.right.equalTo(lineBlack.mas_right).offset(-padding_24);
        make.centerY.equalTo(lineBlack.mas_centerY);
    }];
    
    //密码输入框下的lineBlack
    UIView * lineView0 = [BSTool createLine];
    lineView0.backgroundColor = Color_FFFFFF;
    [self.view addSubview:lineView0];
    [lineView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineBlack.mas_bottom).offset(9);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(lineHeight));
    }];
    
    
    //验证码输入框
    codeTF = [[UITextField alloc] init];
    codeTF.delegate = self;
    codeTF.font = Font_28;
    codeTF.textColor = Color_2F2F2F;
    codeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [codeTF setValue:Font_28 forKeyPath:@"_placeholderLabel.font"];
    [codeTF setValue:Color_C2C2C2 forKeyPath:@"_placeholderLabel.textColor"];
    [lineView0 addSubview:codeTF];
    [codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView0.mas_left).offset(padding_24);
        make.right.equalTo(lineView0.mas_right).offset(-padding_24);
        make.centerY.equalTo(lineView0.mas_centerY);
    }];
    
    
    //密码输入框下的lineBlack
    UIView * lineView1 = [BSTool createLine];
    lineView1.backgroundColor = Color_FFFFFF;
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView0.mas_bottom).offset(9);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(lineHeight));
    }];
    
    //密码输入框
    passwordTF = [[UITextField alloc] init];
    passwordTF.delegate = self;
    passwordTF.font = Font_28;
    passwordTF.textColor = Color_2F2F2F;
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
    
    //注册按钮
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registBtn.layer.cornerRadius = 4;
    registBtn.backgroundColor = Color_0F68C3;
    registBtn.titleLabel.font = Font_28;
    [registBtn setTitleColor:Color_FFFFFF forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(bindButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).offset(36);
        make.left.equalTo(self.view).offset(padding_24);
        make.right.equalTo(self.view).offset(-padding_24);
        make.height.equalTo(registBtn.mas_width).multipliedBy(0.12);
    }];
    
    switch (self.optionType) {
        case BSSetUpOptionTypeBind: {
            [accountTF becomeFirstResponder];
//            // 如果已经在此机子上登录过，则会记录用户名
//            if ([NSUser_defaul objectForKey:Record_userName]) {
//                accountTF.text = [NSUser_defaul objectForKey:Record_userName];
//                [passwordTF becomeFirstResponder];
//            } else{
//                [accountTF becomeFirstResponder];
//            }
            [registBtn setTitle:@"绑定" forState:UIControlStateNormal];
            
            accountTF.placeholder = @"请正确的输入11位的手机号码";
            codeTF.placeholder = @"请输入短信验证码";
            passwordTF.placeholder = @"请输入账号密码6-18位";
            accountTF.keyboardType = UIKeyboardTypePhonePad;
            codeTF.keyboardType = UIKeyboardTypeNumberPad;
            passwordTF.keyboardType = UIKeyboardTypeDefault;

            //验证码
            sendCode = [UIButton buttonWithType:UIButtonTypeCustom];
            sendCode.titleLabel.font = Font_24;
            sendCode.layer.masksToBounds = YES;
            sendCode.layer.borderWidth = 0.5;
            sendCode.layer.cornerRadius = 2;
            sendCode.layer.borderColor = Color_0F68C3.CGColor;
            [sendCode setTitle:@"获取验证码" forState:UIControlStateNormal];
            [sendCode setTitleColor:Color_0F68C3 forState:UIControlStateNormal];
            [sendCode addTarget:self action:@selector(accountcheckBtnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [lineView0 addSubview:sendCode];
            [sendCode mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(lineView0);
                make.right.equalTo(lineView0.mas_right).offset(-12);
                make.width.equalTo(@80);
                make.height.equalTo(@28);
            }];
            
            [codeTF mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lineView0.mas_left).offset(padding_24);
                make.right.equalTo(sendCode.mas_left).offset(-10);
                make.centerY.equalTo(lineView0.mas_centerY);
            }];
            
            
            break;
        }
        case BSSetUpOptionTypeEdit: {
            
            [registBtn setTitle:@"提交" forState:UIControlStateNormal];
            
            accountTF.placeholder = @"请输入原密码";
            codeTF.placeholder = @"请输入新密码";
            passwordTF.placeholder = @"请确认新密码";
            accountTF.secureTextEntry = YES;
            codeTF.secureTextEntry = YES;
            passwordTF.secureTextEntry = YES;
            accountTF.keyboardType = UIKeyboardTypeDefault;
            codeTF.keyboardType = UIKeyboardTypeDefault;
            passwordTF.keyboardType = UIKeyboardTypeDefault;
            
            break;
        }
        default: {
            break;
        }
    }
    
}
#pragma mark -- 点击空白处收起键盘
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark -- 点击事件

// MARK:  获取验证码
- (void)accountcheckBtnButtonClick:(UIButton *)sender {
    
    
    if (![sendCode.currentTitle isEqualToString:@"获取验证码"]) {
        [MBProgressHUD showText:@"验证码已发送，请稍后再试"];
        return;
    }else{
        if ([[BSTool validateLengthIsNullString:accountTF.text] length] == 0) {
            [MBProgressHUD showText:@"手机号码不能为空"];
            return;
        }
        
        if (![accountTF.text isValidateMobile]) {
            [MBProgressHUD showText:@"手机号码格式不对"];
            return;
        }
        
    }
}

// MARK:  提交
- (void)bindButtonClick:(UIButton *)sender {
    
    switch (self.optionType) {
        case BSSetUpOptionTypeBind:
        {
            if ([[BSTool validateLengthIsNullString:accountTF.text] length] == 0) {
                [MBProgressHUD showText:@"请输入手机号码"];
                return;
            }
            
            if (![accountTF.text isValidateMobile]) {
                [MBProgressHUD showText:@"手机号码格式不对"];
                return;
            }
            
            if (![passwordTF.text isPureNumandCharacters]) {
                [MBProgressHUD showText:@"请输入六位纯数字验证码"];
                return;
            }
        }
            break;
        case BSSetUpOptionTypeEdit:
        {
            //修改密码
            WeakSelf(self)
            NSDictionary *parameter = @{@"original_password":accountTF.text,@"password":codeTF.text,@"repassword":passwordTF.text};
            [BSMemberRequest editPasswordWithParameter:parameter success:^(ICAutCodeModel *result) {
                
//                [MBProgressHUD showText:[NSString stringWithFormat:@"%@",result.tip]];
                //登录成功之后，清除之前的用户单例
                [[BSUserInfo shareUserInstance] logoutBlock:^(BOOL resultRet) {
                    [UIView animateWithDuration:0.25 animations:^{
                        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                    } completion:^(BOOL finished) {
                        [NSNoti_defaul postNotificationName:@"editToLogin" object:nil];
                    }];
                    
                }];
                
            } warn:^(NSString *warnMsg) {
                [MBProgressHUD showText:warnMsg];
                
            } failure:^(NSError *error) {
                
            }];
        }
            break;
            
        default:
            break;
    }

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
