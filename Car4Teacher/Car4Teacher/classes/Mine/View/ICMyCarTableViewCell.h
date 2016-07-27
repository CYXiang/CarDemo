//
//  ICMyCarTableViewCell.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/26.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "QLTableViewCell.h"

@protocol ICMyCarTableViewCellDelegate <NSObject>
@optional
/**
 *  个性设置按钮点击
 */
- (void)myCarTableViewcellEditBtnDidClick:(UIButton *)button;

@end

@class ICUserCarInformationModel;

@interface ICMyCarTableViewCell : QLTableViewCell

@property (strong, nonatomic) IBOutlet UIButton *editBtn;

@property(nonatomic, strong) ICUserCarInformationModel *UserCarInformation;/**<模型*/

@property (nonatomic, weak) id<ICMyCarTableViewCellDelegate> delegate; /**< 代理 */


@end
