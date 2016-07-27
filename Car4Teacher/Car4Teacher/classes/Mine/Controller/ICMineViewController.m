//
//  ICMineViewController.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/23.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICMineViewController.h"
#import "ICMineGroupitem.h"
#import "ICMineSettingitem.h"
#import "ICMineHeaderView.h"
#import "ICAddCarTableViewController.h"
#import "ICSettingViewController.h"
#import "ICMyCarViewController.h"
#import "ICFeedbackViewController.h"
#import "BSLoginViewController.h"
#import "ICUserInfoViewController.h"

@interface ICMineViewController ()<UITableViewDataSource, UITableViewDelegate, ICMineHeaderViewDelegate>

@property (nonatomic, weak) UITableView *contentView; /**< 内容视图 */
@property (strong, nonatomic) NSMutableArray * groups;/**< 组数组 描述TableView有多少组 */
@property (nonatomic, weak) ICMineHeaderView *mineHeader; /**< <#注释#> */

@end

@implementation ICMineViewController

#pragma mark - 全局常量


#pragma mark - lazy

- (NSMutableArray *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}


#pragma mark - Lief Cycle


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpContentview];
    
    // 编辑成功后，弹出登录界面
    [NSNoti_defaul addObserver:self selector:@selector(editToLogin) name:@"editToLogin" object:nil];
    
}
- (void)dealloc {
    [NSNoti_defaul removeObserver:self];
}
#pragma mark --编辑成功后，弹出登录界面
- (void)editToLogin {
    BSLoginViewController * login = [[BSLoginViewController alloc] init];
    login.title = @"登录";
    login.login = ^(BOOL isSuccess){
        
        DR_NSLog(@"登录成功");
        
        NSString *name = @"";
        if ([BSUserInfo shareUserInstance].nickname) {
            name = [BSUserInfo shareUserInstance].nickname;
        }else{
            name = [BSUserInfo shareUserInstance].mobile;
        }
        
        self.mineHeader.loginBtn.hidden = YES;
        [self.mineHeader.nameBtn setTitle:name forState:UIControlStateNormal];
        
    };
    BSNavigationController * nav = [[BSNavigationController alloc] initWithRootViewController:login];
    [self  presentViewController:nav animated:YES completion:^{
        
    }];
}

- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;

}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

    if ([BSUserInfo shareUserInstance].isLogin) {
        NSString *name = @"";
        if ([BSUserInfo shareUserInstance].nickname) {
            name = [BSUserInfo shareUserInstance].nickname;
        }else{
            name = [BSUserInfo shareUserInstance].mobile;
        }
        self.mineHeader.nameBtn.hidden = NO;
        self.mineHeader.loginBtn.hidden = YES;
        [self.mineHeader.nameBtn setTitle:name forState:UIControlStateNormal];
    }else{
    
        self.mineHeader.loginBtn.hidden = NO;
        self.mineHeader.nameBtn.hidden = YES;
    
    }

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  状态栏设置
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Creat UI
- (void)setUpContentview {
    
    UITableView *contentView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height + 20) style:UITableViewStyleGrouped];
    contentView.backgroundColor = Color_F8F8F8;
    self.automaticallyAdjustsScrollViewInsets = NO;
    contentView.separatorColor = Color_EEEEEE;
    contentView.dataSource = self;
    contentView.delegate = self;
    self.contentView = contentView;
    [self.view addSubview:contentView];
    
    ICMineHeaderView *mineHeader = [[[NSBundle mainBundle]loadNibNamed:@"ICMineHeaderView" owner:nil options:nil]lastObject];
    self.mineHeader = mineHeader;
    mineHeader.delegate = self;
    contentView.tableHeaderView = mineHeader;
    
    if ([BSUserInfo shareUserInstance].isLogin) {
        self.mineHeader.loginBtn.hidden = YES;
        [self.mineHeader.nameBtn setTitle:[BSUserInfo shareUserInstance].nickname forState:UIControlStateNormal];
    }
    
    [self setGroup1];
    [self setGroup2];

}

- (void)setGroup1{
    
    ICMineGroupitem *group = [[ICMineGroupitem alloc]init];
    ICMineSettingitem *item = [ICMineSettingitem itemWithtitle:@"我的车辆" imageName:@"mine_mycar"];
    item.itemOpertion = ^{
        if ([BSUserInfo shareUserInstance].isLogin) {
            [self.navigationController pushViewController:[[ICMyCarViewController alloc]init] animated:YES];
        }else{
            BSLoginViewController * login = [[BSLoginViewController alloc] init];
            BSNavigationController * nav = [[BSNavigationController alloc] initWithRootViewController:login];
            [self  presentViewController:nav animated:YES completion:^{
                
            }];
        }
    };
    group.items = @[item];
    [self.groups addObject:group];
    
}

- (void)setGroup2{
    
    ICMineGroupitem *group = [[ICMineGroupitem alloc]init];
    ICMineSettingitem *item = [ICMineSettingitem itemWithtitle:@"意见反馈" imageName:@"mine_myadvise"];
    item.itemOpertion = ^{
        if ([BSUserInfo shareUserInstance].isLogin) {
            [self.navigationController pushViewController:[[ICFeedbackViewController alloc]init] animated:YES];
        }else{
            BSLoginViewController * login = [[BSLoginViewController alloc] init];
            BSNavigationController * nav = [[BSNavigationController alloc] initWithRootViewController:login];
            [self  presentViewController:nav animated:YES completion:^{
                
            }];
        }

    };
    group.items = @[item];
    [self.groups addObject:group];
    
}




#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    ICMineGroupitem *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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

#pragma mark - ICMineHeaderViewDelegate
- (void)mineHeaderViewLoginBtnDidClick:(UIButton *)button{

    
    BSLoginViewController * login = [[BSLoginViewController alloc] init];
    login.title = @"登录";
    login.login = ^(BOOL isSuccess){
        
        DR_NSLog(@"登录成功");
        
        NSString *name = @"";
        if ([BSUserInfo shareUserInstance].nickname) {
            name = [BSUserInfo shareUserInstance].nickname;
        }else{
            name = [BSUserInfo shareUserInstance].mobile;
        }
        
        self.mineHeader.loginBtn.hidden = YES;
        [self.mineHeader.nameBtn setTitle:name forState:UIControlStateNormal];
        
    };
    BSNavigationController * nav = [[BSNavigationController alloc] initWithRootViewController:login];
    [self  presentViewController:nav animated:YES completion:^{
        
    }];

}

- (void)mineHeaderViewAddCarBtnDidClick:(UIButton *)button{

    ICAddCarTableViewController *addcarVC = [[ICAddCarTableViewController alloc]init];
    
    [self.navigationController pushViewController:addcarVC animated:YES];

}

- (void)mineHeaderViewSettingBtnDidClick:(UIButton *)button{

    ICSettingViewController *settingVC = [[ICSettingViewController alloc]init];
    
    [self.navigationController pushViewController:settingVC animated:YES];


}

- (void)mineHeaderViewNameBtnDidClick:(UIButton *)button{

    ICUserInfoViewController *userInfoVC = [[ICUserInfoViewController alloc]init];
    [self.navigationController pushViewController:userInfoVC animated:YES];

}



@end
