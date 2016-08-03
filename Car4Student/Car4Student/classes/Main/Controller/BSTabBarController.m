//
//  BSTabBarController.m
//  BiShe
//
//  Created by apple开发 on 15/12/5.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import "BSTabBarController.h"
#import "BSNavigationController.h"
#import "ICHomeViewController.h"
#import "ICMineViewController.h"
#import "ICJoinViewController.h"
#import "ICLeanViewController.h"

@interface BSTabBarController ()

@end

@implementation BSTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 统一设置Item的文字属性
        [self setUpItemTextAttrs];
        
        // 添加所以子控制器
        [self setUpAllChildViewControllers];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 *  统一设置Item文字的属性
 */
- (void)setUpItemTextAttrs{
    // 统一设置Item文字的属性
    // UI_APPEARANCE_SELECTOR
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalAttrs[NSFontAttributeName] = Font_24;
    
    // 选中状态
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSForegroundColorAttributeName] = Color_0F68C3;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
}

/**
 *  添加所有子控制器
 */
- (void)setUpAllChildViewControllers{
    
    
    [self setUpOneViewController:[[ICHomeViewController alloc]init] title:@"首页" image:@"tabbar_home_nor" selectImage:@"tabbar_home_pre"];

    [self setUpOneViewController:[[ICJoinViewController alloc]init] title:@"报名" image:@"tabbar_home_nor" selectImage:@"tabbar_home_pre"];
    
    [self setUpOneViewController:[[ICLeanViewController alloc]init] title:@"培训" image:@"tabbar_home_nor" selectImage:@"tabbar_home_pre"];
    
    [self setUpOneViewController:[[ICMineViewController alloc]init] title:@"我的" image:@"tabbar_mine_nor" selectImage:@"tabbar_mine_pre"];
    
}


/**
 *  添加一个子控制器
 */

- (void)setUpOneViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    
    BSNavigationController *nav = [[BSNavigationController alloc]initWithRootViewController:vc];
    [nav.navigationBar setBarTintColor:Color_0F68C3];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self addChildViewController:nav];
}



@end
