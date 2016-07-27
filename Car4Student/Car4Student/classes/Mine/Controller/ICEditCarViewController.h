//
//  ICEditCarViewController.h
//  iCar4ios
//
//  Created by apple开发 on 16/6/3.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICBaseViewController.h"

@class ICUserCarInformationModel;

@interface ICEditCarViewController : ICBaseViewController

@property (nonatomic, copy) NSString *car_id;/**<<#注释#>*/

@property(nonatomic, strong) ICUserCarInformationModel *carInfoModel;/**<模型*/


@end
