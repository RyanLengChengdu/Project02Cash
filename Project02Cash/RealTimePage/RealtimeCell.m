//
//  RealtimeCell.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/4/2.
//

#import "RealtimeCell.h"
#import "Masonry.h"
#import "CashItem.h"

@interface RealtimeCell ()
@property(nonatomic,strong)UIView *view1;
@property(nonnull,strong)UILabel *label1_1;
@property(nonatomic,strong)UIView *view2;
@property(nonnull,strong)UILabel *label2_1;
@property(nonnull,strong)UILabel *label2_2;
@property(nonatomic,strong)UIView *view3;
@property(nonnull,strong)UILabel *label3_1;
@property(nonnull,strong)UILabel *label3_2;
@property(nonatomic,strong)UIView *view4;
@property(nonnull,strong)UILabel *label4_1;
@property(nonnull,strong)UILabel *label4_2;
@property(nonatomic,strong)UIView *view5;
@property(nonnull,strong)UILabel *label5_1;
@property(nonnull,strong)UILabel *label5_2;
@property(nonatomic,strong)UIView *view6;
@property(nonnull,strong)UILabel *label6_1;
@property(nonnull,strong)UILabel *label6_2;
@property(nonatomic,strong)UIView *view7;
@property(nonnull,strong)UILabel *label7_1;
@property(nonnull,strong)UILabel *label7_2;

@end

@implementation RealtimeCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            _view1 = [[UIView alloc]init];
            _view1.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
            _view1;
        })];
        [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(0);
            make.centerX.mas_equalTo(0);
            make.top.equalTo(self.mas_top).with.offset(0);
            make.height.equalTo(self.mas_height).multipliedBy(1.0/7);
        }];
    }
    [_view1 addSubview:({
        _label1_1 = [[UILabel alloc]init];
        _label1_1;
    })];
    [_label1_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(_view1.mas_left).with.offset(5);
    }];
    
    //view2
    [self.contentView addSubview:({
        _view2 = [[UIView alloc]init];
        _view2;
    })];
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.centerX.mas_equalTo(0);
        make.top.equalTo(_view1.mas_bottom).with.offset(0);
        make.height.equalTo(self.mas_height).multipliedBy(1.0/7);
    }];
    [_view2 addSubview:({
        _label2_1 = [[UILabel alloc]init];
        _label2_1.text = @"货币类型";
        _label2_1.textColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        _label2_1;
    })];
    [_label2_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(_view1.mas_left).with.offset(5);
    }];
    [_view2 addSubview:({
        _label2_2 = [[UILabel alloc]init];
        _label2_2.textColor = _label2_1.textColor;
        _label2_2;
    })];
    [_label2_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.equalTo(_view1.mas_right).with.offset(-5);
    }];
    
    //view3
    [self.contentView addSubview:({
        _view3 = [[UIView alloc]init];
        _view3.backgroundColor = [UIColor blackColor];
        _view3;
    })];
    [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.centerX.mas_equalTo(0);
        make.top.equalTo(_view2.mas_bottom).with.offset(0);
        make.height.equalTo(self.mas_height).multipliedBy(1.0/7);
    }];
    [_view3 addSubview:({
        _label3_1 = [[UILabel alloc]init];
        _label3_1.textColor = [UIColor whiteColor];
        _label3_1.text = @"货币简码";
        _label3_1;
    })];
    [_label3_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(_view1.mas_left).with.offset(5);
    }];
    [_view3 addSubview:({
        _label3_2 = [[UILabel alloc]init];
        _label3_2.textColor = [UIColor whiteColor];
        //_label3_2.textColor = _label2_1.textColor;
        _label3_2;
    })];
    [_label3_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.equalTo(_view2.mas_right).with.offset(-5);
    }];
    
    
    //view4
    [self.contentView addSubview:({
        _view4 = [[UIView alloc]init];
        _view4;
    })];
    [_view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.centerX.mas_equalTo(0);
        make.top.equalTo(_view3.mas_bottom).with.offset(0);
        make.height.equalTo(self.mas_height).multipliedBy(1.0/7);
    }];
    [_view4 addSubview:({
        _label4_1 = [[UILabel alloc]init];
        _label4_1.text = @"现汇买入价";
        _label4_1.textColor = _label2_1.textColor;
        _label4_1;
    })];
    [_label4_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(_view1.mas_left).with.offset(5);
    }];
    [_view4 addSubview:({
        _label4_2 = [[UILabel alloc]init];
        _label4_2.textColor = _label2_1.textColor;
        _label4_2;
    })];
    [_label4_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.equalTo(_view3.mas_right).with.offset(-5);
    }];
    
    //view5
    [self.contentView addSubview:({
        _view5 = [[UIView alloc]init];
        _view5.backgroundColor = [UIColor blackColor];
        _view5;
    })];
    [_view5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.centerX.mas_equalTo(0);
        make.top.equalTo(_view4.mas_bottom).with.offset(0);
        make.height.equalTo(self.mas_height).multipliedBy(1.0/7);
    }];
    [_view5 addSubview:({
        _label5_1 = [[UILabel alloc]init];
        _label5_1.textColor = [UIColor whiteColor];
        _label5_1.text = @"现汇卖出价";
        _label5_1;
    })];
    [_label5_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(_view1.mas_left).with.offset(5);
    }];
    [_view5 addSubview:({
        _label5_2 = [[UILabel alloc]init];
        _label5_2.textColor = [UIColor whiteColor];
        _label5_2;
    })];
    [_label5_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.equalTo(_view4.mas_right).with.offset(-5);
    }];
    
    //view6
    [self.contentView addSubview:({
        _view6 = [[UIView alloc]init];
        _view6;
    })];
    [_view6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.centerX.mas_equalTo(0);
        make.top.equalTo(_view5.mas_bottom).with.offset(0);
        make.height.equalTo(self.mas_height).multipliedBy(1.0/7);
    }];
    [_view6 addSubview:({
        _label6_1 = [[UILabel alloc]init];
        _label6_1.text = @"现钞买入价";
        _label6_1.textColor = _label2_1.textColor;
        _label6_1;
    })];
    [_label6_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(_view1.mas_left).with.offset(5);
    }];
    [_view6 addSubview:({
        _label6_2 = [[UILabel alloc]init];
        _label6_2.textColor = _label2_1.textColor;
        _label6_2;
    })];
    [_label6_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.equalTo(_view5.mas_right).with.offset(-5);
    }];
    
    //view7
    [self.contentView addSubview:({
        _view7 = [[UIView alloc]init];
        _view7.backgroundColor = [UIColor blackColor];
        _view7;
    })];
    [_view7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.centerX.mas_equalTo(0);
        make.top.equalTo(_view6.mas_bottom).with.offset(0);
        make.height.equalTo(self.mas_height).multipliedBy(1.0/7);
    }];
    [_view7 addSubview:({
        _label7_1 = [[UILabel alloc]init];
        _label7_1.textColor = [UIColor whiteColor];
        _label7_1.text = @"现钞卖出价";
        _label7_1;
    })];
    [_label7_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(_view1.mas_left).with.offset(5);
    }];
    [_view7 addSubview:({
        _label7_2 = [[UILabel alloc]init];
        _label7_2.textColor = [UIColor whiteColor];
        _label7_2;
    })];
    [_label7_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.equalTo(_view6.mas_right).with.offset(-5);
    }];
    return self;
}

-(void)loadDataWithItem:(CashItem *)item{
    NSDictionary *shortName_dic = @{@"美元":@"USD",@"欧元":@"EUR",@"港币":@"HKD",@"日元":@"JPY",@"英镑":@"GBP",@"澳大利亚元":@"AUD",@"加拿大元":@"CAD",@"泰国铢":@"THB",@"新加坡元":@"SGD",@"瑞士法郎":@"CHF",@"丹麦克朗":@"DKK",@"澳门元":@"MOP",@"林吉特":@"MYR",@"挪威克朗":@"NOK",@"新西兰元":@"NZD",@"菲律宾比索":@"PHP",@"卢布":@"SUR",@"瑞典克朗":@"SEK",@"新台币":@"TWD",@"巴西雷亚尔":@"BRL",@"韩国元":@"KRW",@"南非兰特":@"ZAR"};
    _label1_1.text = [NSString stringWithFormat:@"当前货币类型---%@",item.name];
    _label2_2.text = item.name;
    _label3_2.text = [shortName_dic objectForKey:item.name];
    _label4_2.text = item.fBuyPri;
    _label5_2.text = item.fSellPri;
    _label6_2.text = item.mBuyPri;
    _label7_2.text = item.mSellPri;
}
@end
