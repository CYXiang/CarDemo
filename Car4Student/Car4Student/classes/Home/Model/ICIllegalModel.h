//
//  ICIllegalModel.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/27.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICIllegalModel : NSObject

@property (nonatomic, copy) NSString *province;/**<省简称*/
@property (nonatomic, copy) NSString *city;/**<城市简称*/
@property (nonatomic, copy) NSString *hphm;/**<号牌号码*/
@property (nonatomic, copy) NSString *engineno;/**<<#注释#>*/

@property (nonatomic, copy) NSArray *lists;/**<违规列表*/

@end




