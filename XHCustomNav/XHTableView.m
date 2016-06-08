//
//  XHTableView.m
//  XHCustomNav
//
//  Created by liangxianhua on 16/6/7.
//  Copyright © 2016年 xhliang. All rights reserved.
//

#import "XHTableView.h"
#define CellId @"xhliang"

@interface XHTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation XHTableView

+(XHTableView *)initView
{
    XHTableView *tableView = [[XHTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = tableView;
    tableView.dataSource = tableView;
    tableView.backgroundColor = [UIColor clearColor];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellId];
    return tableView;
}

#pragma mark - 
#pragma mark - delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId forIndexPath:indexPath];
    cell.textLabel.text = @"啊麻里麻里红";
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.f;
}

//设置滚动到某个距离不继续滚动 此处为50
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.y<-TableViewContentInsetH - 50 ){
        [scrollView setContentOffset:CGPointMake(0, -TableViewContentInsetH - 50)];
    }
    
}
@end
