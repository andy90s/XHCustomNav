//
//  XHHeadView.h
//  XHCustomNav
//
//  Created by liangxianhua on 16/6/6.
//  Copyright © 2016年 xhliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXBlurView.h"

@interface XHHeadView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *backImgView;

@property (weak, nonatomic) IBOutlet FXBlurView *blurView;

@property (weak, nonatomic) IBOutlet UIView *navView;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;

@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UIImageView *headImg;


@property (nonatomic,strong) MASConstraint *masConstraintHeadViewH;

@property (nonatomic,strong) MASConstraint *masConstraintImgSize;//头像大小

@property (nonatomic,strong) MASConstraint *masConstraintTop;//头像距离左边距离

@property (nonatomic,strong) MASConstraint *masConstraintLeft;//头像距离右边间距

+(XHHeadView *)initView;

@end
