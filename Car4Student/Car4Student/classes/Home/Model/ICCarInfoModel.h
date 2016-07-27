//
//  ICCarInfoModel.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/30.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICCarInfoModel : NSObject

@property (nonatomic, copy) NSString *hphm;/**< 号牌号码	*/
@property (nonatomic, copy) NSString *engineno;/**< 发动机号 */
@property (nonatomic, copy) NSString *classno;/**< 车架号	 */
@property (nonatomic, copy) NSString *city;/**< 城市 */

@end
