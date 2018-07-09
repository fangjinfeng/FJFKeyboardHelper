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
- (void)moa_setkeyboardHelper:(FJFKeyboardHelper *)keyboardHelper;
@end
