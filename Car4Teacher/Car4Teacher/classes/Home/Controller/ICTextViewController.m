//
//  ICTextViewController.m
//  iCar4ios
//
//  Created by Macx on 16/6/24.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICTextViewController.h"

@implementation ICTextViewController

- (void)viewDidLoad{

    self.view.backgroundColor = [UIColor clearColor];
    
    UIScrollView *contentView = [[UIScrollView alloc]init];
    contentView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
    }];
    
    UIView *btn = [[UIView alloc]init];
    btn.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@44);
    }];
    
}

@end
