//
//  ICPushViewController.m
//  iCar4ios
//
//  Created by apple开发 on 16/6/1.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICPushViewController.h"
#import "ICMineGroupitem.h"
#import "ICMineSettingitem.h"
#import "ICSwtichSettingItem.h"
#import "ICArrowSettingItem.h"
#import "ICSettingCell.h"
#import "ICMineRequest.h"

@interface ICPushViewController ()<UITableViewDataSource, UITableViewDelegate,ICSettingCellDelegate>

@property (nonatomic, weak) UITableView *contentView; /**< 内容视图 */
@property (strong, nonatomic) NSMutableArray * groups;/**< 组数组 描述TableView有多少组 */
@property(nonatomic, strong) NSMutableArray *isOnArr;/**<<#注释#>*/


@end

@implementation ICPushViewController

- (NSMutableArray *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (NSMutableArray *)isOnArr
{
    if (!_isOnArr) {
        _isOnArr = [NSMutableArray array];
    }
    return _isOnArr;
}


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
    
    self.title = @"消息推送";
    
}

- (void)setUpContentview {
    
    self.view.backgroundColor = Color_0F68C3;
    
    UITableView *contentView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    contentView.backgroundColor = Color_F8F8F8;
    contentView.separatorColor = Color_EEEEEE;
    contentView.dataSource = self;
    contentView.delegate = self;
    self.contentView = contentView;
    [self.view addSubview:contentView];
    
    [self setGroup1];
    [self setGroup2];
    
}

- (void)setGroup1{
    
    ICMineGroupitem *group = [[ICMineGroupitem alloc]init];
    ICSwtichSettingItem *item = [ICSwtichSettingItem itemWithtitle:@"接收新消息通知" imageName:nil];

    [self.isOnArr addObject:@(item.isOn)];
    
    item.itemOpertion = ^{
    
    
    };
    
    group.items = @[item];
    [self.groups addObject:group];
    
}

- (void)setGroup2{
    
    ICMineGroupitem *group = [[ICMineGroupitem alloc]init];
    ICSwtichSettingItem *item = [ICSwtichSettingItem itemWithtitle:@"活动推送" imageName:nil];
    
    [self.isOnArr addObject:@(item.isOn)];

    ICSwtichSettingItem *item1 = [ICSwtichSettingItem itemWithtitle:@"违章推送" imageName:nil];
    [self.isOnArr addObject:@(item.isOn)];

    group.items = @[item,item1];
    [self.groups addObject:group];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    ICMineGroupitem *group = self.groups[section];
    return group.items.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    static NSString *ID = @"cell";
    ICSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell  = [[ICSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.delegate = self;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    ICMineGroupitem *group = self.groups[indexPath.section];
    ICMineSettingitem *item = group.items[indexPath.row];
    
    cell.item = item;

    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 9;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 取出哪一组
    ICMineGroupitem *group = self.groups[indexPath.section];
    
    // 取出哪一行
    ICMineSettingitem *item = group.items[indexPath.row];
    
    if (item.itemOpertion) {
        item.itemOpertion();
        
    }
}

#pragma mark - ICSettingCellDelegate

- (void)settingCellSwitchDidClick:(UISwitch *)switchbtn{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"user_id"] = @"1";
    params[@"message"] = [NSString stringWithFormat:@"%d", switchbtn.isOn];
    params[@"activity"] = self.isOnArr[1];
    params[@"violation"] = self.isOnArr[2];

    [ICMineRequest settingPushWithParamter:params success:^(NSDictionary *result) {
        if (result) {
            
        }
    } warn:^(NSString *warnMsg) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

@end
