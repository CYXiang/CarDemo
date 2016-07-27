//
//  ICUserInfoViewController.m
//  iCar4ios
//
//  Created by apple开发 on 16/6/3.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICUserInfoViewController.h"
#import "BSBindViewController.h"//修改密码
#import "ICEditNickNameViewController.h"//修改昵称

#import "BSLoginRequest.h"//请求

@interface ICUserInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;/**<列表*/
    NSArray *imageArr;/**< 图片数组*/
}

@end

@implementation ICUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人信息";
    imageArr = @[@"info_people",@"info_phone",@"info_password"];
    
    UITableView *contentView = [[UITableView alloc]initWithFrame:CGRectMake(0, 65, self.view.width, (42+10)*3) style:UITableViewStyleGrouped];
    contentView.backgroundColor = Color_F8F8F8;
    self.automaticallyAdjustsScrollViewInsets = NO;
    contentView.separatorColor = Color_EEEEEE;
    contentView.dataSource = self;
    contentView.delegate = self;
    _tableView = contentView;
    [self.view addSubview:contentView];
    
    //注册按钮
    UIButton *logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    logoutBtn.layer.cornerRadius = 2;
    logoutBtn.backgroundColor = Color_FF7623;
    logoutBtn.titleLabel.font = Font_28;
    [logoutBtn setTitleColor:Color_FFFFFF forState:UIControlStateNormal];
    [logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [logoutBtn addTarget:self action:@selector(logoutButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutBtn];
    [logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView.mas_bottom).offset(36);
        make.left.equalTo(self.view).offset(padding_24);
        make.right.equalTo(self.view).offset(-padding_24);
        make.height.equalTo(logoutBtn.mas_width).multipliedBy(0.12);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 9;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    switch (indexPath.section) {
        case 0:
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.imageView.image = [UIImage imageNamed:imageArr[indexPath.section]];
            cell.textLabel.text = [BSUserInfo shareUserInstance].nickname;
            
            UILabel *promptLable = [[UILabel alloc] init];
            promptLable.text = @"修改昵称";
            promptLable.font = Font_26;
            promptLable.textColor = Color_999999;
            [cell.contentView addSubview:promptLable];
            [promptLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(cell.contentView.mas_centerY);
                make.right.equalTo(cell.contentView.mas_right).offset(-padding_24);
            }];
        }
            break;
        case 1:
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.imageView.image = [UIImage imageNamed:imageArr[indexPath.section]];
            cell.textLabel.text = [BSUserInfo shareUserInstance].mobile;
        }
            break;
        case 2:
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.imageView.image = [UIImage imageNamed:imageArr[indexPath.section]];
            cell.textLabel.text = @"修改登录密码";
        }
            break;
            
        default:
            break;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            ICEditNickNameViewController * nick = [[ICEditNickNameViewController alloc] init];
            nick.title = @"昵称";
            nick.editResult = ^(BOOL isSuccess) {
                [_tableView reloadData];
                if (self.editResult) {
                    self.editResult(YES);
                }
            };
            [self.navigationController pushViewController:nick animated:YES];
        }
            break;
        case 2:
        {
            BSBindViewController * bind = [[BSBindViewController alloc] init];
            bind.title = @"修改原始密码";
            bind.optionType = BSSetUpOptionTypeEdit;
            [self.navigationController pushViewController:bind animated:YES];
        }
            break;
            
        default:
            break;
    }
}


#pragma mark --退出登录
- (void)logoutButtonClick:(UIButton*)sender {
    
    WeakSelf(self)
    NSDictionary *parameter = [NSDictionary dictionary];
    [BSLoginRequest logoutRequestWithParameter:parameter success:^(id result) {
        
        //登录成功之后，清除之前的用户单例
        [[BSUserInfo shareUserInstance] logoutBlock:^(BOOL resultRet) {
            
        }];
        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        
    } warn:^(NSString *warnMsg) {
        
        DR_NSLog(@"\n------------------warnMsg-----------------\n%@\n\n",warnMsg);
        [MBProgressHUD showText:warnMsg];
    } failure:^(NSError *error) {
        
    }];
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
