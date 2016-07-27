//
//  ICUserCarInformationModel.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/27.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICUserCarInformationModel.h"

@implementation ICUserCarInformationModel

- (NSString *)add_time {

    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    // 日期的格式
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 把返回的字符串转化为NSDate格式
    NSDate *createdAtDate = [fmt dateFromString:_add_time];

    return [fmt stringFromDate:createdAtDate];
}

@end
