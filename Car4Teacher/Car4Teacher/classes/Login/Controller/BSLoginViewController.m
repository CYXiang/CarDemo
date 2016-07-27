//
//  BSLoginViewController.m
//  Global
//
//  Created by fanny on 15/12/7.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import "BSLoginViewController.h"
#import "BSRegisterViewController.h"    //注册界面

#import "BSLoginRequest.h"  //请求接口

#import "BSRegisterViewController.h"    //注册界面
#import "BSSetUpPWViewController.h"//设置密码
#import "BSBaseRequest.h"
#import "BSBindModel.h"


@interface BSLoginViewController ()<UITextFieldDelegate>
{
    UITextField * accountTF;    /**<账号输入框*/
    UITextField * passwordTF;    /**<密码输入框*/
}


@end

@implementation BSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = Color_F8F8F8;
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    //界面初始化
    [self initLoginLayout];
    
    //注册成功后
    [NSNoti_defaul addObserver:self selector:@selector(loginSucceed) name:@"loginSucceed" object:nil];
    //微信登陆回来
    [NSNoti_defaul addObserver:self selector:@selector(pushBindViewController:) name:@"WXLogin" object:nil];

}

// 跳转到绑定手机号码界面
- (void)pushBindViewController:(NSNotification *)notify{
    NSLog(@"------code---%@",notify.userInfo[@"code"]);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"code"] = notify.userInfo[@"code"];
    [BSBaseRequest postResultHUDWithUrl:account_wechatLogin param:params resultClass:[BSBindModel class] success:^(BSBindModel *result) {
        DR_NSLog("result==%@",result.tag);
        
        if ([result.tag isEqualToString:@"2"]) {//没绑定手机号
//            BSBindViewController * bindVC = [[BSBindViewController alloc] init];
//            bindVC.title = @"绑定手机号码";
//            bindVC.openID = result.openid;
//            bindVC.optionType = BSSetUpPasswordOptionTypeRegister;
//            [[BSUserInfo shareUserInstance] setValueByUserInfo:result.item];       //设置用户模型值

//            [self.navigationController pushViewController:bindVC animated:YES];
        }else if ([result.tag isEqualToString:@"1"]){// 已绑定手机号
            //登录成功之后，清除之前的用户单例
            [[BSUserInfo shareUserInstance] logoutBlock:^(BOOL resultRet) {
                
            }];
            //设置用户模型值
            [[BSUserInfo shareUserInstance] setValueByUserInfo:result.item];
            
            //隐藏键盘
            [accountTF resignFirstResponder];
            [passwordTF resignFirstResponder];
            [self dismissViewControllerAnimated:YES completion:nil];
            if (self.login) {
                self.login(YES);
            }

        }
    
    } warn:^(NSString *warnMsg) {
        DR_NSLog("warnMsg===%@",warnMsg);
    

    } failure:^(NSError *error) {

    } tokenInvalid:^{
                
    }];
}

- (void)loginSucceed{
    if (self.login) {
        self.login(YES);
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }else {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    [accountTF resignFirstResponder];
}
- (void)dealloc {
    [NSNoti_defaul removeObserver:self];
}

#pragma mark -- 初始化
- (void)initLoginLayout {
    
    //初始化导航栏
    [self initNavLayout];
    
    //账号输入框下的分割线
    UIView * lineBlack = [BSTool createLine];
    lineBlack.backgroundColor = Color_FFFFFF;
    [self.view addSubview:lineBlack];
    [lineBlack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(73);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(42));
    }];
    
    //账号输入框
    accountTF = [[UITextField alloc] init];
    accountTF.placeholder = @"请正确的输入11位的手机号码";
    accountTF.delegate = self;
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
    UIView * lineView1 = [BSTool createLine];
    lineView1.backgroundColor = Color_FFFFFF;
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineBlack.mas_bottom).offset(9);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(42));
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
    
    // 如果已经在此机子上登录过，则会记录用户名
    if ([NSUser_defaul objectForKey:Record_userName]) {
        accountTF.text = [NSUser_defaul objectForKey:Record_userName];
        [passwordTF becomeFirstResponder];
    } else{
        [accountTF becomeFirstResponder];
    }
    
    //忘记密码按钮
    UIButton *forgetPwd = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPwd.titleLabel.font = Font_24;
    [forgetPwd setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPwd setTitleColor:Color_0F68C3 forState:UIControlStateNormal];
    [forgetPwd addTarget:self action:@selector(accountforgetPasswordButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPwd];
    [forgetPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).offset(4);
        make.right.equalTo(lineView1.mas_right).offset(-padding_24);
        make.height.equalTo(@32);
    }];
    
    //登录按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.layer.cornerRadius = 4;
    loginBtn.backgroundColor = Color_0F68C3;
    loginBtn.titleLabel.font = Font_28;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:Color_FFFFFF forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(accountloginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).offset(36);
        make.left.equalTo(self.view).offset(padding_24);
        make.right.equalTo(self.view).offset(-padding_24);
        make.height.equalTo(loginBtn.mas_width).multipliedBy(0.12);
    }];
    
    
    
    /**
     版本1.0暂不做第三方登录
     
     - returns: <#return value description#>
     */
    
    //其它登录方式
    UILabel * otherLogin = [[UILabel alloc] init];
    otherLogin.text = @"一键登录";
    otherLogin.textColor = Color_A1A1A1;
    otherLogin.font = Font_24;
    [self.view addSubview:otherLogin];
    [otherLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-150);
        make.centerX.equalTo(self.view);
    }];
    
    //分割线
    UIView * line1 = [BSTool createLine];
    [self.view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(12);
        make.right.equalTo(otherLogin.mas_left).offset(-12);
        make.height.equalTo(@(Line_side_heihgt));
        make.centerY.equalTo(otherLogin);
    }];
    
    UIView * line2 = [BSTool createLine];
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(otherLogin.mas_right).offset(12);
        make.right.equalTo(self.view).offset(-12);
        make.height.equalTo(@(Line_side_heihgt));
        make.centerY.equalTo(otherLogin);
    }];
    
    //第三方登录
    //微信 login_wechat
    //忘记密码按钮
    UIButton *wechat = [UIButton buttonWithType:UIButtonTypeCustom];
    [wechat setImage:[UIImage imageNamed:@"login_wechat_nor"] forState:UIControlStateNormal];
    [wechat addTarget:self action:@selector(accountthirdpartyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wechat];
    [wechat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(otherLogin.mas_bottom).offset(16);
        make.centerX.equalTo(self.view);
    }];
    
//    //先隐藏
//    wechat.hidden = YES;
//    //判断是否装有微信客户端，否则隐藏第三方登录信息
//    if (![WXApi isWXAppInstalled]){
//        wechat.hidden = YES;
//        otherLogin.hidden = YES;
//        line1.hidden = YES;
//        line2.hidden = YES;
//    }
}

#pragma mark -- 初始化导航栏
- (void)initNavLayout {
    UIView * naView = [[UIView alloc] init];
    naView.backgroundColor = Color_0F68C3;
    [self.view addSubview:naView];
    [naView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(@0);
        make.height.equalTo(@64);
    }];
    
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"commom_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAccountButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [naView addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(naView);
        make.width.equalTo(@65);
        make.height.equalTo(@44);
        make.bottom.equalTo(naView.mas_bottom);
    }];
    
    //标题
    UILabel * titleName = [[UILabel alloc] init];
    titleName.text = @"登录";
    titleName.font = Font_32;
    titleName.textColor = [UIColor whiteColor];
    [naView addSubview:titleName];
    [titleName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(naView.mas_centerXWithinMargins);
        make.bottom.equalTo(naView.mas_bottom).offset(-13);
    }];
    
    //注册按钮
    UIButton * registerBtn = [[UIButton alloc]init];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = Font_26;
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(accountregisterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [naView addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(naView);
        make.width.equalTo(@65);
        make.height.equalTo(@44);
        make.centerY.equalTo(naView.mas_centerY).offset(10);
    }];
    
    UIView * view = [BSTool createViewWithColor:Color_E8E8E8];
    [naView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(naView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@0.5);
    }];
}

#pragma mark -- 点击事件

#pragma mark -- 登录按钮
- (void)accountloginButtonClick:(UIButton *)sender {
    
    if ([[BSTool validateLengthIsNullString:accountTF.text] length] == 0 || [[BSTool validateLengthIsNullString:passwordTF.text] length] == 0) {
        [MBProgressHUD showText:@"请输入用户名或密码"];
        return;
    }
    
    WeakSelf(self)
    NSDictionary *parameter = [NSDictionary dictionaryWithObjectsAndKeys:
                               accountTF.text,@"mobile_number",
                               passwordTF.text,@"password",
                               nil];
    
    [BSLoginRequest loginRequestWithParameter:parameter success:^(BSUserInfo * result) {
        
        //登录成功之后，清除之前的用户单例
        [[BSUserInfo shareUserInstance] logoutBlock:^(BOOL resultRet) {
            
        }];
        //设置用户模型值
        [[BSUserInfo shareUserInstance] setValueByUserInfo:result];
        
        //隐藏键盘
        [accountTF resignFirstResponder];
        [passwordTF resignFirstResponder];
        [weakSelf dismissViewControllerAnimated:YES completion:^{
            
        }];
        if (weakSelf.login) {
            
            weakSelf.login(YES);
        }
        
        // 设置默认用户名，下次自动填充
        [NSUser_defaul setObject:accountTF.text forKey:Record_userName];
        
    } warn:^(NSString *warnMsg) {
        
        DR_NSLog(@"\n------------------warnMsg-----------------\n%@\n\n",warnMsg);
        [MBProgressHUD showText:warnMsg];
    } failure:^(NSError *error) {
        
    }];
    
}
#pragma mark -- 点击空白处收起键盘
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark -- 注册按钮
- (void)accountregisterButtonClick:(UIButton *)sender {
    BSRegisterViewController * reg = [[BSRegisterViewController alloc] init];
    reg.title = @"注册";
    [self.navigationController pushViewController:reg animated:YES];
}


#pragma mark -- 忘记密码
- (void)accountforgetPasswordButtonClick:(UIButton *)sender {
    BSSetUpPWViewController * reg = [[BSSetUpPWViewController alloc] init];
    reg.title = @"忘记密码";
    reg.optionType = BSSetUpPasswordOptionTypeForget;
    [self.navigationController pushViewController:reg animated:YES];
}

#pragma mark -- 第三方登录
- (void)accountthirdpartyButtonClick:(UIButton *)sender {
    //微信登陆
//    SendAuthReq* req =[[SendAuthReq alloc ] init];
//    req.scope = @"snsapi_userinfo,snsapi_base";
//    req.state = @"0744" ;
//    [WXApi sendReq:req];
}


#pragma mark -- 返回按钮，隐藏登录界面
- (void)backAccountButtonClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
