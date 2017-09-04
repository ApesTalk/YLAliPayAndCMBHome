//
//  YLDetailViewController.m
//  YLAlipayHome
//
//  Created by Lambert on 2017/7/31.
//  Copyright © 2017年 YL. All rights reserved.
//

#import "YLDetailViewController.h"
#import "UINavigationBar+Awesome.h"

@interface YLDetailViewController ()

@end

@implementation YLDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情页";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor colorWithRed:0.02 green:0.38 blue:0.83 alpha:1.00]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
