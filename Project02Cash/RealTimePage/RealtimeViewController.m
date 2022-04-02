//
//  RealtimeViewController.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/4/2.
//

#import "RealtimeViewController.h"
#import "Masonry.h"
#import "RealtimeCell.h"
#import "ListLoader.h"
#import "CashItem.h"
@interface RealtimeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *navigationBottom_Border;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *TopBackgroundView;
@property(nonatomic,strong)UIView *TopSquareView;
@property(nonatomic,strong)UIImageView *TopImageView;
@property(nonatomic,strong)UILabel *TopLabel1;
@property(nonatomic,strong)UILabel *TopLabel2;
@property(nonatomic,strong)UITableView *tableView;

//数据加载
@property(nonatomic,strong)ListLoader* loader;
@property(nonatomic,strong,readwrite)NSArray *dataArray;

@end

@implementation RealtimeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //[self.navigationItem setHidesBackButton:YES];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab-icon-hv-s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.topItem.title = @"各大银行实时汇率";
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
    [self.view addSubview:({
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake( self.view.bounds.size.width, self.view.bounds.size.height * 2);
        _scrollView.userInteractionEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView;
    })];
   //TopView
    [_scrollView addSubview:({
        _TopBackgroundView =[[UIView alloc] init];
        //_TopBackgroundView.alpha = 1;
        //_TopBackgroundView.backgroundColor = [UIColor colorWithRed:214.0/255.0 green:37.0/255.0 blue:41.0/255.0 alpha:1.00];
        // Shadow Code
         //Radius Code
        _TopBackgroundView.layer.cornerRadius = 8.33;
        _TopBackgroundView.tag = 0;
        _TopBackgroundView;
    })];
    [_TopBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scrollView).with.offset(10.33);
        make.centerX.mas_equalTo(0);
        make.top.equalTo(_scrollView.mas_top).with.offset(18);
        make.height.equalTo(self.view).multipliedBy(116.0/811);
    }];
    
    [_TopBackgroundView.layer addSublayer:({
        CAGradientLayer *gl = [[CAGradientLayer alloc]init];
        
        gl.colors = @[
            (__bridge id)[UIColor colorWithRed:214/255.0 green:37/255.0 blue:41/255.0 alpha:1.00].CGColor,
            (__bridge id)[UIColor colorWithRed:108/255.0 green:15/255.0 blue:16/255.0 alpha:1.00].CGColor,
            ];
        gl.locations = @[@0.0, @1.0];
        //左右渐变透明
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1.0, 1.0);
        [_TopBackgroundView layoutIfNeeded];
        gl.frame = _TopBackgroundView.bounds;
        gl.cornerRadius = 8.33;
        //gl.frame = CGRectMake(0, 0, 300, 100);
        gl;
    })];
    
    [_TopBackgroundView addSubview:({
        _TopSquareView = [[UIView alloc]init];
        _TopSquareView.backgroundColor = [UIColor whiteColor];
        _TopSquareView.layer.cornerRadius = 15;
        _TopSquareView;
    })];
    [_TopSquareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_TopBackgroundView.mas_right).multipliedBy(14.0/354);
        make.centerY.mas_equalTo(_TopBackgroundView);
        make.width.equalTo(_TopBackgroundView).multipliedBy(75.0/354);
        make.height.equalTo(_TopBackgroundView).multipliedBy(75.0/116);
    }];
    [_TopSquareView addSubview:({
        _TopImageView = [[UIImageView alloc]init];
        _TopImageView.image = [UIImage imageNamed:@"vzdkjgjr-img"];
        _TopImageView;
    })];
    [_TopImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    
    [_TopBackgroundView addSubview:({
        _TopLabel1 = [[UILabel alloc]init];
        _TopLabel1.text = @"GSBank";
        _TopLabel1.textColor = [UIColor whiteColor];
        _TopLabel1.font = [UIFont systemFontOfSize:20];
        _TopLabel1;
    })];
    [_TopLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_TopBackgroundView.mas_right).multipliedBy(113.0/354);
        make.top.equalTo(_TopBackgroundView.mas_bottom).multipliedBy(28.0/116);
    }];
    
    [_TopBackgroundView addSubview:({
        _TopLabel2 = [[UILabel alloc]init];
        _TopLabel2.text = @"工商银行实时汇率";
        _TopLabel2.textColor = [UIColor whiteColor];
        _TopLabel2.font = [UIFont systemFontOfSize:20];
        _TopLabel2;
    })];
    [_TopLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_TopBackgroundView.mas_right).multipliedBy(113.0/354);
        make.top.equalTo(_TopBackgroundView.mas_bottom).multipliedBy(59.0/116);
    }];
    
    [_scrollView addSubview:({
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView;
    })];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_TopBackgroundView.mas_bottom).with.offset(10);
        make.centerX.mas_equalTo(0);
        make.left.equalTo(self.view).with.offset(10.33);
        make.height.equalTo(self.view).multipliedBy(8.25);
    }];
    
    _loader = [[ListLoader alloc]init];
    __weak typeof(self)weakSelf = self;
    [self.loader loadDataWithtagNum:self.tagNum WithFinishBlock:^(BOOL success, NSArray<CashItem *> * _Nonnull dataArray) {
        __strong typeof(self)strongSelf = weakSelf;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (327.0/811)*self.view.bounds.size.height;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 13;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RealtimeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[RealtimeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell loadDataWithItem:[_dataArray objectAtIndex:indexPath.row]];
    cell.backgroundColor = [UIColor colorWithRed:31/255.0 green:34/255.0 blue:38/255.0 alpha:1.00];
    return cell;
}

//layer相关
//-(void)layoutSublayersOfLayer:(CALayer *)layer{
//    //[super layoutSublayersOfLayer:layer];
//    //添加layer
//    [self addCornerMethod];
//}
//
///**
// 添加layer方法
// */
//-(void)addCornerMethod{
//    UIRectCorner corner = UIRectCornerAllCorners;
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.timeoutBtn.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(3, 3)];
//    CAShapeLayer *masklayer = [[CAShapeLayer alloc]init];
//    masklayer.frame = self.timeoutBtn.bounds;
//    masklayer.path = path.CGPath;
//    self.timeoutBtn.layer.mask = masklayer;
//}
@end
