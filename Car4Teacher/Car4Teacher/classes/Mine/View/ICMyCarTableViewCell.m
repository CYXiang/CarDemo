//
//  ICMyCarTableViewCell.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/26.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICMyCarTableViewCell.h"
#import "ICUserCarInformationModel.h"

@interface ICMyCarTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *carPlateLab;
@property (weak, nonatomic) IBOutlet UILabel *carClassLab;
@property (weak, nonatomic) IBOutlet UILabel *carEngineLab;

@end

@implementation ICMyCarTableViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setUserCarInformation:(ICUserCarInformationModel *)UserCarInformation {

    _UserCarInformation = UserCarInformation;
    
    self.carPlateLab.text = UserCarInformation.car_plate;
    
    self.carClassLab.text = UserCarInformation.car_class;
    
    self.carEngineLab.text = UserCarInformation.car_engine;

}


/**
 *  编辑按钮点击事件
 */
- (IBAction)editBtnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(myCarTableViewcellEditBtnDidClick:)]) {
        [self.delegate myCarTableViewcellEditBtnDidClick:self.editBtn];
    }
    
}

@end
