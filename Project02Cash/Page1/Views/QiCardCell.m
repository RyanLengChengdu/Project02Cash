//
//  QiCardCell.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/29.
//

#import "QiCardCell.h"
#import "Masonry.h"
@interface QiCardCell ()
@property(nonatomic,strong)UILabel *BeijingLabel;
@property(nonatomic,strong)UILabel *RenewLabel;
@property(nonatomic,strong)UILabel *leftLabel;
@property(nonatomic,strong)UILabel *centerViewLabel;
@property(nonatomic,strong)UILabel *rightLabel;

@end

@implementation QiCardCell

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (void)layoutSubviews {
    [self.contentView addSubview:({
        _BeijingLabel = [[UILabel alloc]init];
        _BeijingLabel.attributedText = [
            [NSMutableAttributedString alloc] initWithString:@"北京时间"
            attributes: @{
              NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 20],
              NSForegroundColorAttributeName: [UIColor colorWithRed:35/255.0 green:35/255.0 blue:35/255.0 alpha:1.00]
          }];
        _BeijingLabel;
    })];
    [_BeijingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.mas_top).with.offset(20);
    }];
    
    [self.contentView addSubview:({
        _RenewLabel = [[UILabel alloc]init];
        _RenewLabel.text = @"数据更新时间为10s/次";
        _RenewLabel.font = [UIFont fontWithName:@"PingFang SC" size: 12];
        _RenewLabel.textColor = [UIColor colorWithRed:222/255.0 green:94/255.0 blue:97/255.0 alpha:1.00];
        _RenewLabel;
    })];
    [_RenewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(_BeijingLabel.mas_bottom).with.offset(5);
    }];
    
    [self.contentView addSubview:({
        _centerViewLabel = [[UILabel alloc]init];
        _centerViewLabel.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.00];
        
        _centerViewLabel.text = @"-";
        _centerViewLabel.textColor = [UIColor blackColor];
        _centerViewLabel.textAlignment = NSTextAlignmentCenter;
        _centerViewLabel;
    })];
    [_centerViewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-15);
        make.width.equalTo(_centerViewLabel.mas_height);
    }];
    
    [self.contentView addSubview:({
        _leftLabel = [[UILabel alloc]init];
        _leftLabel.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.00];
        NSDate *currentDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy年MM月dd日 "];
        //NSDate转NSString
        NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
        _leftLabel.text = currentDateString;
        _leftLabel.textColor = [UIColor blackColor];
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        _leftLabel;
    })];
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.offset(-15);
        make.right.equalTo(_centerViewLabel.mas_left).with.offset(-5);
        
    }];
    
    [self.contentView addSubview:({
        _rightLabel = [[UILabel alloc]init];
        _rightLabel.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.00];
        
        //
        NSDate *currentDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH时mm分ss秒 "];
        //NSDate转NSString
        NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
        self.rightLabel.text = currentDateString;
        _rightLabel.textColor = [UIColor blackColor];
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        _rightLabel;
    })];
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.offset(-15);
        make.left.equalTo(_centerViewLabel.mas_right).with.offset(5);
    }];
}
- (void)setCellData {
    
}
@end
