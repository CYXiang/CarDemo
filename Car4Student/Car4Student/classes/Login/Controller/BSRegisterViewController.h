//
//  BSRegisterViewController.h
//  Global
//
//  Created by fanny on 15/12/7.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  注册界面
 */
@interface BSRegisterViewController : ICBaseViewController

/**
 *  登录成功后回调
 */
@property(nonatomic, strong)void (^ login)(BOOL isSuccess);

@end
