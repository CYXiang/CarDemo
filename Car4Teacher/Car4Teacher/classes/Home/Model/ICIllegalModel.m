//
//  ICIllegalModel.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/27.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICIllegalModel.h"
#import "ICIllegalListModel.h"

@implementation ICIllegalModel

+ (NSDictionary *)objectClassInArray
{
    return @{
             @"lists"   : [ICIllegalListModel class],
             };
}



@end
