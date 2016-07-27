//
//  BSBaseRequest.m
//  Haigoucang
//
//  Created by Apple on 15/11/17.
//  Copyright © 2015年 apple开发. All rights reserved.
//

#import "BSBaseRequest.h"
#import "BSHttpRequest.h"
#import "BSBaseRequest.h"
#import "ExceptionMsgTips.h"
#import "MJExtension.h"

/**
 *  新的网络请求方法，以后都将使用这个类，NetRequestClass废弃使用
 */
@implementation BSBaseRequest

+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [param keyValues];
    
    [BSHttpRequest get:url params:[self requestParams:params] success:^(id responseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

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
               tokenInvalid:(void (^)())tokenInvalid
{
    
    [self postBaseWithUrl:url param:param resultClass:resultClass
                  success:^(id responseObj) {
                      if (!resultClass || !responseObj[@"result"][@"list"]) {
                          success(nil);
                          return;
                      }
                      success([resultClass objectArrayWithKeyValuesArray:responseObj[@"result"][@"list"]]);
                  }
                     warn:warn
                  failure:failure
             tokenInvalid:tokenInvalid];
}

/**
 *  返回result下item_list 数组模型(带HUD)
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
                  tokenInvalid:(void (^)())tokenInvalid
{
    
    [self postBaseHUDWithUrl:url param:param resultClass:resultClass
                     success:^(id responseObj) {
                         if (!resultClass || !responseObj[@"result"][@"list"]) {
                             success(nil);
                             return;
                         }
                         success([resultClass objectArrayWithKeyValuesArray:responseObj[@"result"][@"list"]]);
                     }
                        warn:warn
                     failure:failure
                tokenInvalid:tokenInvalid];
}

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
             tokenInvalid:(void (^)())tokenInvalid
{
    
    [self postBaseWithUrl:url param:param resultClass:resultClass
                  success:^(id responseObj) {
                      if (!resultClass) {
                          success(nil);
                          return;
                      }
                      success([resultClass objectWithKeyValues:responseObj[@"result"]]);
                  }
                     warn:warn
                  failure:failure
             tokenInvalid:tokenInvalid];
}

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
+ (void)postResultHUDWithUrl:(NSString *)url param:(id)param
                 resultClass:(Class)resultClass
                     success:(void (^)(id result))success
                        warn:(void (^)(NSString *warnMsg))warn
                     failure:(void (^)(NSError *error))failure
                tokenInvalid:(void (^)())tokenInvalid
{
    
    [self postBaseHUDWithUrl:url param:param resultClass:resultClass
                     success:^(id responseObj) {
                         if (!resultClass) {
                             success(nil);
                             return;
                         }
                         success([resultClass objectWithKeyValues:responseObj[@"result"]]);
                     }
                        warn:warn
                     failure:failure
                tokenInvalid:tokenInvalid];
}

/**
 *  数据模型基类
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param resultClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn         请求失败后警告提示语（是一个字符串，直接弹出显示即可）
 *  @param failure      请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 *  @param tokenInvalid token过期后的回调（请将token后想做的事情写到这个block中）
 */
+ (void)postBaseWithUrl:(NSString *)url param:(id)param
            resultClass:(Class)resultClass
                success:(void (^)(id result))success
                   warn:(void (^)(NSString *warnMsg))warn
                failure:(void (^)(NSError *error))failure
           tokenInvalid:(void (^)())tokenInvalid
{
    url = [NSString stringWithFormat:@"%@%@",Host,url];
    NSDictionary *params = [param keyValues];
    
    DR_NSLog(@"\n请求链接地址---> %@",url);
    //状态栏菊花
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [BSHttpRequest post:url params:[self requestParams:params] success:^(id responseObj) {
        if (success) {
            NSDictionary *dictData = [NSJSONSerialization JSONObjectWithData:responseObj options:kNilOptions error:nil];
            DR_NSLog(@"请求成功，返回数据 : %@",dictData);
            int code=[dictData[@"code"] intValue];
            if (code == 200) {
                success(dictData);
            } else if (code == 272001 && tokenInvalid) { // token 过期
                tokenInvalid();
            } else if(code == 275023){
                tokenInvalid(); // 用户没有登录
            }else {
                // 需要特殊处理显示的文字，请在ExceptionMsgTips写一个统一处理方法，优先处理，再执行下面的
                //warn([ExceptionMsgTips getExceptionMessageAtCode:code]);
                if (warn) {
                   warn([dictData[@"msg"] description]);
                }
            }
        }
        //状态栏菊花
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            DR_NSLog(@"请求失败：%@",error);
        }
        //状态栏菊花
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

/**
 *  数据模型基类(带HUD)
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param resultClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param warn         请求失败后警告提示语（是一个字符串，直接弹出显示即可）
 *  @param failure      请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 *  @param tokenInvalid token过期后的回调（请将token后想做的事情写到这个block中）
 */
+ (void)postBaseHUDWithUrl:(NSString *)url param:(id)param
               resultClass:(Class)resultClass
                   success:(void (^)(id result))success
                      warn:(void (^)(NSString *warnMsg))warn
                   failure:(void (^)(NSError *error))failure
              tokenInvalid:(void (^)())tokenInvalid
{
    [MBProgressHUD showMessage:@""];
    [self postBaseWithUrl:url param:param resultClass:resultClass success:^(id responseObj) {
        [MBProgressHUD hideHUD];    //隐藏loading
        success(responseObj);
    } warn:^(NSString *warnMsg) {
        [MBProgressHUD hideHUD];
        warn(warnMsg);
    } failure:^(NSError *fail) {
        [MBProgressHUD hideHUD];
        failure(fail);
    } tokenInvalid:^{
        [MBProgressHUD hideHUD];
        tokenInvalid();
    }];
}

/**
 *  组合请求参数
 *
 *  @param dict 外部参数字典
 *
 *  @return 返回组合参数
 */
+ (NSMutableDictionary *)requestParams:(NSDictionary *)dict
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMddHHmm"];
    
    NSString *temptime = [dateFormat stringFromDate:[NSDate date]];
    NSString *randString = [self getRandString];
    NSString *apiKey = @"ios";
    NSString *token = [BSUserInfo shareUserInstance].session_id;
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
//    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
//    [params setObject:[NSString stringWithFormat:@"iOS %@|V-%@",systemVersion,version] forKey:@"source"];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (dict) {
        params = [dict mutableCopy];
    }
    
    [params setObject:randString forKey:@"rand"];
    [params setObject:apiKey forKey:@"identity"];
    [params setObject:temptime forKey:@"timestamp"];
    if (token) {
        [params setObject:token?token:@"" forKey:@"token"];
    }
    [params setObject:[NSString stringWithFormat:@"ios-v%@",version] forKey:@"source"];
    [params setObject:[self getSignWithParams1:params] forKey:@"sign"];
    
    DR_NSLog(@"网络请求参数--->\n %@",params);
    return params;
}

/**
 *  获取MD5签名
 
 签名算法：
 第一步，设所有发送或者接收到的数据为集合M，将集合M内非空参数值的参数按照【参数名】ASCII码从小到大排序（字典序），
 使用【参数值】连接方式（即value1value2…）拼接成字符串stringA。
 特别注意以下重要规则：
 
 ◆ 参数名ASCII码从小到大排序（字典序）；
 ◆ 参数名区分大小写；
 
 第二步，在stringA最后拼接上key=(API密钥的值)得到stringSignTemp字符串，
 并对stringSignTemp进行MD5运算，即得到api_sign的值
 
 例子：
 
 请求参数
 b=diven
 a=1
 f=test
 
 API密钥值hgcanapp@2015!
 
 则stringA=1diventest
 stringSignTemp = 1diventesthgcanapp@2015!
 api_sign = md5(stringSignTemp)
 
 *
 *
 *  @param params 需要签名的参数
 *
 *  @return 返回签名
 */
+ (NSString *)getSignWithParams1:(NSMutableDictionary *)params
{
    // 1. 获取所有的参数
    NSArray *keys = [params allKeys];
    // 2. 对所有的key进行
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    // 3.组合签名参数
    NSString *sign = @"";
    for (NSString *key in sortedArray) {
        sign = [NSString stringWithFormat:@"%@%@",sign,params[key]];
    }
    
    sign = [NSString stringWithFormat:@"%@%@",sign,Private_Key];
    
    DR_NSLog(@"\n------------------sign-----------------\n%@\n\n",sign);
    
    sign = [sign stringFromMD5];

    
    return [sign lowercaseString];
}

// 获取随机字符串
+ (NSString *)getRandString {
    int NUMBER_OF_CHARS = (arc4random() % 12) + 6;;
    
//    char data[NUMBER_OF_CHARS];
//    
//    for (int x=0;xchar)('A' + (arc4random_uniform(26))));
//    
//    NSString *dataPoint = [[NSString alloc] initWithBytes:data length:NUMBER_OF_CHARS encoding:NSUTF8StringEncoding];
    
    
    char data[NUMBER_OF_CHARS];
    for (int x=0;x<NUMBER_OF_CHARS;data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:NUMBER_OF_CHARS encoding:NSUTF8StringEncoding];
    
}

@end
