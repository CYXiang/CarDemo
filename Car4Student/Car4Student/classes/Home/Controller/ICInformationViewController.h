//
//  ICInformationViewController.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/25.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICCarInfoModel;
@interface ICInformationViewController : UITableViewController


@property(nonatomic, strong) ICCarInfoModel *infoModel;/**<<#注释#>*/

@property (nonatomic, copy) NSString *hphm;/**<<#注释#>*/
@property (nonatomic, copy) NSString *engineno;/**<<#注释#>*/
@property (nonatomic, copy) NSString *classno;/**<<#注释#>*/
@property (nonatomic, copy) NSString *city;/**<<#注释#>*/

@end
