//
//  ICSettingCell.m
//  iCar4ios
//
//  Created by apple开发 on 16/6/1.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICSettingCell.h"
#import "ICMineSettingitem.h"
#import "ICArrowSettingItem.h"
#import "ICSwtichSettingItem.h"

@interface ICSettingCell ()

@property (nonatomic, strong) UIImageView *arrowView;

@property (nonatomic, strong) UISwitch *switchView;

@end

@implementation ICSettingCell

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        
    }
    return _arrowView;
}

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    
    ICSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[ICSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    return cell;
}

- (void)setItem:(ICMineSettingitem *)item
{
    _item = item;
    
    // 设置控件上的内容
    [self setUpData];
    
    // 设置辅助视图
    [self setUpAccessoryView];
    
    
    
}

- (void)setUpData
{
    self.textLabel.text = _item.title;
    self.detailTextLabel.text = _item.subTitle;
    self.imageView.image = [UIImage imageNamed:_item.imageName];
}

- (void)setUpAccessoryView
{
    if ([_item isKindOfClass:[ICArrowSettingItem class]]) {
        // 箭头
        self.accessoryView = self.arrowView;
        
    }else if ([_item isKindOfClass:[ICSwtichSettingItem class]]){
        // 开关
        self.accessoryView = self.switchView;
        [self.switchView addTarget:self action:@selector(switchToucth:) forControlEvents:UIControlEventTouchUpInside];
        
    }else{
        
        // 还原
        self.accessoryView = nil;
    }
}

- (void)switchToucth:(UISwitch *)sender{

    if ([self.delegate respondsToSelector:@selector(settingCellSwitchDidClick:)]) {
        [self.delegate settingCellSwitchDidClick:sender];
    }

}

@end
