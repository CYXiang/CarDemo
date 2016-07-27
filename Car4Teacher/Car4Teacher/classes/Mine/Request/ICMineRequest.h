//
//  ICMineRequest.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/27.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "BSBaseRequest.h"

@interface ICMineRequest : BSBaseRequest

/**
 *  请求用户车辆信息列表
 *
 *  @param param   <#param description#>
 *  @param success <#success description#>
 *  @param warn    <#warn description#>
 *  @param failure <#failure description#>
 */
+ (void)getCarListInformationWithParamter:(NSDictionary *)param
                                  success:(void (^)(NSMutableArray * resultArray))success
                                     warn:(void (^)(NSString *warnMsg))warn
                                  failure:(void (^)(NSError *error))failure;

/**
 *  删除车辆信息接口
 *
 *  @param param   <#param description#>
 *  @param success <#success description#>
 *  @param warn    <#warn description#>
 *  @param failure <#failure description#>
 */
+ (void)removeCarInformationWithParamter:(NSDictionary *)param
                                  success:(void (^)(NSMutableArray * resultArray))success
                                     warn:(void (^)(NSString *warnMsg))warn
                                  failure:(void (^)(NSError *error))failure;


/**
 *  获取车辆信息接口
 *
 *  @param param   <#param description#>
 *  @param success <#success description#>
 *  @param warn    <#warn description#>
 *  @param failure <#failure description#>
 */
+ (void)getCarInformationWithParamter:(NSDictionary *)param
                              success:(void (^)(NSMutableArray * resultArray))success
                                 warn:(void (^)(NSString *warnMsg))warn
                              failure:(void (^)(NSError *error))failure;
/**
 *  用户意见提交
 */
+ (void)feedbackWithParamter:(NSDictionary *)param
                     success:(void (^)(NSMutableArray * resultArray))success
                        warn:(void (^)(NSString *warnMsg))warn
                     failure:(void (^)(NSError *error))failure;

/**
 *  用户消息推送开关接口
 *
 *  @param param   <#param description#>
 *  @param success <#success description#>
 *  @param warn    <#warn description#>
 *  @param failure <#failure description#>
 */
+ (void)settingPushWithParamter:(NSDictionary *)param
                              success:(void (^)(NSDictionary * result))success
                                 warn:(void (^)(NSString *warnMsg))warn
                              failure:(void (^)(NSError *error))failure;

@end
