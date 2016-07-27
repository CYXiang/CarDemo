//
//  ICHomeHeaderView.h
//  iCar4ios
//
//  Created by apple开发 on 16/5/23.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDCycleScrollView;

@protocol ICHomeHeaderViewDelegate <NSObject>
@optional

- (void)homeHeaderViewStartqureyDidClick:(UIButton *)button;

@end

@interface ICHomeHeaderView : UIView

@property (weak, nonatomic) IBOutlet SDCycleScrollView *bannerView;

@property (nonatomic, weak) id<ICHomeHeaderViewDelegate> delegate; /**< 代理 */


@end
