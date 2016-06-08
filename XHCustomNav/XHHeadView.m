//
//  XHHeadView.m
//  XHCustomNav
//
//  Created by liangxianhua on 16/6/6.
//  Copyright © 2016年 xhliang. All rights reserved.
//

#import "XHHeadView.h"

@interface XHHeadView()

@end

@implementation XHHeadView

+(XHHeadView *)initView
{
    XHHeadView *head = [[NSBundle mainBundle] loadNibNamed:@"XHHeadView" owner:self options:nil][0];
    //只改变nav的透明度
    head.navView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.0];
    //模糊
    UIImage *image = [[UIImage imageNamed:@"dff854261838453d355b5bbefb0bbcfc"] circleImage];
    head.headImg.image = image;
    head.blurView.blurRadius = BlurRadius;
    [head setMasonry];
    return head;
}


-(void)setMasonry
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(kScreenSize.width);
        _masConstraintHeadViewH = make.height.equalTo(@(HeadViewHeight));
    }];
    //backImg
    [self.backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.right.bottom.equalTo(self);
    }];
    
    //blurView
    [self.blurView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self);
        //make.height.equalTo(@(HeadViewHeight));
    }];
    
    //nav
    [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_offset(NavHeight);
    }];
    
    //left button
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_offset(35);
        make.left.equalTo(self.navView).mas_offset(10);
        make.top.equalTo(self.navView).mas_offset(30);
    }];
    
    //right button
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_offset(35);
        make.centerY.equalTo(self.leftBtn);
        make.right.equalTo(self.navView).mas_offset(-10);
    }];
    
    //titlelab
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.leftBtn);
        make.centerX.equalTo(self);
        make.height.mas_offset(30);
    }];
    //头像
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        self.masConstraintTop = make.top.equalTo(self).offset(100);
        self.masConstraintImgSize = make.width.height.equalTo(@(80));
        self.masConstraintLeft = make.left.equalTo(self).offset((kScreenSize.width - 80)/2);
    }];
}
@end
