//
//  Page2ViewController.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/29.
//

#import "Page2ViewController.h"
#import "RealtimeViewController.h"
#import "Masonry.h"
@interface Page2ViewController ()
@property(nonatomic,strong)UIView *navigationBottom_Border;
@property(nonatomic,strong)UIScrollView *scrollView;
//工商
@property(nonatomic,strong)UIView* GSBackgroundView;
@property(nonatomic,strong)UIView * GSsquareView;
@property(nonatomic,strong)UIImageView *GSImageView;
@property(nonatomic,strong)UILabel *GSLabel1;
@property(nonatomic,strong)UILabel *GSLabel2;

//上海
@property(nonatomic,strong)UIView * SHsquareView;
@property(nonatomic,strong)UIImageView *SHImageView;
@property(nonatomic,strong)UILabel *SHLabel;

//新业
@property(nonatomic,strong)UIView * XYsquareView;
@property(nonatomic,strong)UIImageView *XYImageView;
@property(nonatomic,strong)UILabel *XYLabel;

//光大
@property(nonatomic,strong)UIView * GDsquareView;
@property(nonatomic,strong)UIImageView *GDImageView;
@property(nonatomic,strong)UILabel *GDLabel;

//建设
@property(nonatomic,strong)UIView * JSsquareView;
@property(nonatomic,strong)UIImageView *JSImageView;

//建设
@property(nonatomic,strong)UIView * NYsquareView;
@property(nonatomic,strong)UIImageView *NYImageView;

//招商
@property(nonatomic,strong)UIView * ZSsquareView;
@property(nonatomic,strong)UIImageView *ZSImageView;
@end


@implementation Page2ViewController
-(instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"实时汇率";
        self.tabBarItem.image = [UIImage imageNamed:@"tab-icon-ss-nor"];
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab-icon-ss-s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithRed:31/255.0 green:34/255.0 blue:38/255.0 alpha:1.00]];

    
    //firstView
    [self.view addSubview:({
        _GSBackgroundView =[[UIView alloc] init];
        _GSBackgroundView.layer.cornerRadius = 8.33;
        _GSBackgroundView.tag = 0;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_turnToDetail:)];
        [_GSBackgroundView addGestureRecognizer:recognizer];
        _GSBackgroundView;
    })];
    [_GSBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10.33);
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.mas_topLayoutGuideBottom).with.offset(18);
        make.height.equalTo(self.view).multipliedBy(116.0/811);
    }];
    [_GSBackgroundView.layer addSublayer:({
        CAGradientLayer *gl = [[CAGradientLayer alloc]init];
        gl.colors = @[
            (__bridge id)[UIColor colorWithRed:214/255.0 green:37/255.0 blue:41/255.0 alpha:1.00].CGColor,
            (__bridge id)[UIColor colorWithRed:108/255.0 green:15/255.0 blue:16/255.0 alpha:1.00].CGColor,
            ];
        //gl.locations = @[@0.0, @1.0];
        //左右渐变透明
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1.0, 1.0);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@", self.GSBackgroundView);
            gl.frame =self.GSBackgroundView.bounds;
        });
        //gl.frame = _outsideView.bounds;
        gl.cornerRadius = 8.33;
        gl;
    })];
    
    [_GSBackgroundView addSubview:({
        _GSsquareView = [[UIView alloc]init];
        _GSsquareView.backgroundColor = [UIColor whiteColor];
        _GSsquareView.layer.cornerRadius = 15;
        _GSsquareView;
    })];
    [_GSsquareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_GSBackgroundView.mas_right).multipliedBy(14.0/354);
        make.centerY.mas_equalTo(_GSBackgroundView);
        make.width.equalTo(_GSBackgroundView).multipliedBy(75.0/354);
        make.height.equalTo(_GSBackgroundView).multipliedBy(75.0/116);
    }];
    [_GSsquareView addSubview:({
        _GSImageView = [[UIImageView alloc]init];
        _GSImageView.image = [UIImage imageNamed:@"vzdkjgjr-img"];
        _GSImageView;
    })];
    [_GSImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    
    [_GSBackgroundView addSubview:({
        _GSLabel1 = [[UILabel alloc]init];
        _GSLabel1.text = @"GSBank";
        _GSLabel1.textColor = [UIColor whiteColor];
        _GSLabel1.font = [UIFont systemFontOfSize:20];
        _GSLabel1;
    })];
    [_GSLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_GSBackgroundView.mas_right).multipliedBy(113.0/354);
        make.top.equalTo(_GSBackgroundView.mas_bottom).multipliedBy(28.0/116);
    }];
    
    [_GSBackgroundView addSubview:({
        _GSLabel2 = [[UILabel alloc]init];
        _GSLabel2.text = @"工商银行实时汇率";
        _GSLabel2.textColor = [UIColor whiteColor];
        _GSLabel2.font = [UIFont systemFontOfSize:20];
        _GSLabel2;
    })];
    [_GSLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_GSBackgroundView.mas_right).multipliedBy(113.0/354);
        make.top.equalTo(_GSBackgroundView.mas_bottom).multipliedBy(59.0/116);
    }];
    
    //scrollView
        [self.view addSubview:({
            _scrollView = [[UIScrollView alloc]init];
            _scrollView.contentSize = CGSizeMake( 1.25*self.view.bounds.size.width, 0.5*self.view.bounds.size.width);
            _scrollView.userInteractionEnabled = YES;
            _scrollView.scrollEnabled = YES;
            //_scrollView.backgroundColor = [UIColor redColor];
            _scrollView;
        })];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view).with.offset(0);
        make.top.equalTo(_GSBackgroundView.mas_bottom).with.offset(44);
        make.height.equalTo(self.view).multipliedBy(194.0/811);
    }];
    
    //scrollView_view1
    [_scrollView addSubview:({
        _SHsquareView = [[UIView alloc]init];
        _SHsquareView.backgroundColor = [UIColor whiteColor];
        _SHsquareView.layer.cornerRadius = 15;
        _SHsquareView;
    })];
    [_SHsquareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scrollView.mas_left).with.offset(10.33);
        make.top.equalTo(_scrollView.mas_top).with.offset(0);
        make.width.equalTo(self.view).multipliedBy(0.35);
        make.height.equalTo(_SHsquareView.mas_width);
    }];
    [_SHsquareView addSubview:({
        _SHImageView = [[UIImageView alloc]init];
        _SHImageView.image = [UIImage imageNamed:@"sdfkjeeee-img"];
        _SHImageView;
    })];
    [_SHImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    [_scrollView addSubview:({
        _SHLabel = [[UILabel alloc]init];
        _SHLabel.text = @"上海银行实时汇率";
        _SHLabel.textColor = [UIColor whiteColor];
        _SHLabel.font = [UIFont systemFontOfSize:16];
        _SHLabel;
    })];
    [_SHLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scrollView.mas_left).with.offset(10.33);
        make.top.equalTo(_SHsquareView.mas_bottom).with.offset(19);
    }];
    
    //scrollView_view2
    [_scrollView addSubview:({
        _XYsquareView = [[UIView alloc]init];
        //_XYsquareView.backgroundColor = [UIColor blueColor];
        _XYsquareView.layer.cornerRadius = 15;
        _XYsquareView;
    })];
    [_XYsquareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_SHsquareView.mas_right).with.offset(10.33);
        make.top.equalTo(_scrollView.mas_top).with.offset(0);
        make.width.equalTo(self.view).multipliedBy(0.35);
        make.height.equalTo(_SHsquareView.mas_width);
    }];
    [_XYsquareView addSubview:({
        _XYImageView = [[UIImageView alloc]init];
        _XYImageView.image = [UIImage imageNamed:@"fdsje-img"];
        _XYImageView;
    })];
    [_XYImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    [_scrollView addSubview:({
        _XYLabel = [[UILabel alloc]init];
        _XYLabel.text = @"新业银行实时汇率";
        _XYLabel.textColor = [UIColor whiteColor];
        _XYLabel.font = [UIFont systemFontOfSize:16];
        _XYLabel;
    })];
    [_XYLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_SHsquareView.mas_right).with.offset(10.33);
        make.top.equalTo(_SHsquareView.mas_bottom).with.offset(19);
    }];
    
    //scrollView_view3
    [_scrollView addSubview:({
        _GDsquareView = [[UIView alloc]init];
        _GDsquareView.backgroundColor = [UIColor whiteColor];
        _GDsquareView.layer.cornerRadius = 15;
        _GDsquareView;
    })];
    [_GDsquareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_XYsquareView.mas_right).with.offset(10.33);
        make.top.equalTo(_scrollView.mas_top).with.offset(0);
        make.width.equalTo(self.view).multipliedBy(0.35);
        make.height.equalTo(_SHsquareView.mas_width);
    }];
    [_GDsquareView addSubview:({
        _GDImageView = [[UIImageView alloc]init];
        _GDImageView.image = [UIImage imageNamed:@"sdiji-img"];
        _GDImageView;
    })];
    [_GDImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    [_scrollView addSubview:({
        _GDLabel = [[UILabel alloc]init];
        _GDLabel.text = @"光大银行实时汇率";
        _GDLabel.textColor = [UIColor whiteColor];
        _GDLabel.font = [UIFont systemFontOfSize:16];
        _GDLabel;
    })];
    [_GDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_XYsquareView.mas_right).with.offset(10.33);
        make.top.equalTo(_SHsquareView.mas_bottom).with.offset(19);
    }];
    
    
    //建设银行
    [self.view addSubview:({
        _JSsquareView = [[UIView alloc]init];
        _JSsquareView.layer.cornerRadius = 15;
        _JSsquareView.backgroundColor = [UIColor whiteColor];
        _JSsquareView.tag = 2;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_turnToDetail:)];
        [_JSsquareView addGestureRecognizer:recognizer];
        _JSsquareView;
    })];
    [_JSsquareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10.33);
        make.top.equalTo(_scrollView.mas_bottom).with.offset(44);
        make.width.equalTo(self.view).multipliedBy(0.5);
        make.height.equalTo(_JSsquareView.mas_width).with.offset(0);
    }];
    [_JSsquareView addSubview:({
        _JSImageView = [[UIImageView alloc]init];
        _JSImageView.image = [UIImage imageNamed:@"dfskjeiuwe-img"];
        _JSImageView;
    })];
    [_JSImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_JSsquareView.mas_left).with.offset(0);
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    
    //农业
    [self.view addSubview:({
        _NYsquareView = [[UIView alloc]init];
        _NYsquareView.layer.cornerRadius = 15;
        _NYsquareView.backgroundColor = [UIColor whiteColor];
        _NYsquareView.tag = 5;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_turnToDetail:)];
        [_NYsquareView addGestureRecognizer:recognizer];
        _NYsquareView;
    })];
    [_NYsquareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_JSsquareView.mas_right).with.offset(8);
        make.right.equalTo(self.view).with.offset(-10.33);
        make.height.equalTo(_JSsquareView.mas_height).multipliedBy(0.45);
        make.top.equalTo(_JSsquareView.mas_top).with.offset(0);
    }];
    [_NYsquareView addSubview:({
        _NYImageView = [[UIImageView alloc]init];
        _NYImageView.image = [UIImage imageNamed:@"sdjewwe-img"];
        _NYImageView;
    })];
    [_NYImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    
    //招商
    [self.view addSubview:({
        _ZSsquareView = [[UIView alloc]init];
        _ZSsquareView.layer.cornerRadius = 15;
        _ZSsquareView.backgroundColor = [UIColor whiteColor];
        _ZSsquareView.tag = 1;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_turnToDetail:)];
        [_ZSsquareView addGestureRecognizer:recognizer];
        _ZSsquareView;
    })];
    [_ZSsquareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_JSsquareView.mas_right).with.offset(8);
        make.right.equalTo(self.view).with.offset(-10.33);
        make.height.equalTo(_JSsquareView.mas_height).multipliedBy(0.45);
        make.bottom.equalTo(_JSsquareView.mas_bottom).with.offset(0);
    }];
    [_ZSsquareView addSubview:({
        _ZSImageView = [[UIImageView alloc]init];
        _ZSImageView.image = [UIImage imageNamed:@"bvkdfjgr-img"];
        _ZSImageView;
    })];
    [_ZSImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
}
-(void)_turnToDetail:(UITapGestureRecognizer *)sender{
    NSLog(@"%ld",sender.view.tag);
    RealtimeViewController *realtimeVC = [[RealtimeViewController alloc]init];
    realtimeVC.tagNum = [NSString stringWithFormat:@"%ld",sender.view.tag];
    [self.navigationController pushViewController:realtimeVC animated:YES];
}
@end
