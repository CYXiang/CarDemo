//
//  ICSwtichSettingItem.h
//  iCar4ios
//
//  Created by apple开发 on 16/6/1.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICMineSettingitem.h"

@interface ICSwtichSettingItem : ICMineSettingitem

@property (nonatomic, assign) BOOL isOn;

@property (nonatomic, strong) void(^isOnOpertion)();


@end
