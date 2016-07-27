//
//  BSUserInfo.h
//  Global
//
//  Created by fanny on 15/12/4.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用户模型单例
 */
@interface BSUserInfo : NSObject<NSCoding>

/**
 *  单例初始化
 *
 *  @return 返回单例类
 */
+ (BSUserInfo *)shareUserInstance;

@property (nonatomic, assign) BOOL     isLogin;/**<判别用户是否已经登录*/
@property (nonatomic, copy  ) NSString *user_id;/**<用户ID*/
@property (nonatomic, copy  ) NSString *user_name;/**<用户名*/
@property (nonatomic, copy  ) NSString *mobile;/**<用户手机*/
@property (nonatomic, copy  ) NSString *session_id;/**<身份令牌*/
@property(nonatomic, copy)NSString *nickname;/**<昵称*/
@property(nonatomic, copy)NSString *avatar;/**<用户头像*/

@property (nonatomic, assign) NSUInteger position;/**<定位由哪个控制器push出登录界面，记录并登录成功后返回*/


/**
 *  同步数据，当资料修改后，调用些方法同步
 */
- (void)synchronize;


/**
 *  设置用户信息，并归档
 *
 *  @param result 传入的值
 */
- (void)setValueByUserInfo:(BSUserInfo *)result;

/**
 *  退出当前账号
 *
 *  @param resultBlock 块回去当前结果
 */
- (void)logoutBlock:(void(^)(BOOL resultRet))resultBlock;

@end
