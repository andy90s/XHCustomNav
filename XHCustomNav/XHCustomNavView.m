//
//  XHCustomNavView.m
//  XHCustomNav
//
//  Created by liangxianhua on 16/6/6.
//  Copyright © 2016年 xhliang. All rights reserved.
//

#import "XHCustomNavView.h"
#import "FXBlurView.h"
#import "XHHeadView.h"
#import "XHTableView.h"

@interface XHCustomNavView()

@property (nonatomic,strong) XHHeadView *headView;

@property (nonatomic,strong) XHTableView *myTableView;

//@property (nonatomic,strong) MASConstraint *masConstraintHeadViewH;
//
//@property (nonatomic,strong) MASConstraint *masConstraintImgSize;//头像大小
//
//@property (nonatomic,strong) MASConstraint *masConstraintTop;//头像距离左边距离
//
//@property (nonatomic,strong) MASConstraint *masConstraintLeft;//头像距离右边间距


@end

@implementation XHCustomNavView

static void *VorizontalScrollContext = &VorizontalScrollContext;

+(XHCustomNavView *)initViewWithHeadView:(UIView *)headView headViewH:(CGFloat)headViewH frame:(CGRect)frame tableView:(UITableView *)tableView
{
    XHCustomNavView *customView = [[XHCustomNavView alloc]initWithFrame:frame];

    [customView prepareForHeadView];//头视图
    
    [customView prepareForTableView];//tableView

    return customView;
}

#pragma mark -
#pragma mark - lazy


#pragma mark -
#pragma mark - prepare
-(void)prepareForHeadView
{
    self.headView = [XHHeadView initView];
    self.headView.frame = CGRectMake(0, 0, self.frame.size.width, HeadViewHeight);
    [self addSubview:_headView];
}

-(void)prepareForTableView
{
    self.myTableView = [XHTableView initView];
    self.myTableView.frame = CGRectMake(0, NavHeight, self.frame.size.width, self.frame.size.height - NavHeight);
    [self.myTableView setContentInset:UIEdgeInsetsMake(HeadViewHeight - NavHeight, 0.f, _myTableView.contentInset.bottom, 0.f)];
    self.myTableView.showsVerticalScrollIndicator = NO;
    self.myTableView.alwaysBounceVertical = YES;
    //kvo
    [_myTableView addObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) options:NSKeyValueObservingOptionNew context:&VorizontalScrollContext];
    
    [self addSubview:self.myTableView];
    self.myTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    
    if ([keyPath isEqualToString:@"contentOffset"]&&context == &VorizontalScrollContext) {
        CGFloat oldOffsetY = [change[NSKeyValueChangeOldKey] CGPointValue].y;
        CGFloat newOffsetY = [change[NSKeyValueChangeNewKey] CGPointValue].y;
        CGFloat changeY = newOffsetY - oldOffsetY;
        //从初始位置到滚动到导航下面比例 0~1
        CGFloat scale = (newOffsetY + TableViewContentInsetH)/TableViewContentInsetH;
        //这里我使用了固定值 尝试了多种方法 不完美 以后想到好办法再做修改
        if (scale >= 0 && scale <= 1) {

            //对于头像的处理如果你有好的解决办法 还请告诉我 跪谢！
            //此处为方法1:改变Frame 失败不知原因会有BUG
            //            CGRect frame = self.headView.headImg.frame;
            //            NSLog(@"---->%f",frame.origin.x);
            //            frame.origin.x = 127 - 10 * scale;
            //            frame.origin.y = 105 - (105 - 30) *scale;
            //            frame.size.width = 80 - 50 * scale;
            //            frame.size.height = 80 - 50 * scale;
            //            _headView.headImg.layer.masksToBounds = YES;
            //            _headView.headImg.layer.cornerRadius = _headView.headImg.frame.size.width/2;
            //            self.headView.headImg.frame = frame;
            
            
            
            //此处为方法2:通过变形移动 失败不知原因会有BUG
            //            CGFloat imgScale = 1 - scale/3;
            //            CGAffineTransform t = CGAffineTransformMakeTranslation( - 15 * scale, - (105 - 30) *scale);
            //            self.headView.headImg.transform = CGAffineTransformScale(t,imgScale, imgScale);
            
            
            //此处方法3;约束
            self.headView.masConstraintTop.offset(100 - 73*scale);
            self.headView.masConstraintImgSize.offset(80 - 50 * scale);
            self.headView.masConstraintLeft.offset((kScreenSize.width - 80)/2 - 20 * scale);
        }
        //模糊视图透明度
        self.headView.blurView.alpha = (50 - (-newOffsetY - TableViewContentInsetH))/50;
        //导航视图颜色
        self.headView.navView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:(newOffsetY + TableViewContentInsetH)/TableViewContentInsetH];
        if (HeadViewHeight + (-newOffsetY - TableViewContentInsetH) > 0) {
            //头视图高
            self.headView.masConstraintHeadViewH.mas_offset(HeadViewHeight + (-newOffsetY - TableViewContentInsetH));
        }
    }
}


@end
