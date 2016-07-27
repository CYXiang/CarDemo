//
//  ICShortNameSelectView.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/26.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICShortNameSelectView;

@protocol ICShortNameSelectViewDelegate <NSObject>
@optional

- (void)shortNameSelectViewhiddenDidClick:(ICShortNameSelectView *)shortNameSelectView;

- (void)shortNameBtttonDidClick:(UIButton *)button;


@end

@interface ICShortNameSelectView : UIView

/** 蒙版，内部传外 */
@property(nonatomic, weak) UIButton *alphaButton;

@property(nonatomic, weak) UIView *shortNameView; /**< 省份简称View */

/** 定义代理 */
@property(nonatomic,weak) id<ICShortNameSelectViewDelegate>  delegate;



@end
