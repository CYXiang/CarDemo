//
//  ICMineHeaderView.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/23.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICMineHeaderView.h"


@implementation ICMineHeaderView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    self.barkgroudView.backgroundColor = Color_0F68C3;

}


- (IBAction)loginBtnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(mineHeaderViewLoginBtnDidClick:)]) {
        [self.delegate mineHeaderViewLoginBtnDidClick:sender];
    }
}


- (IBAction)addCarBtnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(mineHeaderViewAddCarBtnDidClick:)]) {
        [self.delegate mineHeaderViewAddCarBtnDidClick:sender];
    }
}


- (IBAction)settingBtnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(mineHeaderViewSettingBtnDidClick:)]) {
        [self.delegate mineHeaderViewSettingBtnDidClick:sender];
    }
}

- (IBAction)nameBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(mineHeaderViewNameBtnDidClick:)]) {
        [self.delegate mineHeaderViewNameBtnDidClick:sender];
    }
}

@end
