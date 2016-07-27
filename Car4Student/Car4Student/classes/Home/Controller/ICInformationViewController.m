//
//  ICInformationViewController.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/25.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICInformationViewController.h"
#import "ICInformationTableViewCell.h"
#import "ICHomeRequest.h"
#import "ICIllegalModel.h"
#import "ICIllegalListModel.h"
#import "ICCarInfoModel.h"
#import <SVProgressHUD.h>

@interface ICInformationViewController ()

@property(nonatomic, strong) NSMutableArray *objArr;/**<<#注释#>*/


@end

static NSString * const ICInformationCellID = @"informationTag";


@implementation ICInformationViewController

- (NSMutableArray *)objArr
{
    if (!_objArr) {
        _objArr = [NSMutableArray array];
    }
    return _objArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavigationItem];
    
    [self setUpContentview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - Creat UI
- (void)setUpNavigationItem {
    
    self.navigationItem.title = @"违章信息";
    
}

- (void)setUpContentview {

    self.tableView.backgroundColor = Color_F8F8F8;
    
    self.tableView.estimatedRowHeight = 213;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ICInformationTableViewCell class]) bundle:nil] forCellReuseIdentifier:ICInformationCellID];
    
    self.tableView.mj_header = [ICRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ICInformationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ICInformationCellID];
    cell.illegalModel = self.objArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - UITableViewDelegate
//// 设置行高
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 250;
//    
//}

#pragma mark - Refreshing

- (void)headerRefresh{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"hphm"] = self.hphm;//@"粤B61P86";
    params[@"engineno"] = self.engineno;//@"333283";
    params[@"classno"] = self.classno;//@"A41961";
    params[@"city"] = self.city;//@"广州";
    
    [ICHomeRequest getIllegalInformationWithParamter:params success:^(ICIllegalModel *resultArray) {
        [self.objArr removeAllObjects];
        
        [self.objArr addObjectsFromArray:resultArray.lists];
        
        [self.tableView reloadData];
        
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
