//
//  YLCMBHomeVController.m
//  YLAliPayAndCMBHome
//
//  Created by Lambert on 2017/8/7.
//  Copyright © 2017年 YL. All rights reserved.
//

#import "YLCMBHomeVController.h"
#import "UINavigationBar+Awesome.h"
#import "MJRefresh.h"
#import "YLDetailViewController.h"

#define kNavigationBarHeight 64
#define kFrameWidth [UIScreen mainScreen].bounds.size.width
#define kFrameHeight [UIScreen mainScreen].bounds.size.height
#define kTabBarHeight 49

#define kNavColor [UIColor colorWithRed:0.02 green:0.38 blue:0.83 alpha:1.00]
#define kNavGreyColor [UIColor lightGrayColor]

@interface YLCMBHomeVController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic,assign)CGFloat topViewHeight;
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,assign)CGFloat alpha;

@end

@implementation YLCMBHomeVController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    _topViewHeight = 200;
    _alpha = 0.0;
    [self.view addSubview:self.table];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar lt_setBackgroundColor:[kNavColor colorWithAlphaComponent:_alpha > 0 ? _alpha : 0.5]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController.navigationBar lt_setBackgroundColor:[kNavColor colorWithAlphaComponent:_alpha]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if(!self.presentedViewController){
        [self.navigationController.navigationBar lt_setBackgroundColor:kNavColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)topView
{
    if(!_topView){
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kFrameWidth, _topViewHeight)];
        _topView.backgroundColor = [UIColor brownColor];
    }
    return _topView;
}

- (UITableView *)table
{
    if(!_table){
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kFrameWidth, kFrameHeight - kTabBarHeight) style:UITableViewStylePlain];
        _table.dataSource = self;
        _table.delegate = self;
        _table.backgroundColor = [UIColor clearColor];
        _table.tableHeaderView = self.topView;
        _table.tableFooterView = [UIView new];
        MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc]init];
        [header setRefreshingTarget:self refreshingAction:@selector(refresh)];
        _table.mj_header = header;
    }
    return _table;
}

#pragma mark---UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        //you can see the cell is reused
        NSLog(@"create new cell");
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%li", indexPath.row];
    return cell;
}

#pragma mark---UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YLDetailViewController *vc = [[YLDetailViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark---UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    _alpha = 0.0;
    NSLog(@"%f",offsetY);
    if (offsetY <= 0.0) {
        //下拉
        _alpha = _topViewHeight > 0 ? 0.0 : 1.0;
        if(_topViewHeight > 0){
            if(offsetY >= -kNavigationBarHeight){
                _alpha = ABS(offsetY) / kNavigationBarHeight;
            }else{
                _alpha = 1.0;
            }
        }
        self.table.mj_header.hidden = _topViewHeight > 0 ? offsetY > -kNavigationBarHeight - 15 : NO;
        [self.navigationController.navigationBar lt_setBackgroundColor:[kNavGreyColor colorWithAlphaComponent:_alpha]];
    }else{
        if(_topViewHeight > kNavigationBarHeight){
            _alpha = MIN(1.0, offsetY / (_topViewHeight - kNavigationBarHeight));
        }else{
            _alpha = 1.0;
        }
        [self.navigationController.navigationBar lt_setBackgroundColor:[kNavColor colorWithAlphaComponent:_alpha]];
    }
}

#pragma mark---other methods
- (void)refresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.table.mj_header endRefreshing];
        [self.table setContentOffset:CGPointZero];
    });
}

@end
