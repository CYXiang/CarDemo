//
//  NSString+Format.h
//  BiShe
//
//  Created by fanny on 15/12/15.
//
//

#import <Foundation/Foundation.h>

/**
 *  字符串格式化
 */
@interface NSString (Format)


/**
 *  数据MD5
 *
 *  @return MD5之后的数据
 */
- (NSString *)stringFromMD5;

/**
 *  数字转字符串,带千位符(逗号)
 *
 *  @return 返回带千位符的字符串
 */
- (NSString *)toFormatNumberString;

@end
