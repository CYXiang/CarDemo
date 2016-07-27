//
//  ICAddCarView.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/24.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICAddCarView.h"
#import "ICUserCarInformationModel.h"

@interface ICAddCarView()



@end

@implementation ICAddCarView


/**
 *  查询城市点击事件
 */
- (IBAction)selectCityBtnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(addCarViewSelectCityBtnDidClick:)]) {
        [self.delegate addCarViewSelectCityBtnDidClick:sender];
    }
}

/**
 *  车辆号码省份简称点击事件
 */
- (IBAction)numHeaderBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(addCarViewnumHeaderBtnDidClick:)]) {
        [self.delegate addCarViewnumHeaderBtnDidClick:sender];
    }
}

/**
 *  保存并查询点击事件
 */
- (IBAction)SaveQureyBtnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(addCarViewSaveQureyBtnDidClick:)]) {
        [self.delegate addCarViewSaveQureyBtnDidClick:sender];
    }
}

/**
 *  车架号码提示点击事件
 */
- (IBAction)tipsBtnClick:(UIButton *)sender {
    
    
}

/**
 *  发动机号提示点击事件
 */
- (IBAction)tips2BtnClick:(UIButton *)sender {
    
    
    
}
/**
 *  用户使用协议
 */
- (IBAction)userAgreeBtnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(addCarViewuserAgreeBtnDidClick:)]) {
        [self.delegate addCarViewuserAgreeBtnDidClick:sender];
    }

    
}

/**
 *  违章提醒点击事件
 */
- (IBAction)openWarnBtnClick:(UIButton *)sender {
    
    sender.selected =  sender.isSelected ? NO : YES;
    
}


- (void)setCarInfoModel:(ICUserCarInformationModel *)carInfoModel{

    _carInfoModel = carInfoModel;
    
    self.cityLab.text = carInfoModel.city_name;
    
    self.carNumTextFiled.text = carInfoModel.car_plate;
    
    self.carframeNumTF.text = carInfoModel.car_class;
    
    self.engineNumTF.text = carInfoModel.car_engine;
    
}

@end
