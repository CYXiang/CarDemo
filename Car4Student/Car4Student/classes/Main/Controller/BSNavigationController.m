//
//  BSNavigationController.m
//  BiShe
//
//  Created by apple开发 on 15/12/5.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import "BSNavigationController.h"
#import "UIBarButtonItem+Extension.h"

@interface BSNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置pop手势代理
    self.interactivePopGestureRecognizer.delegate = self;

}

/**
 *  统一设置左上角返回图片
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {

        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(blackBtnClick) image:@"commom_back" highImage:@"commom_back"];

    }
    [super pushViewController:viewController animated:animated];
}

- (void)blackBtnClick{
    
    [self popViewControllerAnimated:YES];

}

#pragma mark -- 点击空白处收起键盘
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>

/**
 *  push进来的控制器大于1个，手势有效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    return self.viewControllers.count > 1;
}

@end
