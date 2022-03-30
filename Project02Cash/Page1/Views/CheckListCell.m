//
//  CheckListCell.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/30.
//

#import "CheckListCell.h"
#import "CashItem.h"
#import "Masonry.h"
@interface CheckListCell ()
@property(nonatomic,strong)UIView *outsideView;
@property(nonatomic,strong,readwrite)UIImageView *cashImageView;
@property(nonatomic,strong)UILabel *name_Label;
//无
@property(nonatomic,strong)UILabel *shortName_Label;
@property(nonatomic,strong)UILabel *bankConversionPri_Label;
@property(nonatomic,strong)UILabel *fBuyPri_Label;
@property(nonatomic,strong)UILabel *mBuyPri_Label;
@property(nonatomic,strong)UILabel *fSellPri_Label;
@property(nonatomic,strong)UILabel *mSellPri_Label;
@property(nonatomic,strong)UILabel *date_Label;
@property(nonatomic,strong)UILabel *time_Label;
@end

@implementation CheckListCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

-(void)layoutSubviews{
    //外框
    [self.contentView addSubview:({
        _outsideView = [[UIView alloc]init];
        _outsideView.layer.cornerRadius = 8.33;
        _outsideView.backgroundColor = [UIColor blackColor];
        _outsideView;
    })];
    [_outsideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.left.equalTo(self.mas_left).with.offset(10.33);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom).with.offset(-13.33);
    }];
    //左上图片
    [_outsideView addSubview:({
        _cashImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner-sdfkawjketjaw-img"]];
        _cashImageView;
    })];
    [_cashImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_outsideView.mas_left).with.offset(6.67);
        make.top.equalTo(_outsideView.mas_top).with.offset(18.33);
        make.width.equalTo(_outsideView.mas_width).multipliedBy(120.0/354);
        make.height.equalTo(_outsideView.mas_height).multipliedBy(72.0/222);
    }];
    //右1
    [_outsideView addSubview:({
        _name_Label = [[UILabel alloc]init];
        _name_Label.text = @"货币名称：人民币";
        _name_Label.textColor = [UIColor whiteColor];
        _name_Label;
    })];
    [_name_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_outsideView.mas_right).multipliedBy(0.5);
        make.top.equalTo(_outsideView.mas_top).with.offset(18.67);
        make.width.equalTo(_outsideView.mas_width).multipliedBy(0.5);
        make.height.equalTo(_outsideView.mas_height).multipliedBy(15.3/222);
    }];
    //右2
    [_outsideView addSubview:({
        _shortName_Label = [[UILabel alloc]init];
        _shortName_Label.text = @"货币简称：CNY";
        _shortName_Label.textColor = [UIColor whiteColor];
        _shortName_Label;
    })];
    [_shortName_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_outsideView.mas_right).multipliedBy(0.5);
        make.top.equalTo(_name_Label.mas_bottom).with.offset(13);
        make.width.equalTo(_outsideView.mas_width).multipliedBy(0.5);
        make.height.equalTo(_outsideView.mas_height).multipliedBy(15.3/222);
    }];
    //右3
    [_outsideView addSubview:({
        _bankConversionPri_Label = [[UILabel alloc]init];
        _bankConversionPri_Label.text = @"中行折算价：100";
        _bankConversionPri_Label.textColor = [UIColor whiteColor];
        _bankConversionPri_Label;
    })];
    [_bankConversionPri_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_outsideView.mas_right).multipliedBy(0.5);
        make.top.equalTo(_shortName_Label.mas_bottom).with.offset(13);
        make.width.equalTo(_outsideView.mas_width).multipliedBy(0.5);
        make.height.equalTo(_outsideView.mas_height).multipliedBy(15.3/222);
    }];
    //左下1
    [_outsideView addSubview:({
        _fBuyPri_Label = [[UILabel alloc]init];
        _fBuyPri_Label.text = @"现汇买入价： 100";
        _fBuyPri_Label.textColor = [UIColor redColor];
        _fBuyPri_Label;
    })];
    [_fBuyPri_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_outsideView.mas_bottom).multipliedBy(0.5);
        make.left.equalTo(_cashImageView.mas_left).with.offset(0);
        make.width.equalTo(_outsideView.mas_width).multipliedBy(0.5);
        make.height.equalTo(_outsideView.mas_height).multipliedBy(15.3/222);
    }];
    //右下1
    [_outsideView addSubview:({
        _mBuyPri_Label = [[UILabel alloc]init];
        _mBuyPri_Label.text = @"现钞买入价： 100";
        _mBuyPri_Label.textColor = [UIColor redColor];
        _mBuyPri_Label;
    })];
    [_mBuyPri_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fBuyPri_Label.mas_top).with.offset(0);
        make.left.equalTo(_name_Label.mas_left).with.offset(0);
        make.width.equalTo(_outsideView.mas_width).multipliedBy(0.5);
        make.height.equalTo(_outsideView.mas_height).multipliedBy(15.3/222);
    }];
    //左下2
    [_outsideView addSubview:({
        _fSellPri_Label = [[UILabel alloc]init];
        _fSellPri_Label.text = @"现汇卖出价： 100";
        _fSellPri_Label.textColor = [UIColor greenColor];
        _fSellPri_Label;
    })];
    [_fSellPri_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fBuyPri_Label.mas_bottom).with.offset(20.67);
        make.left.equalTo(_cashImageView.mas_left).with.offset(0);
        make.width.equalTo(_outsideView.mas_width).multipliedBy(0.5);
        make.height.equalTo(_outsideView.mas_height).multipliedBy(15.3/222);
    }];
    //右下2
    [_outsideView addSubview:({
        _mSellPri_Label = [[UILabel alloc]init];
        _mSellPri_Label.text = @"现钞卖出价： 100";
        _mSellPri_Label.textColor = [UIColor greenColor];
        _mSellPri_Label;
    })];
    [_mSellPri_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fSellPri_Label.mas_top).with.offset(0);
        make.left.equalTo(_name_Label.mas_left).with.offset(0);
        make.width.equalTo(_outsideView.mas_width).multipliedBy(0.5);
        make.height.equalTo(_outsideView.mas_height).multipliedBy(15.3/222);
    }];
    
    //左下3
    [_outsideView addSubview:({
        _date_Label = [[UILabel alloc]init];
        _date_Label.text = @"发布日期：2022-01-01";
        _date_Label.textColor = [UIColor orangeColor];
        _date_Label;
    })];
    [_date_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fSellPri_Label.mas_bottom).with.offset(20.67);
        make.left.equalTo(_cashImageView.mas_left).with.offset(0);
        make.width.equalTo(_outsideView.mas_width).multipliedBy(0.5);
        make.height.equalTo(_outsideView.mas_height).multipliedBy(15.3/222);
    }];
    //右下3
    [_outsideView addSubview:({
        _time_Label = [[UILabel alloc]init];
        _time_Label.text = @"发布时间：00:00:00";
        _time_Label.textColor = [UIColor orangeColor];
        _time_Label;
    })];
    [_time_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_date_Label.mas_top).with.offset(0);
        make.left.equalTo(_name_Label.mas_left).with.offset(0);
        make.width.equalTo(_outsideView.mas_width).multipliedBy(0.5);
        make.height.equalTo(_outsideView.mas_height).multipliedBy(15.3/222);
    }];
    
}

-(void)setDataWithCashItem:(CashItem *)item{
 
}




@end
