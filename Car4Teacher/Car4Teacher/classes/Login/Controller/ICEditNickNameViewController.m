//
//  ICEditNickNameViewController.m
//  iCar4ios
//
//  Created by fanny on 16/6/3.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICEditNickNameViewController.h"
#import "BSMemberRequest.h"//请求

@interface ICEditNickNameViewController ()<UITextFieldDelegate>
{
    UITextField * nickNameTF;    /**<账号输入框*/
}

@end

@implementation ICEditNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    //账号输入框下的view
    UIView * lineBlack = [BSTool createLine];
    lineBlack.backgroundColor = Color_FFFFFF;
    [self.view addSubview:lineBlack];
    [lineBlack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(73);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(42));
    }];
    
    //账号输入框
    nickNameTF = [[UITextField alloc] init];
    nickNameTF.placeholder = @"请输入昵称";
    nickNameTF.delegate = self;
    [nickNameTF becomeFirstResponder];
    nickNameTF.font = Font_28;
    nickNameTF.textColor = Color_2F2F2F;
    nickNameTF.keyboardType = UIKeyboardTypeDefault;
    nickNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [nickNameTF setValue:Font_28 forKeyPath:@"_placeholderLabel.font"];
    [nickNameTF setValue:Color_C2C2C2 forKeyPath:@"_placeholderLabel.textColor"];
    [lineBlack addSubview:nickNameTF];
    [nickNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineBlack.mas_left).offset(padding_24);
        make.right.equalTo(lineBlack.mas_right).offset(-padding_24);
        make.centerY.equalTo(lineBlack.mas_centerY);
    }];
    
    UILabel *promptLable = [[UILabel alloc] init];
    promptLable.text = @"支持英文字母及汉字，限4-16位字符，一个汉字为2个字符";
    promptLable.font = Font_26;
    promptLable.textColor = Color_999999;
    [self.view addSubview:promptLable];
    [promptLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineBlack.mas_bottom).offset(4);
        make.left.equalTo(self.view.mas_left).offset(padding_24);
        make.right.equalTo(self.view.mas_right).offset(-padding_24);
    }];

    //注册按钮
    UIButton *commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commitBtn.layer.cornerRadius = 2;
    commitBtn.backgroundColor = Color_0F68C3;
    commitBtn.titleLabel.font = Font_28;
    [commitBtn setTitleColor:Color_FFFFFF forState:UIControlStateNormal];
    [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitBtn];
    [commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineBlack.mas_bottom).offset(36);
        make.left.equalTo(self.view).offset(padding_24);
        make.right.equalTo(self.view).offset(-padding_24);
        make.height.equalTo(commitBtn.mas_width).multipliedBy(0.12);
    }];
    
}


- (void)commitClickButton:(UIButton *)sender {
    //获取验证码后倒计时
    WeakSelf(self)
    NSDictionary *parameter = @{@"nickname":nickNameTF.text};
    [BSMemberRequest editNickNameWithParameter:parameter success:^(id result) {
        [BSUserInfo shareUserInstance].nickname = nickNameTF.text;
        [[BSUserInfo shareUserInstance] synchronize];
        [MBProgressHUD showText:@"修改成功"];
        if (self.editResult) {
            self.editResult(YES);
        }
        [weakSelf.navigationController popViewControllerAnimated:YES];
    } warn:^(NSString *warnMsg) {
        [MBProgressHUD showText:warnMsg];
        
    } failure:^(NSError *error) {
        
    }];
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
