//
//  ICFeedbackViewController.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/24.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICFeedbackViewController.h"
#import "UITextView+Placeholder.h"
#import <SVProgressHUD.h>
#import "ICMineRequest.h"

@interface ICFeedbackViewController ()

@property (nonatomic, weak) UITextView *textView; /**< 文本输入框 */
@property (nonatomic, weak) UITextField *numberView; /**< 手机号码 */

@end

@implementation ICFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationItem];
    [self setUpContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Creat UI
- (void)setUpNavigationItem {
    
    self.title = @"意见反馈";
    
}

- (void)setUpContentView{
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 10, self.view.width, 200)];
    self.textView = textView;
    [textView setFont:Font_26];
    textView.placeholder = @"有什么建议，随时欢迎吐槽！";
    textView.placeholderColor = Color_C2C2C2;
    [self.view addSubview:textView];
    
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 220, self.view.width, 36)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backgroundView];

    UITextField *numberView = [[UITextField alloc]initWithFrame:CGRectMake(10, 220, self.view.width - 20, 36)];
    self.numberView = numberView;
    numberView.placeholder = @"请输入手机号码";
    numberView.backgroundColor = [UIColor whiteColor];
    numberView.font = Font_30;
    numberView.keyboardType = UIKeyboardTypePhonePad;
    numberView.clearButtonMode = UITextFieldViewModeWhileEditing;
    [numberView setValue:Font_30 forKeyPath:@"_placeholderLabel.font"];
    [numberView setValue:Color_C2C2C2 forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:numberView];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 292, self.view.width - 20, 40)];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:Color_0F68C3];
    [btn.layer setCornerRadius:3];
    btn.clipsToBounds = YES;
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [self.view addSubview:btn];

}


- (void)btnClick{
    
    [self.view endEditing:YES];
    
    if (self.textView.text.length <= 0) {
        [SVProgressHUD showInfoWithStatus:@"反馈内容不能为空"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }else{
    
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"opinion_content"] = self.textView.text;
        params[@"mobile"] = self.numberView.text.length == 11 ? self.numberView.text : [BSUserInfo shareUserInstance].mobile;
        
        
        [ICMineRequest feedbackWithParamter:params success:^(NSMutableArray *resultArray) {
            
            [SVProgressHUD showSuccessWithStatus:@"反馈成功"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                
            });
            
        } warn:^(NSString *warnMsg) {
            [SVProgressHUD showWithStatus:warnMsg];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                
            });
        } failure:^(NSError *error) {
            
        }];

    }
    
    
}


@end
