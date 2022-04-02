//
//  Page1ViewController.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/29.
//

#import "Page1ViewController.h"
#import "SettingViewController.h"
#import "Masonry.h"
#import "QiCardView.h"
#import "QiCardCell.h"
#import "CheckListCell.h"
#import "ListLoader.h"
@interface Page1ViewController ()<QiCardViewDataSource, QiCardViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *navigationBottom_Border;
@property(nonatomic,strong)QiCardView *cardView;
@property(nonatomic,strong)UILabel *allCheckListLabel;
@property(nonatomic,strong)UILabel *canUnfoldLabel;
@property(nonatomic,strong)UIButton *unfoldButton;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong,readwrite)NSArray *dataArray;
@property(nonatomic,strong)ListLoader *loader;

//@property (nonatomic,strong)NSNotification *notification;
@end

@implementation Page1ViewController
-(instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"中行汇率";
        __weak typeof(self)weakSelf = self;
        NSTimer *timer = [NSTimer timerWithTimeInterval:10.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            __strong typeof(self)strongSelf = weakSelf;
            [strongSelf.cardView reloadData];
        }];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
    return self;
}

//初始化cardView
-(void)initCardViews{
    //适配的时候修改距离上边距的距离
    _cardView = [[QiCardView alloc]initWithFrame:CGRectMake(25.0, 22.67, self.view.frame.size.width - 50.0, 150)];
    //_cardView.backgroundColor = [UIColor orangeColor];
    //!< 为了指出carddView的区域，指明背景色
    _cardView.dataSource = self;
    _cardView.delegate = self;
    _cardView.visibleCount = 3;
    _cardView.lineSpacing = 15.0;
    _cardView.interitemSpacing = 10.0;
    _cardView.maxAngle = 10.0;
    _cardView.isAlpha = YES;
    _cardView.maxRemoveDistance = 100.0;
    _cardView.layer.cornerRadius = 10.0;
    [_cardView registerClass:[QiCardCell class] forCellReuseIdentifier:@"cardCell"];
    [_scrollView addSubview:_cardView];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab-icon-zh-s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.image = [[UIImage imageNamed:@"tab-icon-zh-nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //title和leftbutton设置
    self.navigationController.navigationBar.topItem.title = @"中银汇率";
    self.navigationController.navigationBar.topItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"hm-icon-site"] style:UIBarButtonItemStylePlain target:self action:@selector(_click_left_button)];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
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

    [self.view setBackgroundColor:[UIColor colorWithRed:31/255.0 green:34/255.0 blue:38/255.0 alpha:1.00]];
    [self.view addSubview:({
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake( self.view.bounds.size.width, self.view.bounds.size.height * 2);
        _scrollView.userInteractionEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView;
    })];
    [self initCardViews];

    [_scrollView addSubview:({
        _allCheckListLabel = [[UILabel alloc]init];
        _allCheckListLabel.text = @"所有货币实时汇率查询表";
        _allCheckListLabel;
    })];
    [_allCheckListLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(11);
        make.top.equalTo(_cardView.mas_bottom).with.offset(30);
    }];
    
    [_scrollView addSubview:({
        _canUnfoldLabel = [[UILabel alloc]init];
        _canUnfoldLabel.text = @"(可展开)";
        _canUnfoldLabel.textColor = [UIColor colorWithRed:213/255.0 green:47/255.0 blue:47/255.0 alpha:1.00];
        _canUnfoldLabel.font = [UIFont fontWithName:@"PingFang SC" size: 12];
        _canUnfoldLabel;
    })];
    [_canUnfoldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_allCheckListLabel.mas_right).with.offset(2);
        make.top.equalTo(_cardView.mas_bottom).with.offset(32);
    }];
    
    [_scrollView addSubview:({
        _unfoldButton =[[UIButton alloc]init];
        [_unfoldButton setImage:[UIImage imageNamed:@"hm-ic-arrow-down"] forState:UIControlStateNormal];
        [_unfoldButton addTarget:self action:@selector(_scroll) forControlEvents:UIControlEventTouchUpInside];
        _unfoldButton;
    })];
    [_unfoldButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-11);
        make.top.equalTo(_cardView.mas_bottom).with.offset(30);
    }];
    
    //tableView
    [_scrollView addSubview:({
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //_tableView.backgroundColor = [UIColor colorWithRed:31/255.0 green:34/255.0 blue:38/255.0 alpha:1.00];
        _tableView;
    })];

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_allCheckListLabel.mas_bottom).with.offset(16.67);
        make.centerX.mas_equalTo(0);
        make.left.equalTo(self.view).with.offset(10.33);
        make.height.equalTo(self.view).multipliedBy(2);
    }];
    
    _loader = [[ListLoader alloc]init];
    __weak typeof(self)weakSelf = self;
    NSTimer *timer2 = [NSTimer timerWithTimeInterval:3.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof(self)strongSelf = weakSelf;
        
        __weak typeof(self)weakSelf2 = strongSelf;
        [strongSelf.loader loadDataWithFinishBlock:^(BOOL success, NSArray<CashItem *> *dataArray) {
                __strong typeof(self)strongSelf2 = weakSelf2;
                strongSelf2.dataArray = dataArray;
                [strongSelf2.tableView reloadData];
            }];
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer2 forMode:NSRunLoopCommonModes];
    

    
    
}

-(void)_click_left_button{
    SettingViewController *settingVC = [[SettingViewController alloc]init];
    settingVC.title = @"设置中心";
    [self.navigationController pushViewController:settingVC animated:YES];
}


#pragma mark - QiCardViewDataSource

- (QiCardCell *)cardView:(QiCardView *)cardView cellForRowAtIndex:(NSInteger)index {
    QiCardCell *cell = [cardView dequeueReusableCellWithIdentifier:@"cardCell"];
    
    cell.layer.cornerRadius = 10.0;
    cell.layer.masksToBounds = YES;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (NSInteger)numberOfCountInCardView:(UITableView *)cardView {
    return 3;
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 22;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CheckListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[CheckListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.color2 = (indexPath.row%2 == 0) ? YES : NO;
    [cell setDataWithCashItem:[_dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 222;
}
#pragma mark - QiCardViewDelegate

- (void)cardView:(QiCardView *)cardView didRemoveLastCell:(QiCardViewCell *)cell forRowAtIndex:(NSInteger)index {
    [cardView reloadDataAnimated:YES];
}

- (void)cardView:(QiCardView *)cardView didRemoveCell:(QiCardViewCell *)cell forRowAtIndex:(NSInteger)index {
    NSLog(@"didRemoveCell forRowAtIndex = %ld", index);
}

- (void)cardView:(QiCardView *)cardView didDisplayCell:(QiCardViewCell *)cell forRowAtIndex:(NSInteger)index {
    
    NSLog(@"didDisplayCell forRowAtIndex = %ld", index);
    
    NSLog(@"currentFirstIndex = %ld",cardView.currentFirstIndex);
    NSLog(@"%ld",index);
}

- (void)cardView:(QiCardView *)cardView didMoveCell:(QiCardViewCell *)cell forMovePoint:(CGPoint)point {
//    NSLog(@"move point = %@", NSStringFromCGPoint(point));
}
-(void)_scroll{
    CGPoint position = CGPointMake(0, 100);
    [_scrollView setContentOffset:position animated:YES];
}
@end
