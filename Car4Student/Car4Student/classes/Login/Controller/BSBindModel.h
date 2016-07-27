//
//  BSBindModel.h
//  Global
//
//  Created by apple开发 on 16/1/20.
//
//

#import <Foundation/Foundation.h>
#import "BSUserInfo.h"
@interface BSBindModel : NSObject


@property (nonatomic, copy) NSString *tag;/**<<#注释#>*/
@property (nonatomic, copy) NSString *openid;/**<<#注释#>*/
@property (nonatomic, copy) NSString *msg;/**<<#注释#>*/

@property(nonatomic, strong) BSUserInfo *item;/**<<#注释#>*/

@end
