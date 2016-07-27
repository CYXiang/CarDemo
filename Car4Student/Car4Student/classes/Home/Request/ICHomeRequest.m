//
//  ICHomeRequest.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/27.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICHomeRequest.h"
#import "ICIllegalModel.h"

@implementation ICHomeRequest

/**
 *  <#Description#>
 *
 *  @param param   <#param description#>
 *  @param success <#success description#>
 *  @param warn    <#warn description#>
 *  @param failure <#failure description#>
 */
+ (void)getIllegalInformationWithParamter:(NSDictionary *)param
                                  success:(void (^)(ICIllegalModel * resultArray))success
                                     warn:(void (^)(NSString *warnMsg))warn
                                  failure:(void (^)(NSError *error))failure {
    
    [self postResultWithUrl:home_illegal
                        param:param
                  resultClass:[ICIllegalModel class]
                      success:success
                         warn:warn
                      failure:failure
                 tokenInvalid:nil];
}


+ (void)editCarInformationWithParamter:(NSDictionary *)param
                               success:(void (^)(NSArray * resultArray))success
                                  warn:(void (^)(NSString *warnMsg))warn
                               failure:(void (^)(NSError *error))failure{
    
    [self postResultWithUrl:home_illegal
                      param:param
                resultClass:[NSDictionary class]
                    success:success
                       warn:warn
                    failure:failure
               tokenInvalid:nil];

}



@end
