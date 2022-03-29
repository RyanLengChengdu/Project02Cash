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
@interface Page1ViewController ()<QiCardViewDataSource, QiCardViewDelegate>
@property(nonatomic,strong)UIView *navigationBottom_Border;
@property(nonatomic,strong)QiCardView *cardView;
@end

@implementation Page1ViewController
-(instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"中行汇率";
        //self.navigationItem.title = @"dddd";
    }
    return self;
}
//初始化cardView
-(void)initCardViews{
    _cardView = [[QiCardView alloc]initWithFrame:CGRectMake(25.0, 150.0, self.view.frame.size.width - 50.0, 420.0)];
    _cardView.backgroundColor = [UIColor lightGrayColor];//!< 为了指出carddView的区域，指明背景色
    _cardView.dataSource = self;
    _cardView.delegate = self;
    _cardView.visibleCount = 3;
    _cardView.lineSpacing = 15.0;
    _cardView.interitemSpacing = 10.0;
    _cardView.maxAngle = 10.0;
    _cardView.isAlpha = YES;
    _cardView.maxRemoveDistance = 100.0;
    _cardView.layer.cornerRadius = 10.0;
    [_cardView registerClass:[QiCardViewCell class] forCellReuseIdentifier:@"cardCell"];
    [self.view addSubview:_cardView];
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
        make.top.equalTo(self.mas_topLayoutGuideBottom).with.offset(1);
        make.height.equalTo(@2);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:31/255.0 green:34/255.0 blue:38/255.0 alpha:1.00]];
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
    return cell;
}

- (NSInteger)numberOfCountInCardView:(UITableView *)cardView {
    return 3;
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
@end
