//
//  ICIllegalListModel.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/27.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICIllegalListModel : NSObject

@property (nonatomic, copy) NSString *date;/**<<#注释#>*/
@property (nonatomic, copy) NSString *area;/**<<#注释#>*/
@property (nonatomic, copy) NSString *act;/**<<#注释#>*/
@property (nonatomic, copy) NSString *code;/**<<#注释#>*/
@property (nonatomic, copy) NSString *fen;/**<<#注释#>*/
@property (nonatomic, copy) NSString *money;/**<<#注释#>*/
@property (nonatomic, copy) NSString *handled;/**<<#注释#>*/


/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

@end
