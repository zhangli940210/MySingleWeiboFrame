//
//  ViewController.m
//  自定义不等高的cell-frame方式
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "ViewController.h"
#import "XMGStatus.h"
#import "XMGStatusCell.h"
#import "MJExtension.h"

@interface ViewController ()

/** 模型数组*/
@property (nonatomic, strong) NSArray *statuses;
@end

@implementation ViewController

#pragma mark - 懒加载数据
- (NSArray *)statuses
{
    if (_statuses == nil) {
        _statuses = [XMGStatus mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _statuses;
}

NSString *ID = @"status";
- (void)viewDidLoad {
    [super viewDidLoad];
    // 注册方法
    [self.tableView registerClass:[XMGStatusCell class] forCellReuseIdentifier:ID];
}

#pragma mark - UITableViewDataSource方法

/**
 *  返回多少组
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/**
 * 每组返回多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

// 返回每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGStatus *status = self.statuses[indexPath.row];
    return status.cellHeight;
}
/**
 * 每行显示什么内容
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 去缓存池里面找
    XMGStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 赋值
    cell.status = self.statuses[indexPath.row];
    return cell;
}



@end
