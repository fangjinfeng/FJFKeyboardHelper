//
//  UITableViewCell+Creation.m
//  MicroShopMerchant
//
//  Created by fjf on 2017/11/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UITableViewCell+Creation.h"

@implementation UITableViewCell (Creation)

+ (__kindof UITableViewCell *)qn_systemTableViewCellWithTableView:(UITableView *)tableView {
    NSString *identifierId = NSStringFromClass([self class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[[self class] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

+ (__kindof UITableViewCell *)qn_nibTableViewCellWithTableView:(UITableView *)tableView {
    NSString *identifierId = NSStringFromClass([self class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:identifierId owner:self options:nil].lastObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
