//
//  UIView+KeyboardHandle.m
//  YSTextInputKeyboardCategory
//
//  Created by fjf on 2018/6/1.
//  Copyright © 2018年 youngsoft. All rights reserved.
//

#import <objc/runtime.h>
#import "FJFKeyboardHelper.h"
#import "UIView+FJFKeyboardHelper.h"

static void *kFJFKeyboardHelperKey = &kFJFKeyboardHelperKey;

@implementation UIView (FJFKeyboardHelper)

- (void)fjf_setKeyboardHelper:(FJFKeyboardHelper *)keyboardHelper {
    objc_setAssociatedObject(self, kFJFKeyboardHelperKey, keyboardHelper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FJFKeyboardHelper *)fjf_getKeyboardHelper {
    return objc_getAssociatedObject(self, kFJFKeyboardHelperKey);
}

- (void)fjf_removeKeyboardHelper {
    objc_setAssociatedObject(self, kFJFKeyboardHelperKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
