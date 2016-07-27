//
//  ICAddCarView.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/24.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ICAddCarViewDelegate <NSObject>
@optional
/**
 *  保存并查询 按钮点击
 */
- (void)addCarViewSaveQureyBtnDidClick:(UIButton *)button;

/**
 *  查询城市点击事件
 */
- (void)addCarViewSelectCityBtnDidClick:(UIButton *)button;

/**
 *  车辆号码省份简称点击事件
 */
- (void)addCarViewnumHeaderBtnDidClick:(UIButton *)button;


/**
 *  用户使用协议
 */
- (void)addCarViewuserAgreeBtnDidClick:(UIButton *)button;


@end



@class ICUserCarInformationModel;
@interface ICAddCarView : UIView

@property (weak, nonatomic) IBOutlet UITextField *carNumTextFiled; /**< 车辆号码文本框 */

@property (weak, nonatomic) IBOutlet UITextField *carframeNumTF;/**< 车架号码文本框 */

@property (weak, nonatomic) IBOutlet UITextField *engineNumTF; /**< 发动机号码文本框 */

@property (weak, nonatomic) IBOutlet UILabel *cityLab;

@property (weak, nonatomic) IBOutlet UIButton *shortNameBtn;

@property (nonatomic, weak) id<ICAddCarViewDelegate> delegate; /**< 代理 */

@property(nonatomic, strong) ICUserCarInformationModel *carInfoModel;/**<模型*/
@property (weak, nonatomic) IBOutlet UIButton *remindBtn;

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;


@end
