//
//  BSNotNetworkView.h
//  BiShe
//
//  Created by fanny on 15/12/14.
//
//

#import <UIKit/UIKit.h>

/**
 *  无网线页面
 */
@interface BSNotNetworkView : UIView


+ (instancetype)creatViewWithRect:(CGRect)rect;

/**
 *  按钮点击回调
 *
 *  @param block 执行的代码
 */
- (void)setTargetAtBlock:(void(^)())block;

@end
