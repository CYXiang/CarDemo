//
//  ICUserInfoViewController.h
//  iCar4ios
//
//  Created by apple开发 on 16/6/3.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICBaseViewController.h"

@interface ICUserInfoViewController : ICBaseViewController

/**
 *  修改成功后回调
 */
@property(nonatomic, strong)void (^ editResult)(BOOL isSuccess);

@end
