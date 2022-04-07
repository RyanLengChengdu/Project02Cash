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
        //[self layoutSubviews];
        [self.contentView addSubview:({
            _outsideView = [[UIView alloc]init];
            _outsideView.layer.cornerRadius = 8.33;
            
            _outsideView;
        })];
        [_outsideView mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.centerX.mas_equalTo(0);
            make.left.equalTo(self).with.offset(10.33);
            make.right.equalTo(self).with.offset(-10.33);
            make.top.equalTo(self).with.offset(0);
            //make.bottom.equalTo(self.mas_bottom).with.offset(-13.33);
            make.height.equalTo(self).multipliedBy(222.0/235);
        }];

        [_outsideView.layer addSublayer:({
            CAGradientLayer *gl = [[CAGradientLayer alloc]init];
            if(self.color2 == YES){
                gl.colors = @[
                    (__bridge id)[UIColor colorWithRed:214/255.0 green:37/255.0 blue:41/255.0 alpha:1.00].CGColor,
                    (__bridge id)[UIColor colorWithRed:117/255.0 green:51/255.0 blue:51/255.0 alpha:1.00].CGColor,
                    ];
            }else{
                gl.colors = @[
                    (__bridge id)[UIColor colorWithRed:59/255.0 green:57/255.0 blue:57/255.0 alpha:1.00].CGColor,
                    (__bridge id)[UIColor colorWithRed:117/255.0 green:51/255.0 blue:51/255.0 alpha:1.00].CGColor,
                    ];
            }
            
            //gl.locations = @[@0.0, @1.0];
            //左右渐变透明
            gl.startPoint = CGPointMake(0, 0);
            gl.endPoint = CGPointMake(1.0, 1.0);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                NSLog(@"%@", self.outsideView);
                gl.frame =self.outsideView.bounds;
                
            });
            //gl.frame = _outsideView.bounds;
            gl.cornerRadius = 8.33;
            gl;
        })];
        
        //左上图片
        [_outsideView addSubview:({
            _cashImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"vjjjhw3je-img"]];
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
            //_name_Label.text = @"货币名称：人民币";
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
            //_shortName_Label.text = @"货币简称：CNY";
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
            //_bankConversionPri_Label.text = @"中行折算价：100";
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
            //_fBuyPri_Label.text = @"现汇买入价： 100";
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
            //_mBuyPri_Label.text = @"现钞买入价： 100";
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
            //_fSellPri_Label.text = @"现汇卖出价： 100";
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
            //_mSellPri_Label.text = @"现钞卖出价： 100";
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
            //_date_Label.text = @"发布日期：2022-01-01";
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
            //_time_Label.text = @"发布时间：00:00:00";
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
    return self;
}
-(void)setDataWithCashItem:(CashItem *)item{
    NSDictionary *shortName_dic = @{@"美元":@"USD",@"欧元":@"EUR",@"港币":@"HKD",@"日元":@"JPY",@"英镑":@"GBP",@"澳大利亚元":@"AUD",@"加拿大元":@"CAD",@"泰国铢":@"THB",@"新加坡元":@"SGD",@"瑞士法郎":@"CHF",@"丹麦克朗":@"DKK",@"澳门元":@"MOP",@"林吉特":@"MYR",@"挪威克朗":@"NOK",@"新西兰元":@"NZD",@"菲律宾比索":@"PHP",@"卢布":@"SUR",@"瑞典克朗":@"SEK",@"新台币":@"TWD",@"巴西雷亚尔":@"BRL",@"韩国元":@"KRW",@"南非兰特":@"ZAR"};
    self.name_Label.text = [ NSString stringWithFormat:@"货币名称:%@",item.name];
    self.date_Label.text =[ NSString stringWithFormat:@"发布日期:%@",item.date];
    
    self.time_Label.text =[ NSString stringWithFormat:@"发布时间:%@",item.time];
    self.fBuyPri_Label.text =[ NSString stringWithFormat:@"现汇买入价:%@",item.fBuyPri];
    self.mBuyPri_Label.text = [ NSString stringWithFormat:@"现钞买入价:%@",item.mBuyPri];
    self.fSellPri_Label.text = [ NSString stringWithFormat:@"现汇卖出价:%@",item.fSellPri];
    self.mSellPri_Label.text = [ NSString stringWithFormat:@"现钞卖出价:%@",item.mSellPri];
    self.bankConversionPri_Label.text = [NSString stringWithFormat:@"中行折算价:%@",item.bankConversionPri];
    self.shortName_Label.text =[NSString stringWithFormat:@"货币简称:%@",[shortName_dic objectForKey:item.name]];
    self.name_Label.adjustsFontSizeToFitWidth = YES;
    self.date_Label.adjustsFontSizeToFitWidth = YES;
    self.time_Label.adjustsFontSizeToFitWidth = YES;
    self.fBuyPri_Label.adjustsFontSizeToFitWidth = YES;
    self.mBuyPri_Label.adjustsFontSizeToFitWidth = YES;
    self.fSellPri_Label.adjustsFontSizeToFitWidth = YES;
    self.mSellPri_Label.adjustsFontSizeToFitWidth = YES;
    self.bankConversionPri_Label.adjustsFontSizeToFitWidth = YES;
    self.shortName_Label.adjustsFontSizeToFitWidth = YES;
}




@end
