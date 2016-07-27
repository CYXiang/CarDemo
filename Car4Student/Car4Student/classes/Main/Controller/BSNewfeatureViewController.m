//
//  BSNewfeatureViewController.m
//  BiShe
//
//  Created by fanny on 15/12/4.
//  Copyright © 2015年 DR_Li. All rights reserved.
//

#import "BSNewfeatureViewController.h"
#import "AppDelegate.h"
#import "UIWindow+Extension.h"
#import "BSTabBarController.h"


// 新特性图片总数
#define NewfeatureCount 4

@interface BSNewfeatureViewController ()<UIScrollViewDelegate>

/** 滑动图片 分页 */
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation BSNewfeatureViewController

- (id)init {
    self = [super init];
    if (self) {
        // 1.添加UISrollView
        [self setupScrollView];
        
        // 2.添加pageControl
        [self setupPageControl];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    // 1.添加UISrollView
//    [self setupScrollView];
//    
//    // 2.添加pageControl
//    [self setupPageControl];
    
}


// 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

/**
 *  添加UISrollView
 */
- (void)setupScrollView
{
    UIScrollView *scrollView=[[UIScrollView alloc] init];
    scrollView.frame=self.view.bounds;
    scrollView.delegate=self;
    [self.view addSubview:scrollView];
    
    CGFloat scrollW=scrollView.width;
    CGFloat scrollH=scrollView.height;
    for (int i=0; i < NewfeatureCount;i++) {
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.width=scrollW;
        imageView.height=scrollH;
        imageView.y=0;
        imageView.x=i*scrollW;
        
        // 显示图片
        NSString *name=[NSString stringWithFormat:@"guide-%d",i+1];
        if (kiPhone4) {
            name = [name stringByAppendingString:@"-m.png"];
        } else if(kiPhone5){
            name = [name stringByAppendingString:@"-xl.png"];
        } else if(kiPhone6){
            name = [name stringByAppendingString:@"-md.png"];
        } else if(kiPhone6Plus){
            name = [name stringByAppendingString:@"-xxl.png"];
        } else{
            name = [name stringByAppendingString:@"-xxl.png"];
        }
        
        imageView.image=[UIImage imageNamed:name];
        if (i==(NewfeatureCount-1)) {
            [self setupLastImageView:imageView];
        }
        
        [scrollView addSubview:imageView];
    }
    
    // 3.设置scrollView的其他属性
    // 如果想要某个方向上不能滚动，那么这个方向对应的尺寸数值传0即可
    scrollView.contentSize = CGSizeMake(NewfeatureCount * scrollW, 0);
    scrollView.bounces = NO; // 去除弹簧效果
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
}

/**
 *  添加pageControl
 */
- (void)setupPageControl
{
    UIPageControl *pageControl=[[UIPageControl alloc] init];
    pageControl.numberOfPages=NewfeatureCount;
    pageControl.currentPageIndicatorTintColor=Color_F24979;
//    pageControl.pageIndicatorTintColor=COLOR_RGBA(189, 189, 189,1.0);
    pageControl.centerX=self.view.width * 0.5;
    pageControl.centerY=self.view.height * 0.96;
    [pageControl setValue:[UIImage imageNamed:@"line-not-click"] forKeyPath:@"_pageImage"];
    [pageControl setValue:[UIImage imageNamed:@"line-click"] forKeyPath:@"_currentPageImage"];
    [self.view addSubview:pageControl];
    self.pageControl=pageControl;
}

/**
 *  初始化最后一个imageView
 *
 *  @param imageView 最后一个imageView
 */
- (void)setupLastImageView:(UIImageView *)imageView
{
    // 开启交互
    imageView.userInteractionEnabled=YES;
    
    // 立即开始
    UIButton *startBtn=[[UIButton alloc] init];
//    [startBtn setBackgroundImage:[UIImage imageNamed:@"start-nor"] forState:UIControlStateNormal];
//    [startBtn setBackgroundImage:[UIImage imageNamed:@"start-press"] forState:UIControlStateHighlighted];
//    startBtn.size=startBtn.currentBackgroundImage.size;
    
    startBtn.backgroundColor = [UIColor clearColor];
    startBtn.size = CGSizeMake(94, 32);
    startBtn.layer.borderWidth = 0.5;
    startBtn.layer.borderColor = Color_FFFFFF.CGColor;
    startBtn.alpha = 0.8;
    [startBtn setTitle:@"立马启动" forState:UIControlStateNormal];
    startBtn.titleLabel.textColor = Color_FFFFFF;
    startBtn.titleLabel.font = Font_28;
    startBtn.titleLabel.alpha = 0.9;
    
    startBtn.centerX=imageView.width*0.5;
    startBtn.centerY=imageView.height*0.76;
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
}

/**
 *  开始海购仓
 */
- (void)startClick
{
    // 切换到TabBarController
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window saveCurrentVersion];
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    app.tabBar = [[BSTabBarController alloc] init];
    window.rootViewController = app.tabBar;
    
}

#pragma ScrollView 代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获取页码
    CGFloat doublePage=scrollView.contentOffset.x/scrollView.width;
    NSUInteger intPage=(NSUInteger)(doublePage+0.5);
    
    // 设置页码
    self.pageControl.currentPage=intPage;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
