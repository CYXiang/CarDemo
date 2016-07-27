//
//  ICMineGroupitem.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/23.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICMineGroupitem.h"

@implementation ICMineGroupitem


+ (instancetype)groupWithItems:(NSArray *)items
{
    ICMineGroupitem *group = [[self alloc] init];
    
    group.items = items;
    
    return group;
}

@end
