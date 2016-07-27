//
//  ICHomeRequest.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/27.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "BSBaseRequest.h"

@class ICIllegalModel;
@interface ICHomeRequest : BSBaseRequest

+ (void)getIllegalInformationWithParamter:(NSDictionary *)param
                                  success:(void (^)(ICIllegalModel * resultArray))success
                                     warn:(void (^)(NSString *warnMsg))warn
                                  failure:(void (^)(NSError *error))failure;

+ (void)editCarInformationWithParamter:(NSDictionary *)param
                                  success:(void (^)(NSArray * resultArray))success
                                     warn:(void (^)(NSString *warnMsg))warn
                                  failure:(void (^)(NSError *error))failure;




@end
