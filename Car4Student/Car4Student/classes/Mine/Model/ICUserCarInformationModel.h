//
//  ICUserCarInformationModel.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/27.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  用户的车辆信息Model
 */
@interface ICUserCarInformationModel : NSObject

@property (nonatomic, copy) NSString *car_id;/**<车辆ID*/
@property (nonatomic, copy) NSString *user_id;/**<会员ID*/
@property (nonatomic, copy) NSString *province_id;/**<所属省份ID*/
@property (nonatomic, copy) NSString *city_id;/**<所属城市ID*/
@property (nonatomic, copy) NSString *car_plate;/**<完整的7位车牌号信息*/
@property (nonatomic, copy) NSString *car_class;/**<车架号*/
@property (nonatomic, copy) NSString *car_engine;/**<发动机号*/
@property (nonatomic, copy) NSString *car_type;/**<车辆类型(01：大型汽车号牌，02：小型汽车号牌，03：使馆汽车号牌)*/
@property (nonatomic, copy) NSString *add_time;/**<添加时间*/
@property (nonatomic, copy) NSString *province_name;/**<所属省份名称*/
@property (nonatomic, copy) NSString *city_name;/**<所属城市名称*/

@end
