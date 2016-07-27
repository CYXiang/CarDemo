//
//  BSUserInfo.m
//  Global
//
//  Created by fanny on 15/12/4.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import "BSUserInfo.h"

@implementation BSUserInfo

@synthesize isLogin,user_name,user_id,mobile,nickname,avatar,session_id;


/**
 *  单例初始化
 *
 *  @return 返回单例类
 */
static BSUserInfo * user = nil;
+ (BSUserInfo *)shareUserInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 如果存在从沙盒中读取，否则创建
        NSData *data = [NSUser_defaul objectForKey:@"LoginInfo"];
        if (data == nil) {
            user = [[BSUserInfo alloc] init];
        }
        else {
            //解档
            user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
    });
    
    return user;
}


/**
 *  归档用户模型数据
 *
 *  @param coder 操作
 */
- (void)encodeWithCoder:(NSCoder *)coder {
    
    
    [coder encodeObject:[NSNumber numberWithBool:self.isLogin] forKey:@"isLogin"];
    [coder encodeObject:self.user_name forKey:@"userName"];
    [coder encodeObject:self.user_id forKey:@"userId"];
    [coder encodeObject:self.mobile forKey:@"mobile"];
    [coder encodeObject:self.nickname forKey:@"nickname"];
    [coder encodeObject:self.avatar forKey:@"avatar"];
    [coder encodeObject:self.session_id forKey:@"token"];
    
}

/**
 *  解档
 *
 *  @param coder 操作
 *
 *  @return 返回单例
 */
- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        
        self.isLogin = [[coder decodeObjectForKey:@"isLogin"] boolValue];
        self.user_name = [coder decodeObjectForKey:@"userName"];
        self.user_id = [coder decodeObjectForKey:@"userId"];
        self.mobile = [coder decodeObjectForKey:@"mobile"];
        self.nickname = [coder decodeObjectForKey:@"nickname"];
        self.avatar = [coder decodeObjectForKey:@"avatar"];
        self.session_id = [coder decodeObjectForKey:@"token"];
        
    }
    return self;
}

//同步数据
- (void)synchronize {
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[BSUserInfo shareUserInstance]];
    [NSUser_defaul setObject:data forKey:@"LoginInfo"];
    [NSUser_defaul synchronize];
}

/**
 *  设置用户信息，并归档, 登录成功后调用
 *
 *  @param result 用户数据模型
 */
- (void)setValueByUserInfo:(BSUserInfo *)result {
    
    self.isLogin = YES;
    self.user_name = result.user_name;
    self.user_id = result.user_id;
    self.mobile = result.mobile;
    self.nickname = result.nickname;
    self.avatar = result.avatar;
    self.session_id = result.session_id;
    
    [self synchronize];
}

/**
 *  退出当前账号
 *
 *  @param resultBlock 块回去当前结果
 */
- (void)logoutBlock:(void(^)(BOOL resultRet))resultBlock {
    
    [NSUser_defaul removeObjectForKey:@"LoginInfo"];
    [NSUser_defaul synchronize];
    
    self.isLogin = NO;
    self.user_name = nil;
    self.user_id = nil;
    self.mobile = nil;
    self.nickname = nil;
    self.avatar = nil;
    self.session_id = nil;

    
    resultBlock(YES);
}




@end
