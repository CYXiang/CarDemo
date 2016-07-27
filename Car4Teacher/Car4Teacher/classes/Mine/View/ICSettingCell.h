//
//  ICSettingCell.h
//  iCar4ios
//
//  Created by apple开发 on 16/6/1.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ICSettingCellDelegate <NSObject>
@optional
/**
 *  点击
 */
- (void)settingCellSwitchDidClick:(UISwitch *)switchbtn;

@end

@class ICMineSettingitem;
@interface ICSettingCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) ICMineSettingitem *item;
@property (nonatomic, weak) id<ICSettingCellDelegate> delegate; /**< 代理 */

@end
