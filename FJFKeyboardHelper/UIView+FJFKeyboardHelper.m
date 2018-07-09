//
//  UIView+KeyboardHandle.m
//  YSTextInputKeyboardCategory
//
//  Created by fjf on 2018/6/1.
//  Copyright © 2018年 youngsoft. All rights reserved.
//

#import <objc/runtime.h>
#import "FJFKeyboardHelper.h"
#import "UIView+KeyboardHelper.h"

@implementation UIView (FJFKeyboardHelper)
- (void)moa_setkeyboardHelper:(FJFKeyboardHelper *)keyboardHelper {
    objc_setAssociatedObject(self, &keyboardHelper, keyboardHelper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
