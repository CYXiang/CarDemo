//
//  BSRegisterViewController.m
//  Global
//
//  Created by fanny on 15/12/7.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import "BSRegisterViewController.h"
#import "BSMemberRequest.h" //请求
#import "BSLoginRequest.h"//注册接口
#import "ICUserAgreeViewController.h"//html界面

@interface BSRegisterViewController ()<UITextFieldDelegate>
{
    UITextField * accountTF;    /**<账号输入框*/
    UITextField * codeTF;       /**<验证码输入框*/
    UITextField * passwordTF;   /**<密码输入框*/
    UIButton * sendCode;    /**<获取验证码按钮*/
}
@property(nonatomic, copy)NSString *session_id;/**<注册验证码*/

@end

@implementation BSRegisterViewController

static NSInteger const lineHeight = 42;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = Color_F8F8F8;
    
    //界面初始化
    [self initLoginLayout];
        
    //注册成功后
//    [NSNoti_defaul addObserver:self selector:@selector(loginSucceed) name:@"loginSucceed" object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController.navigationBar setBarTintColor:Color_0F68C3];

    UIColor * color = [UIColor whiteColor];
    
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;

}

//- (void)dealloc {
//    [NSNoti_defaul removeObserver:self];
//}

//- (void)loginSucceed{
//    if (self.login) {
//        self.login(YES);
//        [self dismissViewControllerAnimated:YES completion:^{
//            
//        }];
//    }else {
//        [self dismissViewControllerAnimated:YES completion:^{
//            
//        }];
//    }
//}


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
    accountTF.placeholder = @"请正确的输入11位的手机号码";
    accountTF.delegate = self;
    [accountTF becomeFirstResponder];
    accountTF.font = Font_28;
    accountTF.textColor = Color_2F2F2F;
    accountTF.keyboardType = UIKeyboardTypePhonePad;
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
    

    //验证码输入框
    codeTF = [[UITextField alloc] init];
    codeTF.placeholder = @"请输入短信验证码";
    codeTF.delegate = self;
    codeTF.font = Font_28;
    codeTF.textColor = Color_2F2F2F;
    codeTF.keyboardType = UIKeyboardTypePhonePad;
    codeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [codeTF setValue:Font_28 forKeyPath:@"_placeholderLabel.font"];
    [codeTF setValue:Color_C2C2C2 forKeyPath:@"_placeholderLabel.textColor"];
    [lineView0 addSubview:codeTF];
    [codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView0.mas_left).offset(padding_24);
        make.right.equalTo(sendCode.mas_left).offset(-10);
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
    passwordTF.placeholder = @"请输入账号密码6-18位";
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
    
    //注册按钮
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registBtn.layer.cornerRadius = 2;
    registBtn.backgroundColor = Color_0F68C3;
    registBtn.titleLabel.font = Font_28;
    [registBtn setTitleColor:Color_FFFFFF forState:UIControlStateNormal];
    [registBtn setTitle:@"提交" forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(accountregistButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).offset(36);
        make.left.equalTo(self.view).offset(padding_24);
        make.right.equalTo(self.view).offset(-padding_24);
        make.height.equalTo(registBtn.mas_width).multipliedBy(0.12);
    }];
    
    
    UILabel *promptLable = [[UILabel alloc] init];
    promptLable.text = @"点击完成，即表示您同意";
    promptLable.font = Font_26;
    promptLable.textColor = Color_999999;
    [self.view addSubview:promptLable];
    [promptLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(registBtn.mas_bottom).offset(8);
        make.left.equalTo(self.view.mas_left).offset(padding_24);
//        make.right.equalTo(self.view.mas_right).offset(-padding_24);
    }];
    
    UIButton *assertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    assertBtn.backgroundColor = [UIColor clearColor];
    assertBtn.titleLabel.font = Font_26;
    [assertBtn setTitleColor:Color_0F68C3 forState:UIControlStateNormal];
    [assertBtn setTitle:@"用户使用协议" forState:UIControlStateNormal];
    [assertBtn addTarget:self action:@selector(assertClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:assertBtn];
    [assertBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(promptLable);
        make.left.equalTo(promptLable.mas_right).offset(2);
    }];
    
}

#pragma mark -- 协议声明
- (void)assertClickButton:(UIButton*)sender {
    ICUserAgreeViewController *vc = [[ICUserAgreeViewController alloc]init];
    vc.urlString = @"http://s1.chebao.bishe.com/register-argreement-app.html";
    vc.title = @"用户注册协议";
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
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
        //获取验证码后倒计时
        NSDictionary *parameter = @{@"phone":accountTF.text,@"action":@"register"};
        [BSMemberRequest sendSMSCodeWithParameter:parameter success:^(ICAutCodeModel *result) {
            
            self.session_id = result.session_id;
            
            [self setTimer];
            [accountTF resignFirstResponder];
            [codeTF becomeFirstResponder];
            [MBProgressHUD showText:[NSString stringWithFormat:@"%@",result.tip]];
        } warn:^(NSString *warnMsg) {
            [MBProgressHUD showText:warnMsg];
            
        } failure:^(NSError *error) {
            
        }];
        
    }
}

// MARK:  提交
- (void)accountregistButtonClick:(UIButton *)sender {
    
    if ([[BSTool validateLengthIsNullString:accountTF.text] length] == 0) {
        [MBProgressHUD showText:@"请输入手机号码"];
        return;
    }
    
    if (![accountTF.text isValidateMobile]) {
        [MBProgressHUD showText:@"手机号码格式不对"];
        return;
    }
    
    if (![codeTF.text isPureNumandCharacters]) {
        [MBProgressHUD showText:@"请输入六位纯数字验证码"];
        return;
    }
    
    WeakSelf(self)
    //注册
    NSDictionary *parameter = @{@"mobile_number":accountTF.text,@"captcha":codeTF.text,@"password":passwordTF.text,@"is_agree":@"true",@"session_id":self.session_id};
    [BSLoginRequest registerRequestWithParameter:parameter success:^(BSUserInfo *result) {
        
        
        
        [MBProgressHUD showText:@"注册成功"];
        
        //登录成功之后，清除之前的用户单例
        [[BSUserInfo shareUserInstance] logoutBlock:^(BOOL resultRet) {
            
        }];
        //设置用户模型值
        [[BSUserInfo shareUserInstance] setValueByUserInfo:result];
        
        //隐藏键盘
        [accountTF resignFirstResponder];
        [passwordTF resignFirstResponder];
        
        //注册并登录成功后，发出通知
        [NSNoti_defaul postNotificationName:@"loginSucceed" object:nil];
        
        
        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        
        
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
