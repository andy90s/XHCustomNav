//
//  XHMainViewController.m
//  XHCustomNav
//
//  Created by liangxianhua on 16/6/6.
//  Copyright © 2016年 xhliang. All rights reserved.
//

#import "XHMainViewController.h"
#import "XHCustomNavView.h"
#import "XHTableView.h"

@interface XHMainViewController ()

@end

@implementation XHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    XHCustomNavView *xview = [XHCustomNavView initViewWithHeadView:nil headViewH:0 frame:self.view.bounds tableView:[XHTableView initView]];
    [self.view addSubview:xview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
