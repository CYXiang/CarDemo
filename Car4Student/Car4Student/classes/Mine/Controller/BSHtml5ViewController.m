//
//  BSHtml5ViewController.m
//  BiShe
//
//  Created by fanny on 15/12/14.
//
//

#import "BSHtml5ViewController.h"

@interface BSHtml5ViewController ()<UIWebViewDelegate>
@property(nonatomic, strong)UIWebView *webView;
@end

@implementation BSHtml5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.title = self.title;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = Color_0F68C3;
    
    NSRange range = [self.urlString rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        self.urlString = [NSString stringWithFormat:@"%@?source=ios",self.urlString];
    } else {
        self.urlString = [NSString stringWithFormat:@"%@&source=ios",self.urlString];
    }
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, Visual_Y, Visual_Width, Visual_Height)];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
//    [self.webView loadHTMLString:_urlString baseURL:[NSURL URLWithString:_urlString]];
    [self.view addSubview:self.webView];
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
//    [MBProgressHUD showMessage:@""];
    //状态栏菊花
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //状态栏菊花
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    [MBProgressHUD hideHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    //状态栏菊花
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    [MBProgressHUD hideHUD];
    
//    [[[UIAlertView alloc] initWithTitle:@"" message:@"加载失败，请稍后再试" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil] show];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    DR_NSLog(@"\n------------------截获链接-----------------\n%@\n\n",request.URL);
    
//    // 商品详情
//    if ([request.URL.absoluteString hasSuffix:@"openDetails"]) {
//        
//        NSString *shopId = [[request.URL.absoluteString componentsSeparatedByString:@"="] lastObject];
//        shopId = [[shopId componentsSeparatedByString:@"#"] firstObject];
//    
//        BSProductDetailViewController *productDetailVC = [[BSProductDetailViewController alloc]init];
//        productDetailVC.goodsId = shopId;
//        [self.navigationController pushViewController:productDetailVC animated:YES];
//       
//        return NO;
//    }
//    // 代金券
//    else if ([request.URL.absoluteString hasSuffix:@"openMyCoupon"]){
//        
//        if ([BSUserInfo shareUserInstance].isLogin) {
//            BSCounponListViewController * couponViewController = [[BSCounponListViewController alloc] init];
//            couponViewController.title = @"我的代金券";
//            [self.navigationController pushViewController:couponViewController animated:YES];
//        }
//        else {
//            //如果没有登录，则跳转到登录界面
//            BSLoginViewController * login = [[BSLoginViewController alloc] init];
//            login.title = @"登录";
//            login.login = ^(BOOL isSuccess){
//            };
//            BSNavigationController * nav = [[BSNavigationController alloc] initWithRootViewController:login];
//            [self  presentViewController:nav animated:YES completion:^{
//                
//            }];
//        }
//        
//        return NO;
//    }
//    // 返回主页
//    else if ([request.URL.absoluteString hasSuffix:@"openGoHome"]) {
//        [self.tabBarController setSelectedViewController:[self.tabBarController.childViewControllers objectAtIndex:0]];
//        [self.navigationController popToRootViewControllerAnimated:YES];
//    }
//    // 查看更多（品牌列表）
//    else if ([request.URL.absoluteString hasSuffix:@"openLookMore"]) {
//        NSString *shopId = [[request.URL.absoluteString componentsSeparatedByString:@"="] lastObject];
//        shopId = [[shopId componentsSeparatedByString:@"#"] firstObject];
//        
//        BSProductListViewController * product = [[BSProductListViewController alloc] init];
//        product.title = @"品牌产品列表";
//        product.productListType = BSProductListTypeBrand;
//        product.typeId = shopId;
//        [self.navigationController pushViewController:product animated:YES];
//    }
//    
    return YES;
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
