//
//  UITableViewCell+Creation.h
//  MicroShopMerchant
//
//  Created by fjf on 2017/11/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Creation)

// xib tableViewCell
+ (UITableViewCell *)qn_nibTableViewCellWithTableView:(UITableView *)tableView;

// 手写 tableViewCell
+ (UITableViewCell *)qn_systemTableViewCellWithTableView:(UITableView *)tableView;

@end
