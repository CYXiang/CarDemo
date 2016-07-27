//
//  BSEmptyView.m
//  BiShe
//
//  Created by Apple on 15/12/10.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "BSEmptyView.h"

@interface BSEmptyView()
/** tips */
@property(nonatomic,weak) UILabel *tipsLabel;
/** 按钮文本 */
@property(nonatomic,weak) UIButton *operateButton;

/** 定义回调block */
@property(nonatomic, strong) void (^ block)();
@end

@implementation BSEmptyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = Color_EEEEEE;
        
        // tips 提示
        UILabel *tipsLabel = [[UILabel alloc] init];
        tipsLabel.textAlignment = NSTextAlignmentCenter;
        tipsLabel.textColor = Color_777777;
        tipsLabel.font = Font_28;
        [self addSubview:tipsLabel];
        self.tipsLabel = tipsLabel;
        
        // 按钮
        UIButton *operateButton = [[UIButton alloc] init];
        operateButton.titleLabel.font = Font_24;
        operateButton.backgroundColor = [UIColor blackColor];
        [operateButton setTitleColor:Color_FFFFFF forState:UIControlStateNormal];
        [operateButton addTarget:self action:@selector(operateClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:operateButton];
        self.operateButton = operateButton;
    }
    return self;
}

- (instancetype)initWithTips:(NSString *)tips btnTitle:(NSString *)btnTitle;
{
    if (self = [super init]) {
        self.tipsLabel.text = tips;
        [self.operateButton setTitle:btnTitle forState:UIControlStateNormal];
    }
    return self;
}

+ (instancetype)emptyViewWithTips:(NSString *)tips btnTitle:(NSString *)btnTitle
{
    return [[self alloc] initWithTips:tips btnTitle:btnTitle];
}

// 设置尺寸
- (void)setRect:(CGRect)rect
{
    // 背景
    self.frame = rect;
    
    // tips 提示
    CGSize tipsLabelSize = [self.tipsLabel.text sizeMakeWithFont:Font_28];
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(-70);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(tipsLabelSize);
    }];

    // 按钮
    [self.operateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.tipsLabel.mas_bottom).offset(24);
        make.size.mas_equalTo(CGSizeMake(76, 28));
    }];
}

- (void)setTargetAtBlock:(void (^)())block
{
    self.block = block;
}

- (void)operateClick:(UIButton *)sender
{
    self.block();
}
@end
