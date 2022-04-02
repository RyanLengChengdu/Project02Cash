//
//  Page3ViewController.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/29.
//

#import "Page3ViewController.h"
#import "Masonry.h"
#import "TransferCell.h"
#import "ListLoader.h"
#import "CashItem.h"
@interface Page3ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *navigationBottom_Border;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *startButton;

@property(nonatomic,strong)UILabel *left_label_1;
@property(nonatomic,strong)UILabel *left_label_2;
@property(nonatomic,strong)UILabel *left_label_3;
@property(nonatomic,strong)UILabel *left_label_4;

@property(nonatomic,strong)UILabel *right_label_1;
@property(nonatomic,strong)UILabel *right_label_2;
@property(nonatomic,strong)UILabel *right_label_3;
@property(nonatomic,strong)UILabel *right_label_4;

@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)ListLoader *loader;

@property (nonatomic, assign)float money1;
@property (nonatomic, assign)float money2;
@property (nonatomic, assign)float res;


@end

@implementation Page3ViewController
-(instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"汇率转换";
        self.tabBarItem.image = [UIImage imageNamed:@"tab-icon-hv-nor"];
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab-icon-hv-s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.topItem.title = @"汇率转换器";
    //navigationbar的下划线设置
    [self.view addSubview:({
        _navigationBottom_Border = [[UIView alloc]init];
        _navigationBottom_Border.backgroundColor = [UIColor redColor];
        _navigationBottom_Border;
    })];
    [_navigationBottom_Border mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.mas_topLayoutGuideBottom).with.offset(0);
        make.height.equalTo(@2);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        _loader = [[ListLoader alloc]init];
        __weak typeof(self)weakSelf = self;
        [self.loader loadDataWithFinishBlock:^(BOOL success, NSArray<CashItem *> *dataArray) {
            __strong typeof(self)strongSelf = weakSelf;
            strongSelf.dataArray = dataArray;
        }];
    NSLog(@"%@",_dataArray);
    [self.view setBackgroundColor:[UIColor colorWithRed:31/255.0 green:34/255.0 blue:38/255.0 alpha:1.00]];
    
    [self.view addSubview:({
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor redColor];
        _tableView;
    })];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(0);
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.mas_topLayoutGuideBottom).with.offset(0);
        make.bottom.equalTo(self.mas_bottomLayoutGuideBottom).multipliedBy(0.55);
    }];
    [self.view addSubview:({
        _startButton = [[UIButton alloc]init];
        [_startButton addTarget:self action:@selector(_calculate) forControlEvents:UIControlEventTouchUpInside];
        _startButton.backgroundColor = [UIColor redColor];
        [_startButton setTitle:@"开始进行新源汇率转换" forState:UIControlStateNormal];
        _startButton;
    })];
    [_startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tableView.mas_bottom).with.offset(0);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(56.0/811);
    }];
    
    
    [self.view addSubview:({
        _left_label_1 = [[UILabel alloc]init];
        _left_label_1.text = @"源货币类型";
        _left_label_1.textAlignment = NSTextAlignmentCenter;
        _left_label_1;
    })];
    [_left_label_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_startButton.mas_bottom).with.offset(0);
        make.left.equalTo(self.view).with.offset(0);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.view).multipliedBy(53.0/811);
    }];
    
    [self.view addSubview:({
        _left_label_2 = [[UILabel alloc]init];
        _left_label_2.text = @"目标货币类型";
        _left_label_2.textAlignment = NSTextAlignmentCenter;
        _left_label_2;
    })];
    [_left_label_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_left_label_1.mas_bottom).with.offset(0);
        make.left.equalTo(self.view).with.offset(0);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.view).multipliedBy(53.0/811);
    }];
    
    [self.view addSubview:({
        _left_label_3 = [[UILabel alloc]init];
        _left_label_3.text = @"转换货币类型";
        _left_label_3.textAlignment = NSTextAlignmentCenter;
        _left_label_3;
    })];
    [_left_label_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_left_label_2.mas_bottom).with.offset(0);
        make.left.equalTo(self.view).with.offset(0);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.view).multipliedBy(53.0/811);
    }];
    
    [self.view addSubview:({
        _left_label_4 = [[UILabel alloc]init];
        _left_label_4.text = @"最终换算后金额";
        _left_label_4.textAlignment = NSTextAlignmentCenter;
        _left_label_4;
    })];
    [_left_label_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_left_label_3.mas_bottom).with.offset(0);
        make.left.equalTo(self.view).with.offset(0);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.view).multipliedBy(53.0/811);
    }];
    
    
    [self.view addSubview:({
        _right_label_1 = [[UILabel alloc]init];
        //_right_label_1.text = @"最终换算后金额";
        _right_label_1.textAlignment = NSTextAlignmentCenter;
        _right_label_1;
    })];
    [_right_label_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_left_label_1.mas_right).with.offset(0);
        make.width.equalTo(_left_label_1.mas_width);
        make.height.equalTo(_left_label_1.mas_height);
        make.top.equalTo(_left_label_1.mas_top);
    }];
    
    [self.view addSubview:({
        _right_label_2 = [[UILabel alloc]init];
        //_right_label_2.text = @"最终换算后金额";
        _right_label_2.textAlignment = NSTextAlignmentCenter;
        _right_label_2;
    })];
    [_right_label_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_left_label_2.mas_right).with.offset(0);
        make.width.equalTo(_left_label_2.mas_width);
        make.height.equalTo(_left_label_2.mas_height);
        make.top.equalTo(_left_label_2.mas_top);
    }];
    
    [self.view addSubview:({
        _right_label_3 = [[UILabel alloc]init];
        //_right_label_3.text = @"最终换算后金额";
        _right_label_3.textAlignment = NSTextAlignmentCenter;
        _right_label_3;
    })];
    [_right_label_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_left_label_3.mas_right).with.offset(0);
        make.width.equalTo(_left_label_3.mas_width);
        make.height.equalTo(_left_label_3.mas_height);
        make.top.equalTo(_left_label_3.mas_top);
    }];
    
    [self.view addSubview:({
        _right_label_4 = [[UILabel alloc]init];
        //_right_label_4.text = @"最终换算后金额";
        _right_label_4.textColor = [UIColor redColor];
        _right_label_4.textAlignment = NSTextAlignmentCenter;
        _right_label_4;
    })];
    [_right_label_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_left_label_4.mas_right).with.offset(0);
        make.width.equalTo(_left_label_4.mas_width);
        make.height.equalTo(_left_label_4.mas_height);
        make.top.equalTo(_left_label_4.mas_top);
    }];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.bounds.size.height/14;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TransferCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    if (!cell) {
        cell = [[TransferCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
    }
    [cell setDataWithIndex:(int)indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:31/255.0 green:34/255.0 blue:38/255.0 alpha:1.00];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * arr = @[@[@"瑞典克朗",@"加拿大元",@10],@[@"菲律宾比索",@"新台币",@20],@[@"加拿大元",@"澳大利亚元",@30],@[@"新台币",@"澳门元",@40],@[@"澳大利亚元",@"欧元",@50],@[@"澳门元",@"美元",@60],@[@"欧元",@"挪威克朗",@70]];
    _right_label_1.text = arr[indexPath.row][0];
    _right_label_2.text = arr[indexPath.row][1];
    _right_label_3.text = [NSString stringWithFormat:@"%@",arr[indexPath.row][2]];
    //   前/后*数量

    for (CashItem *info in _dataArray) {
        if ([arr[indexPath.row][0] isEqualToString:info.name]) {
           NSString *money1str =info.bankConversionPri;
            NSLog(@"%@",info.name);
            _money1 = [money1str floatValue];
            break;
        }
    }
   
    for (CashItem *info in _dataArray) {
        if ([arr[indexPath.row][1] isEqualToString:info.name]) {
            NSString *money2str =info.bankConversionPri;
            _money2 = [money2str floatValue];
            break;
        }
    }
    
    _res = _money1/_money2*[arr[indexPath.row][2] floatValue];
}
-(void)_calculate{
    self.right_label_4.text = [NSString stringWithFormat:@"%f",_res];
}
@end
