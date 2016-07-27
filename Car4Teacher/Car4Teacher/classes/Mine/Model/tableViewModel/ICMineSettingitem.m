//
//  ICMineSettingitem.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/23.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICMineSettingitem.h"

@implementation ICMineSettingitem

+ (instancetype)itemWithtitle:(NSString *)title imageName:(NSString *)imageName{
    
    ICMineSettingitem *item = [[self alloc]init];
    
    item.imageName = imageName;
    item.title = title;
    
    
    
    return item;
}



@end
