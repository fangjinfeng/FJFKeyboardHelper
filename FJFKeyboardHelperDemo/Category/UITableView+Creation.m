

//
//  UITableView+Creation.m
//  MOAKeyboardHelper
//
//  Created by fjf on 2018/6/28.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import "UITableView+Creation.h"

@implementation UITableView (Creation)

// plain tableView
+ (UITableView *)moa_plainTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // tableView 偏移20/64适配
    if (@available(iOS 11.0, *)) {
        //UIScrollView也适用
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    return tableView;
}


// group tableView
+ (UITableView *)moa_groupedTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // tableView 偏移20/64适配
    if (@available(iOS 11.0, *)) {
        //UIScrollView也适用
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    return tableView;
}
@end
