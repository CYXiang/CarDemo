//
//  UIBarButtonItem+Extension.m
//  BiShe
//
//  Created by Apple on 15/12/18.
//
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 30)];
    // 设置尺寸
    btn.size = CGSizeMake(60, 44);//btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

/**
 *  <#Description#>
 *
 *  @param title     <#title description#>
 *  @param target    <#target description#>
 *  @param action    <#action description#>
 *  @param image     <#image description#>
 *  @param highImage <#highImage description#>
 *
 *  @return <#return value description#>
 */
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title Target:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    CGSize btnsize = [title sizeMakeWithFont:btn.titleLabel.font];

    [btn setTitleEdgeInsets:UIEdgeInsetsMake(5, -60, 3, 10)];
    // 设置图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(5, btnsize.width + 30, 3, 55)];
    
    // 设置尺寸
    
    btn.size = CGSizeMake(btnsize.width + 60, 44);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title Target:(id)target action:(SEL)action
{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    btn.size = CGSizeMake(60, 44);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];

}

@end
