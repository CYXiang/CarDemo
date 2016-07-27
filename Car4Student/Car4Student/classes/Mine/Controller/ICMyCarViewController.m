//
//  ICMyCarViewController.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/24.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICMyCarViewController.h"
#import "ICAddCarTableViewController.h"
#import "QLTableViewRowAction.h"
#import "ICMyCarTableViewCell.h"
#import "ICInformationViewController.h"
#import <SVProgressHUD.h>
#import "ICMineRequest.h"
#import "ICUserCarInformationModel.h"
#import "ICEditCarViewController.h"


@interface ICMyCarViewController ()<ICMyCarTableViewCellDelegate>

@property (nonatomic, strong) NSMutableArray *objArr;


@end

static NSString * const ICMyCarCellID = @"myCarCell";


@implementation ICMyCarViewController

- (NSMutableArray *)objArr
{
    if (!_objArr) {
        _objArr = [[NSMutableArray alloc]init];
    }
    return _objArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationItem];
    [self setUpContentView];
}

- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Creat UI
- (void)setUpNavigationItem {
    
    self.title = @"我的车辆";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIBarButtonItem *addBarButton = [UIBarButtonItem itemWithTitle:@"添加车辆" Target:self action:@selector(addButtonDown:)];
    
    [self.navigationItem setRightBarButtonItem:addBarButton];
}

- (void)setUpContentView {
    
    self.tableView.backgroundColor = Color_F8F8F8;
    self.tableView.rowHeight = 110;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ICMyCarTableViewCell class]) bundle:nil] forCellReuseIdentifier:ICMyCarCellID];

    self.tableView.mj_header = [ICRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];


}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objArr.count;
}

//注意cell必须继承QLTableViewCell，我在 storyboard 里设置的！！！
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ICMyCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ICMyCarCellID forIndexPath:indexPath];
    cell.editBtn.tag = indexPath.row;
    cell.delegate = self;
    cell.UserCarInformation = (ICUserCarInformationModel *)self.objArr[indexPath.row];
    //    NSDate *date = self.objects[indexPath.row];
    //    cell.textLabel.text = [date description];
    return cell;
}



#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICInformationViewController *inforVC = [[ICInformationViewController alloc]init];

    ICUserCarInformationModel *user = (ICUserCarInformationModel *)self.objArr[indexPath.row];
    inforVC.hphm = user.car_plate;
    inforVC.engineno = user.car_engine;
    inforVC.classno = user.car_class;
    inforVC.city = user.city_name;
    
    [self.navigationController pushViewController:inforVC animated:YES];

}

//删除，插入，侧滑都会调用此方法；iOS8侧滑除外！多选不会触发这个方法！
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //nothing,just show delete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *actions = [self tableView:tableView editActionsForRowAtIndexPath:indexPath];
    NSArray *titles  = [actions valueForKeyPath:@"title"];
    return [titles componentsJoinedByString:@"拼接"];
}

// 兼容 iOS8 和 之前版本
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QLTableViewRowAction *action = [QLTableViewRowAction rowActionWithStyle:QLTableViewRowActionStyleDefault title:@"删除" handler:^(QLTableViewRowAction *action, NSIndexPath *indexPath) {
        DR_NSLog(@"%@",action.title);
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        ICUserCarInformationModel *user = (ICUserCarInformationModel *)self.objArr[indexPath.row];

        params[@"car_id"] = user.car_id;
        
        [ICMineRequest removeCarInformationWithParamter:params success:^(NSMutableArray *resultArray) {
            
            NSObject *obj = [self.objArr objectAtIndex:indexPath.row];
            [self.objArr removeObject:obj];
            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
            [tableView endUpdates];
            
        } warn:^(NSString *warnMsg) {
            [SVProgressHUD showErrorWithStatus:warnMsg];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        } failure:^(NSError *error) {
            
        }];
    }];
    
    action.backgroundColor = Color_FF7623;
    
    return @[action];
}

#pragma mark - ICMyCarTableViewCellDelegate
- (void)myCarTableViewcellEditBtnDidClick:(UIButton *)button {

//    [SVProgressHUD showWithStatus:@"正在加载车辆信息.."];

    ICEditCarViewController *addcarVC = [[ICEditCarViewController alloc]init];
    ICUserCarInformationModel *user = (ICUserCarInformationModel *)self.objArr[button.tag];
    addcarVC.car_id = user.car_id;
    addcarVC.carInfoModel = user;
    
    [self.navigationController pushViewController:addcarVC animated:YES];

//    addcarVC.carInfoModel = self.objArr[button.tag];
    
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"car_id"] = @"1";
//    params[@"car_plate"] = @"粤A12345";
//    params[@"car_class"] = @"123456";
//    params[@"car_engine"] = @"123456";
//    
//    [ICMineRequest getCarInformationWithParamter:params success:^(NSMutableArray *resultArray) {
//        
//        
//        
//        [self.navigationController pushViewController:addcarVC animated:YES];
//        
//        [SVProgressHUD dismiss];
//    } warn:^(NSString *warnMsg) {
//        [SVProgressHUD dismiss];
//
//    } failure:^(NSError *error) {
//        [SVProgressHUD dismiss];
//
//    }];
    
    
    
    
    
}


#pragma mark - Action

- (void) addButtonDown:(UIBarButtonItem *)sender
{
    ICAddCarTableViewController *addcarVC = [[ICAddCarTableViewController alloc]init];
    
    
    
    [self.navigationController pushViewController:addcarVC animated:YES];
    
}


#pragma mark - Refreshing

- (void)headerRefresh{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"page"] = @"1";
    params[@"limit"] = @"10";
    
    [ICMineRequest getCarListInformationWithParamter:params success:^(NSMutableArray *resultArray) {
        if (resultArray) {
            [self.objArr removeAllObjects];

            [self.objArr addObjectsFromArray:resultArray];
            
            [self.tableView reloadData];
        }
        
        [self.tableView.mj_header endRefreshing];

    } warn:^(NSString *warnMsg) {
        [SVProgressHUD showInfoWithStatus:warnMsg];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });

        [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
    
}
@end
