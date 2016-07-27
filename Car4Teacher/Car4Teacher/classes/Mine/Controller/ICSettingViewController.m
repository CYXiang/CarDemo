//
//  ICSettingViewController.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/24.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICSettingViewController.h"
#import "ICMineGroupitem.h"
#import "ICMineSettingitem.h"
#import "ICPushViewController.h"
#import "ICArrowSettingItem.h"
#import "CYXClearCacheCell.h"
#import "BSHtml5ViewController.h"

#import <SVProgressHUD.h>
@interface ICSettingViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *contentView; /**< 内容视图 */
@property (strong, nonatomic) NSMutableArray * groups;/**< 组数组 描述TableView有多少组 */


@end

@implementation ICSettingViewController

#pragma mark - lazy

- (NSMutableArray *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
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
    
    self.title = @"设置";
    
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
    [self setGroup3];
    
}

- (void)setGroup1{
    
    ICMineGroupitem *group = [[ICMineGroupitem alloc]init];
    ICMineSettingitem *item = [ICMineSettingitem itemWithtitle:@"功能介绍" imageName:nil];
    item.itemOpertion = ^{
        BSHtml5ViewController *vc = [[BSHtml5ViewController alloc]init];
        vc.urlString = @"http://s1.chebao.bishe.com/msg-push-app.html";
//        vc.urlString = @"http://www.baidu.com";
        vc.title = @"功能介绍";
        [self.navigationController pushViewController:vc animated:YES];
    };
    group.items = @[item];
    [self.groups addObject:group];
    
}

- (void)setGroup2{
    
    ICMineGroupitem *group = [[ICMineGroupitem alloc]init];
    ICArrowSettingItem *item = [ICArrowSettingItem itemWithtitle:@"消息推送" imageName:nil];
    item.itemOpertion = ^{
        [self.navigationController pushViewController:[[ICPushViewController alloc]init] animated:YES];
    };
    ICMineSettingitem *item1 = [ICMineSettingitem itemWithtitle:@"检查更新" imageName:nil];
    item1.itemOpertion = ^{
        [SVProgressHUD showSuccessWithStatus:@"已经是最新版本"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    };
    ICMineSettingitem *item2 = [ICMineSettingitem itemWithtitle:@"清除缓存" imageName:nil];
    
    group.items = @[item,item1,item2];
    [self.groups addObject:group];
    
}

- (void)setGroup3{
    
    ICMineGroupitem *group = [[ICMineGroupitem alloc]init];
    ICMineSettingitem *item = [ICMineSettingitem itemWithtitle:@"名创车宝好评" imageName:nil];
    group.items = @[item];
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
    
    if ((indexPath.section == 1) && (indexPath.row == 2)) {
        static NSString *ICClearCellID = @"clearCell";
        CYXClearCacheCell *clearCell = [tableView dequeueReusableCellWithIdentifier:ICClearCellID];

        if (clearCell == nil) {
            clearCell  = [[CYXClearCacheCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ICClearCellID];
        }
        return clearCell;
    }
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    ICMineGroupitem *group = self.groups[indexPath.section];
    ICMineSettingitem *item = group.items[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:item.imageName];
    cell.textLabel.text = item.title;
    
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
    
    ICMineGroupitem *group = self.groups[indexPath.section];
    
    ICMineSettingitem *item = group.items[indexPath.row];
    
    if (item.itemOpertion) {
        item.itemOpertion();
    }
}


@end
