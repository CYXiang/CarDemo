//
//  ICInformationTableViewCell.m
//  iCar4ios
//
//  Created by apple开发 on 16/5/25.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ICInformationTableViewCell.h"
#import "ICIllegalListModel.h"


@interface ICInformationTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *dateLab;
@property (weak, nonatomic) IBOutlet UILabel *areaLab;
@property (weak, nonatomic) IBOutlet UILabel *actLab;
@property (weak, nonatomic) IBOutlet UIButton *moneyBtn;
@property (weak, nonatomic) IBOutlet UIButton *fenBtn;


@end

@implementation ICInformationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}




- (void)setFrame:(CGRect)frame{
    
    frame.origin.y += 9;
    frame.size.height -= 9;
    [super setFrame:frame];
}

- (void)setIllegalModel:(ICIllegalListModel *)illegalModel {
    _illegalModel = illegalModel;
    
    self.dateLab.text = illegalModel.date;
    self.areaLab.text = illegalModel.area;
    self.actLab.text = illegalModel.act;
    [self.moneyBtn setTitle:[NSString stringWithFormat:@" ￥%@",illegalModel.money] forState:UIControlStateNormal];
    [self.fenBtn setTitle:[NSString stringWithFormat:@" %@",illegalModel.fen] forState:UIControlStateNormal];

}


@end
