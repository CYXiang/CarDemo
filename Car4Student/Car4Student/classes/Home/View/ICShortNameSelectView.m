//
//  ICShortNameSelectView.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/26.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICShortNameSelectView.h"

@interface ICShortNameSelectView ()

@property (nonatomic, strong) UIButton *tempBtn; /**< 标记btn */

@end

@implementation ICShortNameSelectView

/**
 *  添加子控件
 */
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpContentView];
        [self setUpData];
    }
    return self;
    
}

- (void)setUpContentView {

    CGFloat shortNameViewH = ScreenWidth / 7 * 5; // 总高度
    
    // 蒙版背景
    UIButton *alphaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    alphaButton.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    alphaButton.backgroundColor = [UIColor blackColor];
    alphaButton.alpha = 0.01;
    [alphaButton addTarget:self action:@selector(hiddenClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:alphaButton];
    self.alphaButton = alphaButton;
    
    
    UIView *shortNameView = [[UIView alloc] init];
    shortNameView.frame = CGRectMake(0, self.frame.size.height, ScreenWidth, shortNameViewH);

    shortNameView.backgroundColor = Color_FFFFFF;
    [self addSubview:shortNameView];
    self.shortNameView = shortNameView;
    

}

- (void)setUpData{

    NSArray *squaresName = @[@"京", @"津", @"沪", @"渝", @"京", @"冀", @"晋", @"辽", @"吉", @"黑", @"苏", @"浙", @"皖", @"闽", @"赣", @"鲁", @"豫", @"鄂", @"湘", @"粤", @"琼", @"川", @"贵", @"云",@"陕", @"甘", @"青", @"藏", @"桂", @"宁", @"新", @"台"];
    [self createSquares:squaresName];
    
}


/**
 *  根据模型数据创建方块
 *
 *  @param squares 模型数据
 */
- (void)createSquares:(NSArray *)squares{
    
    // 一行有几列
    int col = 7;
    NSUInteger count = squares.count;
    
    CGFloat buttonW = self.width / col;
    CGFloat buttonH = buttonW;
    
    for (int i = 0; i < count; i++) {
        // 添加子控件
        UIButton *button = [[UIButton alloc]init];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.shortNameView addSubview:button];
        
        // 设置frame
        button.width = buttonW;
        button.height = buttonH;
        button.x = (i % col) * buttonW;
        button.y = (i / col) * buttonH;
        
        // 在button内部设置设置数据
        [button setTitle:squares[i] forState:UIControlStateNormal];
        button.titleLabel.font = Font_30;
        [button setBackgroundImage:[UIImage imageNamed:@"addres_nor"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"addres_pre"] forState:UIControlStateHighlighted];
        [button setBackgroundImage:[UIImage imageNamed:@"addres_pre"] forState:UIControlStateSelected];
        [button setTitleColor:Color_666666 forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];

    }

    self.shortNameView.height = self.subviews.lastObject.bottom;
    
    
}


- (void)buttonClick:(UIButton *)button{
    
    if ([self.delegate respondsToSelector:@selector(shortNameBtttonDidClick:)]) {
        [self.delegate shortNameBtttonDidClick:button];
    }
    
    self.tempBtn.selected = NO;
    button.selected = YES;
    self.tempBtn = button;
    [self hiddenClick];
    
}

/**
 *  隐藏蒙版
 */
- (void)hiddenClick
{
    if ([self.delegate respondsToSelector:@selector(shortNameSelectViewhiddenDidClick:)]) {
        [self.delegate shortNameSelectViewhiddenDidClick:self];
    }
    
}


@end
