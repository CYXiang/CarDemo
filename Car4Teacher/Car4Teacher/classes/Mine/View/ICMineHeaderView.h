//
//  ICMineHeaderView.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/23.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ICMineHeaderViewDelegate <NSObject>
@optional
/**
 *  个性设置按钮点击
 */
- (void)mineHeaderViewLoginBtnDidClick:(UIButton *)button;
/**
 *  添加车辆按钮点击
 */
- (void)mineHeaderViewAddCarBtnDidClick:(UIButton *)button;
/**
 *  个性设置按钮点击
 */
- (void)mineHeaderViewSettingBtnDidClick:(UIButton *)button;

/**
 *  用户昵称按钮点击
 */
- (void)mineHeaderViewNameBtnDidClick:(UIButton *)button;


@end

@interface ICMineHeaderView : UIView

@property (strong, nonatomic) IBOutlet UIButton *nameBtn;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
@property (nonatomic, weak) id<ICMineHeaderViewDelegate> delegate; /**< 代理 */
@property (strong, nonatomic) IBOutlet UIView *barkgroudView;

@end
