//
//  BSNotNetworkView.m
//  BiShe
//
//  Created by fanny on 15/12/14.
//
//

#import "BSNotNetworkView.h"


@interface BSNotNetworkView ()

@property (nonatomic, strong) UIImageView * imageView;/**<无网络时图标*/
@property (nonatomic, strong) UILabel     * label;/**<提示文字*/
@property (nonatomic, strong) UIButton    * button;/**<重新加载按钮*/

/** 定义回调block */
@property(nonatomic, strong) void (^ block)();

@end

@implementation BSNotNetworkView



+ (instancetype)creatViewWithRect:(CGRect)rect {
    return [[self alloc] initWithFrame:rect];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = Color_EEEEEE;
        
        self.imageView = [[UIImageView alloc] init];
        [self.imageView setImage:[UIImage imageNamed:@"common_error"]];
        [self addSubview:self.imageView];
        
        self.label = [[UILabel alloc] init];
        self.label.text = @"亲，您的手机网络不太顺畅哦~";
        self.label.font = Font_30;
        self.label.textColor = Color_777777;
        [self addSubview:self.label];
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.button setTitle:@"重新加载" forState:UIControlStateNormal];
        self.button.titleLabel.font = Font_28;
        [self.button setTitleColor:Color_FFFFFF forState:UIControlStateNormal];
        self.button.backgroundColor = Color_2F2F2F;
        [self.button addTarget:self action:@selector(clickNotNetwordButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.button];
        
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.centerX.equalTo(self.mas_centerX);
        }];
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.label);
            make.bottom.equalTo(self.label.mas_top).offset(-16);
        }];
        
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.label);
            make.top.equalTo(self.label.mas_bottom).offset(20);
            make.size.mas_equalTo(CGSizeMake(76, 28));
        }];
        
    }
    return self;
}

/**
 *  按钮点击回调
 *
 *  @param block 执行的代码
 */
- (void)setTargetAtBlock:(void(^)())block {
    self.block = block;
}

- (void)clickNotNetwordButton:(UIButton *)sender {
    if (self.block) {
        self.block();
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
