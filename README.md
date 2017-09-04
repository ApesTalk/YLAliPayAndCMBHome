# YLAliPayAndCMBHome
仿支付宝首页效果(UIScrollView嵌入UITableView)和招商银行客户端首页效果。

这里简单说一下实现思路：

## 一、支付宝首页效果

UIScrollView嵌套UITableView：

1.UIScrollView上面放一个UIView作为头部，下面放一个UITableView。

2.设置UITableView不能滚动。

3.设置UIScrollView的scrollIndicatorInsets从UITableView的头部开始显示进度条。

4.通过KVO监听到UITableView的contentSize属性改变时，修改UITableView的frame.size.height为contentSize.height，
  修改UIScrollView的contentSize的高度为头部UIView的高度+UITableView的高度。
  
  ```OBJC
  CGRect tFrame = self.table.frame;
  tFrame.size.height = MAX(self.table.contentSize.height, kFrameHeight);
  self.table.frame = tFrame;
  self.mainScrollView.contentSize = CGSizeMake(0, tFrame.size.height + _topViewHeight);
  ```
  
5.在``scrollViewDidScroll:``中检测下拉的时候修改顶部视图的y=UIScrollView的偏移量，保持头部贴在顶部。修改UITableView的y和contentOffset：

  ```OBJC
  if (offsetY <= 0.0) {
        //下拉
        CGRect frame = self.topView.frame;
        frame.origin.y = offsetY;
        self.topView.frame = frame;
        
        CGRect tFrame = self.table.frame;
        tFrame.origin.y = offsetY + _topViewHeight;
        self.table.frame = tFrame;
        if (![self.table.mj_header isRefreshing]) {
            self.table.contentOffset = CGPointMake(0, offsetY);
        }
    }
  ```
  
6.在``- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)``中根据偏移量判断是否该下拉刷新了。


但是需要注意：

**嵌套之后UITableViewCell就不能实现重用了，因为UITableView保持着frame.size.height = contentSize.height。

因此：这种效果只适合Cell数量比较少，没有上拉加载更多的情况。如果Cell数量较多，不建议使用这种效果。（支付宝首页的Cell数量就不多）**


## 二、招商银行首页

一个UITableView就可以实现，只需要在滚动的时候根据偏移量来控制导航的背景色和透明度即可。


## 效果图

![](https://github.com/lqcjdx/YLAliPayAndCMBHome/blob/master/YLAliPayAndCMBHome/alipay.gif)
