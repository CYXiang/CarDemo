//
//  BSUtilityView.h
//  BiShe
//
//  Created by Apple on 15/12/12.
//
//

#import <Foundation/Foundation.h>

@interface BSUtilityView : NSObject
/**
 *  添加底部结算子栏
 *
 *  @param title 左边文字
 *  @param value 右边数值
 *  @param viewY 所在Y值
 *  @param isValueDel 右边数值带画线
 *  @param hasLine 是否有下横线
 *
 *  @return 返回View
 */
+ (UIView *)addItemViewWithTitle:(NSString *)title
                                 value:(NSString *)value
                                 viewY:(CGFloat)viewY
                            isValueDel:(BOOL)isValueDel
                               hasLine:(BOOL)hasLine;

/**
 *  添加底部结算子栏
 *
 *  @param title 左边文字
 *  @param value 右边数值
 *  @param viewY 所在Y值
 *  @param isValueDel 右边数值带画线
 *
 *  @return 返回带有下横线View
 */
+ (UIView *)addItemViewWithTitle:(NSString *)title
                                 value:(NSString *)value
                                 viewY:(CGFloat)viewY
                            isValueDel:(BOOL)isValueDel;

/**
 *  每组头部
 *
 *  @param title 头部标题
 *  @param desc  头部描述
 *  @param lineLeftPadding  底部线距离左边的边距
 *
 *  @return 返回头部View
 */
+ (UIView *)sectionViewWithTitle:(NSString *)title desc:(NSString *)desc lineLeftPadding:(CGFloat)lineLeftPadding;
@end
