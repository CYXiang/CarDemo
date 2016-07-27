//
//  ICAddCarTableViewController.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/24.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICAddCarTableViewController.h"
#import "ICAddCarView.h"
#import "ICInformationViewController.h"
#import <SVProgressHUD.h>
#import "GYZChooseCityController.h"
#import "ICShortNameSelectView.h"
#import "ICUserCarInformationModel.h"
#import "ICHomeRequest.h"
#import "BSLoginViewController.h"
#import "ICUserAgreeViewController.h"


@interface ICAddCarTableViewController ()<ICAddCarViewDelegate, GYZChooseCityDelegate,ICShortNameSelectViewDelegate>

@property (nonatomic, weak) UIScrollView *backgroundView; /**< <#注释#> */
@property (nonatomic, weak) ICAddCarView *addCarContentView; /**< <#注释#> */
@property (nonatomic, weak) ICShortNameSelectView *selectView; /**< 省份简称选择框 */
@property (nonatomic, copy) NSString *shortName;/**<<#注释#>*/

@end

@implementation ICAddCarTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCarNotification];
    
    [self setUpNavigationItem];
    
    [self setUpContentview];

    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - addNotifiation
- (void)addCarNotification{

    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
}


#pragma mark - Creat UI
- (void)setUpNavigationItem {

    self.title = self.navTitle ? self.navTitle : @"添加车辆";

}

- (void)setUpContentview {
    
    UIScrollView *backgroundView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.backgroundView = backgroundView;
    [self.view addSubview:backgroundView];

    ICAddCarView *addCarContentView = (ICAddCarView *)[[[NSBundle mainBundle] loadNibNamed:@"ICAddCarView" owner:nil options:nil] lastObject];
    self.addCarContentView = addCarContentView;
    addCarContentView.delegate = self;
    addCarContentView.carInfoModel = self.carInfoModel;
    addCarContentView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    backgroundView.contentSize = CGSizeMake(self.view.width, self.view.height);
    [backgroundView addSubview:addCarContentView];
    
    //
    ICShortNameSelectView *selectView = [[ICShortNameSelectView alloc]initWithFrame:CGRectMake(-1000, -1000, self.view.width, self.view.height)];
    self.selectView = selectView;
    selectView.delegate = self;
    [self.view addSubview:selectView];
    
    self.addCarContentView.cityLab.text = @"全国";

}

#pragma mark - ICAddCarViewDelegate
- (void)addCarViewSaveQureyBtnDidClick:(UIButton *)button {

    [self.view endEditing:YES];
    
    if ([BSUserInfo shareUserInstance].isLogin) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"hphm"] = [NSString stringWithFormat:@"%@%@",self.shortName,self.addCarContentView.carNumTextFiled.text];
        params[@"engineno"] = self.addCarContentView.engineNumTF.text;//@"粤A12933";
        params[@"classno"] = self.addCarContentView.carframeNumTF.text;//@"123239";
        
        params[@"remind"] = self.addCarContentView.remindBtn.selected == YES ? @"1" : @"0";//@"1";
        params[@"city"] = self.addCarContentView.cityLab.text;//@"1";
        
        [ICHomeRequest editCarInformationWithParamter:params success:^(NSArray *resultArray) {
            
            ICInformationViewController *inforVC = [[ICInformationViewController alloc]init];
            inforVC.hphm = [NSString stringWithFormat:@"%@%@",self.shortName,self.addCarContentView.carNumTextFiled.text];
            inforVC.engineno = self.addCarContentView.engineNumTF.text;
            inforVC.classno = self.addCarContentView.carframeNumTF.text;
            [self.navigationController pushViewController:inforVC animated:YES];
            
        } warn:^(NSString *warnMsg) {
            [SVProgressHUD showInfoWithStatus:warnMsg];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });

        } failure:^(NSError *error) {
            
            
            
        }];
        
        
//        ICInformationViewController *inforVC = [[ICInformationViewController alloc]init];
//        [self.navigationController pushViewController:inforVC animated:YES];

    }else{
        BSLoginViewController * login = [[BSLoginViewController alloc] init];

        BSNavigationController * nav = [[BSNavigationController alloc] initWithRootViewController:login];
        [self  presentViewController:nav animated:YES completion:^{
            
        }];
    }
    


}

- (void)addCarViewSelectCityBtnDidClick:(UIButton *)button{

    GYZChooseCityController *cityPickerVC = [[GYZChooseCityController alloc] init];
    [cityPickerVC setDelegate:self];
    //    cityPickerVC.locationCityID = @"1400010000";
    //    cityPickerVC.commonCitys = [[NSMutableArray alloc] initWithArray: @[@"1400010000", @"100010000"]];        // 最近访问城市，如果不设置，将自动管理
    cityPickerVC.hotCitys = @[@"100010000", @"200010000", @"300210000", @"600010000", @"300110000"];
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cityPickerVC] animated:YES completion:^{
        
    }];
}

- (void)addCarViewnumHeaderBtnDidClick:(UIButton *)button {

    [self.view endEditing:YES];
    
    CGFloat shortNameViewH = ScreenWidth / 7 * 5; // 总高度
    self.selectView.frame = self.view.bounds;
    
    [UIView animateWithDuration:.3 animations:^{
        self.selectView.alphaButton.alpha = 0.3;
    }];
    
    [UIView animateWithDuration:.3 animations:^{
        self.selectView.shortNameView.frame = CGRectMake(0, ScreenHeight - shortNameViewH, ScreenWidth, shortNameViewH);
    }];


}

- (void)addCarViewuserAgreeBtnDidClick:(UIButton *)button{

    ICUserAgreeViewController * html = [[ICUserAgreeViewController alloc] init];
    html.urlString = [NSString stringWithFormat:@"http://s1.chebao.bishe.com/agreement-app.html"];
    html.title = @"使用协议";
    [self presentViewController:html animated:YES completion:nil];
}

#pragma mark - GYZCityPickerDelegate
- (void) cityPickerController:(GYZChooseCityController *)chooseCityController didSelectCity:(GYZCity *)city
{
    
//    self.addCarContentView.cityLab.text = @"全国";

    self.addCarContentView.cityLab.text = city.shortName;
    
//    self.addCarContentView.carInfoModel.city_name = city.shortName;
    
    [chooseCityController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void) cityPickerControllerDidCancel:(GYZChooseCityController *)chooseCityController
{
    [chooseCityController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - ICShortNameSelectViewDelegate
- (void)shortNameSelectViewhiddenDidClick:(ICShortNameSelectView *)shortNameSelectView {
    
    [UIView animateWithDuration:.3 animations:^{
        self.selectView.alphaButton.alpha = 0;
        self.selectView.shortNameView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 350);
    } completion:^(BOOL finished) {
//        [self.selectView removeFromSuperview];
        self.selectView.frame = CGRectMake(-1000, -1000, 0, 0);
    }];
}

- (void)shortNameBtttonDidClick:(UIButton *)button {

    self.shortName = button.titleLabel.text;
    [self.addCarContentView.shortNameBtn setTitle:self.shortName forState:UIControlStateNormal];
    
    
}

#pragma mark - Action
// 当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    
    self.backgroundView.contentSize = CGSizeMake(self.view.width, self.view.height + height);
}




@end
