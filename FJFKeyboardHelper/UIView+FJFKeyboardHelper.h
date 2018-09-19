//
//  UIView+KeyboardHandle.h
//  YSTextInputKeyboardCategory
//
//  Created by fjf on 2018/6/1.
//  Copyright © 2018年 youngsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FJFKeyboardHelper;
@interface UIView (FJFKeyboardHelper)
// 移除 键盘 管理器
- (void)fjf_removeKeyboardHelper;

// 获取 键盘 管理器
- (FJFKeyboardHelper *)fjf_getKeyboardHelper;

// 关联 键盘 管理器
- (void)fjf_setKeyboardHelper:(FJFKeyboardHelper *)keyboardHelper;
@end
