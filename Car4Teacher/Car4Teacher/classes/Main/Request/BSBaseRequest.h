//
//  BSBaseRequest.h
//  Haigoucang
//
//  Created by Apple on 15/11/17.
//  Copyright © 2015年 apple开发. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSBaseRequest : NSObject

+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure;

/**
 *  返回result下item_list 数组模型
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param resultClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn         请求失败后警告提示语（是一个字符串，直接弹出显示即可）
 *  @param failure      请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 *  @param tokenInvalid token过期后的回调（请将token后想做的事情写到这个block中）
 */
+ (void)postItemListWithUrl:(NSString *)url param:(id)param
                resultClass:(Class)resultClass
                    success:(void (^)(id result))success
                       warn:(void (^)(NSString *warnMsg))warn
                    failure:(void (^)(NSError *error))failure
               tokenInvalid:(void (^)())tokenInvalid;

/**
 *  返回result下item_list 数组模型（带HUD）
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param resultClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn         请求失败后警告提示语（是一个字符串，直接弹出显示即可）
 *  @param failure      请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 *  @param tokenInvalid token过期后的回调（请将token后想做的事情写到这个block中）
 */
+ (void)postItemListHUDWithUrl:(NSString *)url param:(id)param
                   resultClass:(Class)resultClass
                       success:(void (^)(id result))success
                          warn:(void (^)(NSString *warnMsg))warn
                       failure:(void (^)(NSError *error))failure
                  tokenInvalid:(void (^)())tokenInvalid;

/**
 *  返回result 数据模型
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param resultClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn         请求失败后警告提示语（是一个字符串，直接弹出显示即可）
 *  @param failure      请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 *  @param tokenInvalid token过期后的回调（请将token后想做的事情写到这个block中）
 */
+ (void)postResultWithUrl:(NSString *)url param:(id)param
              resultClass:(Class)resultClass
                  success:(void (^)(id result))success
                     warn:(void (^)(NSString *warnMsg))warn
                  failure:(void (^)(NSError *error))failure
             tokenInvalid:(void (^)())tokenInvalid;

/**
 *  返回result 数据模型（带HUD）
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param resultClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn         请求失败后警告提示语（是一个字符串，直接弹出显示即可）
 *  @param failure      请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 *  @param tokenInvalid token过期后的回调（请将token后想做的事情写到这个block中）
 */
+ (void)postResultHUDWithUrl:(NSString *)url param:(id)param
                 resultClass:(Class)resultClass
                     success:(void (^)(id result))success
                        warn:(void (^)(NSString *warnMsg))warn
                     failure:(void (^)(NSError *error))failure
                tokenInvalid:(void (^)())tokenInvalid;

/**
 *  组合请求参数
 *
 *  @param dict 外部参数字典
 *
 *  @return 返回组合参数
 */
+ (NSMutableDictionary *)requestParams:(NSDictionary *)dict;

@end
