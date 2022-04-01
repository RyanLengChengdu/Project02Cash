//
//  SettingViewController.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/29.
//

#import "SettingViewController.h"
#import "Masonry.h"
@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong,readwrite)UIView *square1;
@property(nonatomic,strong,readwrite)UIImageView *leftImage_privacy;
@property(nonatomic,strong,readwrite)UILabel *label1;

@property(nonatomic,strong,readwrite)UIView *square2;
@property(nonatomic,strong,readwrite)UIImageView *leftImage_clear;
@property(nonatomic,strong,readwrite)UILabel *label2;

@property(nonatomic,strong,readwrite)UIView *square3;
@property(nonatomic,strong,readwrite)UIImageView *leftImage_version;
@property(nonatomic,strong,readwrite)UILabel *label3_1;
@property(nonatomic,strong,readwrite)UILabel *label3_2;

@property(nonatomic,strong,readwrite)UITableView *tableView;
@end

@implementation SettingViewController
- (instancetype)init{
    self = [super init];
    if (self) {
        //隐藏系统返回按钮
        [self.navigationItem setHidesBackButton:YES];
        UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic-out"] style:UIBarButtonItemStylePlain target:self action:@selector((_backToPage1VC))];
        self.navigationItem.rightBarButtonItem =buttonItem;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view setBackgroundColor:[UIColor blackColor]];
    //第一个框
    [self.view addSubview:({
        _square1 = [[UIView alloc]init];
        _square1.backgroundColor = [UIColor colorWithRed:49/255.0 green:53/255.0 blue:57/255.0 alpha:1.00];
            _square1.layer.cornerRadius = 8;
        _square1;
    })];
    [_square1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.left.equalTo(self.view).with.offset(10);
        make.top.equalTo(self.mas_topLayoutGuideBottom).with.offset(40);
        make.height.equalTo(self.view).multipliedBy(92.0/811);
    }];
    
    [_square1 addSubview:({
        _leftImage_privacy = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic-privacy"]];
        _leftImage_privacy;
    })];
    [_leftImage_privacy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(_square1.mas_left).with.offset(24.33);
    }];
    [_square1 addSubview:({
        _label1 = [[UILabel alloc]init];
        _label1.text = @"隐私声明";
        _label1.textColor = [UIColor whiteColor];
        _label1;
    })];
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftImage_privacy.mas_right).with.offset(25.33);
        make.centerY.mas_equalTo(0);
    }];
    
    //第二个框
    [self.view addSubview:({
        _square2 = [[UIView alloc]init];
        _square2.backgroundColor = [UIColor colorWithRed:49/255.0 green:53/255.0 blue:57/255.0 alpha:1.00];
        _square2.layer.cornerRadius = 8;
        _square2;
    })];
    [_square2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.left.equalTo(self.view).with.offset(10);
        make.top.equalTo(_square1.mas_bottom).with.offset(22.33);
        make.height.equalTo(self.view).multipliedBy(92.0/811);
    }];
    
    [_square2 addSubview:({
        _leftImage_clear = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic-clear"]];
        _leftImage_clear;
    })];
    [_leftImage_clear mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(_square2.mas_left).with.offset(24.33);
    }];
    [_square2 addSubview:({
        _label2 = [[UILabel alloc]init];
        _label2.text = @"清除缓存";
        _label2.textColor = [UIColor whiteColor];
        _label2;
    })];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftImage_clear.mas_right).with.offset(25.33);
        make.centerY.mas_equalTo(0);
    }];
    
    //第三个框
    [self.view addSubview:({
        _square3 = [[UIView alloc]init];
        _square3.backgroundColor = [UIColor colorWithRed:49/255.0 green:53/255.0 blue:57/255.0 alpha:1.00];
        _square3.layer.cornerRadius = 8;
        _square3;
    })];
    [_square3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.left.equalTo(self.view).with.offset(10);
        make.top.equalTo(_square2.mas_bottom).with.offset(22.33);
        make.height.equalTo(self.view).multipliedBy(92.0/811);
    }];
    
    [_square3 addSubview:({
        _leftImage_version = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic-version"]];
        _leftImage_version;
    })];
    [_leftImage_version mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(_square3.mas_left).with.offset(24.33);
    }];
    [_square3 addSubview:({
        _label3_1 = [[UILabel alloc]init];
        _label3_1.text = @"更新版本";
        _label3_1.textColor = [UIColor whiteColor];
        _label3_1;
    })];
    [_label3_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftImage_version.mas_right).with.offset(25.33);
        //make.top.equalTo(_square3.mas_height).multipliedBy(25.67/92);
        make.top.equalTo(_square3.mas_top).with.offset(25);
    }];
    [_square3 addSubview:({
        _label3_2 = [[UILabel alloc]init];
        //此处设置文字混排
        _label3_2.text = @"已是最新版本V1.0.2";
        _label3_2.textColor = [UIColor whiteColor];
        _label3_2;
    })];
    [_label3_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftImage_version.mas_right).with.offset(25.33);
        make.bottom.equalTo(_square3.mas_bottom).with.offset(-25);
    }];
    
    _tableView =[[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    _tableView.layer.cornerRadius = 8;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(_square3.mas_bottom).with.offset(22.33);
        make.left.equalTo(self.view.mas_left).with.offset(10.33);
        make.height.mas_equalTo(270);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
-(void)_backToPage1VC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.backgroundColor = [UIColor colorWithRed:49/255.0 green:53/255.0 blue:57/255.0 alpha:1.00];
    cell.textLabel.textColor = [UIColor whiteColor];
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"ic-othe"];
        cell.textLabel.text = @"其他";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"我要反馈";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }else{
        cell.textLabel.text = @"安全退出";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    return cell;
}
@end
