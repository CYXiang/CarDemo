//
//  BSBindViewController.h
//  Global
//
//  Created by apple开发 on 16/1/20.
//
//

#import "ICBaseViewController.h"


typedef NS_ENUM(NSUInteger,BSSetUpOptionType) {
    BSSetUpOptionTypeBind,      /**<绑定手机*/
    BSSetUpOptionTypeEdit = 1     /**<修改原始密码*/
};


@interface BSBindViewController : ICBaseViewController

@property (nonatomic, assign) BSSetUpOptionType optionType;     /**<设置密码类型(注册/忘记密码)*/
@property (nonatomic, copy) NSString *openID;/**<<#注释#>*/
@end
