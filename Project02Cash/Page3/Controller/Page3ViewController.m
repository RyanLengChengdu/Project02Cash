//
//  Page3ViewController.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/29.
//

#import "Page3ViewController.h"

@interface Page3ViewController ()

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
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithRed:31/255.0 green:34/255.0 blue:38/255.0 alpha:1.00]];
}

@end
