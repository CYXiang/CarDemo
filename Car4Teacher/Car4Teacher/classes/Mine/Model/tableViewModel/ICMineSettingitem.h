//
//  ICMineSettingitem.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/23.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICMineSettingitem : NSObject


@property (strong, nonatomic) NSString * title;/**< 标题 */
@property (strong, nonatomic) NSString * imageName;/**< 图片 */
@property (nonatomic, strong) NSString *subTitle;


// 用来保存每一行cell的功能
@property (nonatomic, strong) void(^itemOpertion)();

+ (instancetype)itemWithtitle:(NSString *)title imageName:(NSString *)imageName;/**< 设置标题值 类方法 */


@end
