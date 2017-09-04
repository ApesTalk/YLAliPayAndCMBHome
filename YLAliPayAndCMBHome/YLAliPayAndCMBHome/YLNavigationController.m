//
//  YLNavigationController.m
//  YLAlipayHome
//
//  Created by Lambert on 2017/8/1.
//  Copyright © 2017年 YL. All rights reserved.
//

#import "YLNavigationController.h"
#import "UINavigationBar+Awesome.h"

@interface YLNavigationController ()

@end

@implementation YLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationBar lt_setBackgroundColor:[UIColor colorWithRed:0.02 green:0.38 blue:0.83 alpha:1.00]];
    [self.navigationBar setShadowImage:[UIImage new]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
