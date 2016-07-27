//
//  ICAddCarTableViewController.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/24.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICUserCarInformationModel;
@interface ICAddCarTableViewController : ICBaseViewController

@property (nonatomic, strong) NSString *navTitle;/**<标题*/

@property(nonatomic, strong) ICUserCarInformationModel *carInfoModel;/**<模型*/

@end
