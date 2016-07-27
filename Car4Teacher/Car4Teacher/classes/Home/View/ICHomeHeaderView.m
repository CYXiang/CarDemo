//
//  ICHomeHeaderView.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/23.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICHomeHeaderView.h"
#import "SDCycleScrollView.h"

@interface ICHomeHeaderView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bannerHeightConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addCarHeightConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *severHeightConstraint;


@end

@implementation ICHomeHeaderView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self.bannerHeightConstraint setConstant:self.width * 0.4];
    
    [self.addCarHeightConstraint setConstant:self.width * 0.6];
    
    [self.severHeightConstraint setConstant:self.width * 0.45];
}


- (IBAction)startQueryBtnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(homeHeaderViewStartqureyDidClick:)]) {
        [self.delegate homeHeaderViewStartqureyDidClick:sender];
    }
}


@end
