//
//  ICUserAgreeViewController.m
//  iCar4ios
//
//  Created by apple开发 on 16/6/6.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICUserAgreeViewController.h"

@interface ICUserAgreeViewController ()

@property (nonatomic, strong) UILabel *titleLab; /**< 标题文字 */
@property (nonatomic, strong) UIButton *leftBtn; /**< 左边关闭按钮 */


@end

@implementation ICUserAgreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 60, 44)];
    self.leftBtn = leftBtn;
    [leftBtn setTitle:@"关闭" forState:UIControlStateNormal];
    leftBtn.titleLabel.font = Font_30;
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth / 2 - 50, 20, 100, 44)];
    self.titleLab = titleLab;
    titleLab.text = self.title;
    titleLab.textColor = [UIColor whiteColor];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLab];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftBtnClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
