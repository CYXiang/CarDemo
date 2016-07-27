//
//  UIBarButtonItem+Extension.h
//  BiShe
//
//  Created by Apple on 15/12/18.
//
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title Target:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

/**
 *  创建UIBarButtonItem
 *
 *  @param title  <#title description#>
 *  @param target <#target description#>
 *  @param action <#action description#>
 *
 *  @return <#return value description#>
 */
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title Target:(id)target action:(SEL)action;

@end
