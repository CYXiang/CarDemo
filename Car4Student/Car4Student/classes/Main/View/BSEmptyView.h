//
//  BSEmptyView.h
//  BiShe
//
//  Created by Apple on 15/12/10.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BSEmptyView : UIView

/**
 *  初始化数据为空View
 *  调用：BSEmptyView *emptyView = [[BSEmptyView alloc] initWithTips:@"购物车空空如也" btnTitle:@"去首页"];
 *
 *  @param tips     提示语
 *  @param btnTitle 按钮标题
 *
 *  @return 返回初始化的View
 */
- (instancetype)initWithTips:(NSString *)tips btnTitle:(NSString *)btnTitle;

/**
 *  初始化数据为空View
 *  调用：BSEmptyView *emptyView = [BSEmptyView emptyViewWithTips:@"购物车空空如也" btnTitle:@"去逛逛"];
 *
 *  @param tips     提示语
 *  @param btnTitle 按钮标题
 *
 *  @return 返回初始化的View
 */
+ (instancetype)emptyViewWithTips:(NSString *)tips btnTitle:(NSString *)btnTitle;

/**
 *  设置尺寸
 *
 *  @param rect 尺寸大小
 */
- (void)setRect:(CGRect)rect;

/**
 *  按钮点击回调
 *
 *  @param block 执行的代码
 */
- (void)setTargetAtBlock:(void(^)())block;

@end
