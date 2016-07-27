//
//  ICMineRequest.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/27.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICMineRequest.h"
#import "ICUserCarInformationModel.h"

@implementation ICMineRequest

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
                                failure:(void (^)(NSError *error))failure {
    
    [self postItemListWithUrl:mine_myList
                        param:param
                  resultClass:[ICUserCarInformationModel class]
                      success:success
                         warn:warn
                      failure:failure
                 tokenInvalid:nil];
}


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
                                  failure:(void (^)(NSError *error))failure {
    
    [self postResultWithUrl:mine_removeCar
                      param:param
                resultClass:[NSDictionary class]
                    success:success
                       warn:warn
                    failure:failure tokenInvalid:nil];
}

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
                                 failure:(void (^)(NSError *error))failure {
    
    [self postResultWithUrl:home_carInfo
                      param:param
                resultClass:[NSDictionary class]
                    success:success
                       warn:warn
                    failure:failure tokenInvalid:nil];
}

/**
 *  用户消息推送开关接口
 *
 *  @param param   <#param description#>
 *  @param success <#success description#>
 *  @param warn    <#warn description#>
 *  @param failure <#failure description#>
 */
+ (void)settingPushWithParamter:(NSDictionary *)param
                        success:(void (^)(NSDictionary *result))success
                           warn:(void (^)(NSString *warnMsg))warn
                        failure:(void (^)(NSError *error))failure{
    [self postResultWithUrl:mine_settingPush
                      param:param
                resultClass:[NSDictionary class]
                    success:success
                       warn:warn
                    failure:failure tokenInvalid:nil];


}

/**
 *  用户意见提交
 *
 *  @param param   <#param description#>
 *  @param success <#success description#>
 *  @param warn    <#warn description#>
 *  @param failure <#failure description#>
 */
+ (void)feedbackWithParamter:(NSDictionary *)param
                              success:(void (^)(NSMutableArray * resultArray))success
                                 warn:(void (^)(NSString *warnMsg))warn
                              failure:(void (^)(NSError *error))failure {
    
    [self postResultWithUrl:mine_Feedback
                      param:param
                resultClass:[NSDictionary class]
                    success:success
                       warn:warn
                    failure:failure tokenInvalid:nil];
}


@end
