//
//  BSUtilityView.m
//  BiShe
//
//  Created by Apple on 15/12/12.
//
//

#import "BSUtilityView.h"

@implementation BSUtilityView

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
                               hasLine:(BOOL)hasLine
{
    CGFloat padding = 12;
    //CGFloat itemViewY = 48 + section * 32;
    
    UIView *itemView = [[UIView alloc] init];
    itemView.frame = CGRectMake(0,viewY, ScreenWidth, 32);
    itemView.backgroundColor = [UIColor whiteColor];
    
    // 商品合计
    NSString *itemTitle = title;
    NSString *itemValue = value;
    
    // 左边标题文字
    UILabel *itemTitleLable = [[UILabel alloc] init];
    itemTitleLable.font = Font_24;
    itemTitleLable.textColor = Color_777777;
    itemTitleLable.text = itemTitle;
    itemTitleLable.textAlignment = NSTextAlignmentCenter;
    CGSize itemTitleLableSize = [itemTitle sizeMakeWithFont:Font_24];
    itemTitleLable.frame = CGRectMake(padding, 0, itemTitleLableSize.width, itemView.height);
    [itemView addSubview:itemTitleLable];
    
    // 右边值
    UILabel *itemValueLable = [[UILabel alloc] init];
    itemValueLable.font = Font_24;
    itemValueLable.textColor = Color_777777;
    itemValueLable.text = itemValue;
    itemValueLable.textAlignment = NSTextAlignmentCenter;
    if (isValueDel) { // 增加删除数值线
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:itemValue];
        [attrStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, itemValue.length)];
        [itemValueLable setAttributedText:attrStr];
    }
    CGSize itemValueLableSize = [itemValue sizeMakeWithFont:Font_24];
    CGFloat itemValueLableX = ScreenWidth - itemValueLableSize.width - padding;
    itemValueLable.frame = CGRectMake(itemValueLableX, 0, itemValueLableSize.width, itemView.height);
    
    [itemView addSubview:itemValueLable];
    
    // 新增底部横线
    UIView *lineBottomView = [BSTool createLine];
    lineBottomView.frame = CGRectMake(padding, itemView.height - Line_side_heihgt, ScreenWidth - padding, Line_side_heihgt);
    [itemView addSubview:lineBottomView];
    
    return itemView;
}

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
                            isValueDel:(BOOL)isValueDel
{
   return [self addItemViewWithTitle:title value:value viewY:viewY isValueDel:isValueDel hasLine:YES];
}

/**
 *  每组头部
 *
 *  @param title 头部标题
 *  @param desc  头部描述
 *  @param lineLeftPadding  底部线距离左边的边距
 *
 *  @return 返回头部View
 */
+ (UIView *)sectionViewWithTitle:(NSString *)title desc:(NSString *)desc lineLeftPadding:(CGFloat)lineLeftPadding
{
    CGFloat sectionViewH = 36;
    
    UIView *sectionView = [[UIView alloc] init];
    // 订单总额标题
    UILabel *sectionTitleLabel = [[UILabel alloc] init];
    sectionTitleLabel.text = title;
    sectionTitleLabel.font = Font_24;
    sectionTitleLabel.textColor = Color_2F2F2F;
    sectionTitleLabel.textAlignment = NSTextAlignmentLeft;
    
    CGSize sectionTitleLabelSize = [sectionTitleLabel.text sizeMakeWithFont:Font_24];
    sectionTitleLabel.frame =  CGRectMake(padding_24, 0, sectionTitleLabelSize.width, sectionViewH);
    [sectionView addSubview:sectionTitleLabel];
    
    // 订单总额
    UILabel *sectionDescLabel = [[UILabel alloc] init];
    sectionDescLabel.text = desc;
    sectionDescLabel.font = Font_24;
    sectionDescLabel.textColor = Color_2F2F2F;
    sectionDescLabel.textAlignment = NSTextAlignmentRight;
    CGSize sectionDescLabelSize = [sectionDescLabel.text sizeMakeWithFont:Font_24];
    sectionDescLabel.frame =  CGRectMake(ScreenWidth - padding_24 - sectionDescLabelSize.width, 0, sectionDescLabelSize.width, sectionViewH);
    
    [sectionView addSubview:sectionDescLabel];
    
    // 添加分割线
    [sectionView addSubview:[BSTool createLineWithFrame:CGRectMake(lineLeftPadding, sectionViewH - Line_side_heihgt, ScreenWidth, Line_side_heihgt)]];
    
    return sectionView;
}
@end
