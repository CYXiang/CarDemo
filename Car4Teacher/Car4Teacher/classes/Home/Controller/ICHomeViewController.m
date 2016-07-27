//
//  ICHomeViewController.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/23.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICHomeViewController.h"
#import "ICHomeHeaderView.h"
#import "SDCycleScrollView.h"
#import "GYZChooseCityController.h"
#import "ICAddCarTableViewController.h"
#import "ICMyCarViewController.h"
#import "BSLoginViewController.h"

#import "ICTextViewController.h"


@interface ICHomeViewController () <UITableViewDataSource, UITableViewDelegate, ICHomeHeaderViewDelegate, SDCycleScrollViewDelegate, GYZChooseCityDelegate>


@property (nonatomic, weak) UITableView *contentView; /**< 内容视图 */
@property (nonatomic, weak) ICHomeHeaderView *homeHeader; /**< 头部视图 */
@property (nonatomic, weak) UIBarButtonItem *leftButton; /**< <#注释#> */

@end

@implementation ICHomeViewController

#pragma mark - 全局常量

static NSString * const ICCellID = @"cell";
static NSString * cityTitle = @"选择城市";


#pragma mark - Lief Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpNavigationItem];
    
    [self setUpContentview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Creat UI
- (void)setUpNavigationItem {
    
    self.navigationItem.title = @"名创车宝";
    
    UIBarButtonItem *leftButton = [UIBarButtonItem itemWithTitle:cityTitle Target:self action:@selector(leftBarButtonClick) image:@"home_dropdown" highImage:@"home_dropdown"];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIBarButtonItem *addBarButton = [UIBarButtonItem itemWithTitle:@"我的车辆" Target:self action:@selector(myCarButtonDown)];
    
    [self.navigationItem setRightBarButtonItem:addBarButton];
    
}

- (void)setUpContentview {
    
    UITableView *contentView = [[UITableView alloc]initWithFrame:self.view.bounds];
    contentView.backgroundColor = Color_F8F8F8;
    contentView.separatorStyle = UITableViewCellSelectionStyleNone;
    contentView.dataSource = self;
    contentView.delegate = self;
    self.contentView = contentView;
    [self.view addSubview:contentView];
    
    ICHomeHeaderView *homeHeader = [[[NSBundle mainBundle]loadNibNamed:@"ICHomeHeaderView" owner:nil options:nil]lastObject];
    homeHeader.delegate = self;
    NSArray *imagesURLStrings = @[
                                  @"http://s1.chebao.bishe.com/static/images/banner.jpg",
                                  @"http://s1.chebao.bishe.com/static/images/banner.jpg"
                                  ];

    homeHeader.bannerView.imageURLStringsGroup = imagesURLStrings;
    homeHeader.bannerView.delegate = self;
    homeHeader.bannerView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    
    
    self.homeHeader = homeHeader;
    
    contentView.tableHeaderView = self.homeHeader;
    
    //刷新控件
    contentView.mj_header = [ICRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: ICCellID];
    
    
    return cell;
    
}

#pragma mark - ICHomeHeaderViewDelegate
- (void)homeHeaderViewStartqureyDidClick:(UIButton *)button{
    
//    ICAddCarTableViewController *addcarVC = [[ICAddCarTableViewController alloc]init];
    
    ICTextViewController  *addcarVC = [[ICTextViewController alloc]init];

    
    [self.navigationController pushViewController:addcarVC animated:YES];
    
}


#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}

#pragma mark - GYZCityPickerDelegate
- (void) cityPickerController:(GYZChooseCityController *)chooseCityController didSelectCity:(GYZCity *)city
{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:city.shortName Target:self action:@selector(leftBarButtonClick) image:@"home_dropdown" highImage:@"home_dropdown"];

    [chooseCityController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void) cityPickerControllerDidCancel:(GYZChooseCityController *)chooseCityController
{
    [chooseCityController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - Private Method

- (void)leftBarButtonClick{

    GYZChooseCityController *cityPickerVC = [[GYZChooseCityController alloc] init];
    [cityPickerVC setDelegate:self];
    //    cityPickerVC.locationCityID = @"1400010000";
    //    cityPickerVC.commonCitys = [[NSMutableArray alloc] initWithArray: @[@"1400010000", @"100010000"]];        // 最近访问城市，如果不设置，将自动管理
    cityPickerVC.hotCitys = @[@"100010000", @"200010000", @"300210000", @"600010000", @"300110000"];
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cityPickerVC] animated:YES completion:^{
        
    }];
}

- (void)myCarButtonDown{

    if ([BSUserInfo shareUserInstance].isLogin) {

        [self.navigationController pushViewController:[[ICMyCarViewController alloc]init] animated:YES];
    }else{
        BSLoginViewController * login = [[BSLoginViewController alloc] init];
    
        BSNavigationController * nav = [[BSNavigationController alloc] initWithRootViewController:login];
        [self  presentViewController:nav animated:YES completion:^{
        
        }];
    }
}

#pragma mark - Refreshing

- (void)headerRefresh{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.contentView.mj_header endRefreshing];
    });

}

@end
