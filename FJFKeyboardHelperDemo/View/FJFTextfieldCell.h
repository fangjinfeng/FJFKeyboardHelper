//
//  FJFTextfieldCell.h
//  YSTextInputKeyboardCategory
//
//  Created by fjf on 2018/6/1.
//  Copyright © 2018年 youngsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJFTextfieldCell : UITableViewCell
// textField
@property (nonatomic, strong) UITextField *textField;

+ (CGFloat)defaultCellHeight;
@end
