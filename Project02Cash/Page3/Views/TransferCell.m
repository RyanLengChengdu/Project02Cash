//
//  TransferCell.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/4/1.
//

#import "TransferCell.h"
#import "Masonry.h"
@interface TransferCell ()
@property(nonatomic,strong)UILabel *label1;
@property(nonatomic,strong)UILabel *label2;
@property(nonatomic,strong)UILabel *label3;
@end

@implementation TransferCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            _label1 = [[UILabel alloc]init];
            _label1.highlightedTextColor = [UIColor redColor];
            _label1;
        })];
        [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.equalTo(self.mas_left).with.offset(10);
        }];
        [self.contentView addSubview:({
            _label2 = [[UILabel alloc]init];
            _label2.highlightedTextColor = [UIColor redColor];
            _label2;
        })];
        [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.equalTo(self.mas_right).multipliedBy(1.0/3);
        }];
        
        [self.contentView addSubview:({
            _label3 = [[UILabel alloc]init];
            _label3.highlightedTextColor = [UIColor redColor];
            _label3;
        })];
        [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.equalTo(self.mas_right).multipliedBy(2.0/3);
        }];
    }
    return self;
}

-(void)setDataWithIndex:(int)index{
    NSArray *arr = @[@[@"源货币:SEK",@"目标货币:CAD",@"目标个数：10"],
                     @[@"源货币:PHP",@"目标货币:TWD",@"目标个数：20"],
                    @[@"源货币:CAD",@"目标货币:AUO",@"目标个数：30"],
                    @[@"源货币:TWO",@"目标货币:MOP",@"目标个数：40"],
                    @[@"源货币:AUD",@"目标货币:EUR",@"目标个数：50"],
                    @[@"源货币:MOP",@"目标货币:IDR",@"目标个数：60"],
                    @[@"源货币:EUR",@"目标货币:NOK",@"目标个数：70"]];
    self.label1.text = arr[index][0];
    self.label2.text = arr[index][1];
    self.label3.text = arr[index][2];
}
@end
