//
//  UIResponder+FirstResponder.m
//  MOAKeyboardHelper
//
//  Created by fjf on 2018/6/25.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import "UIResponder+FJFKeyboardFirstResponder.h"

static __weak id currentFirstResponder;

@implementation UIResponder (FJFKeyboardFirstResponder)
+ (id)fjf_keyboardCurrentFirstResponder {
    currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(fjf_findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}

- (void)fjf_findFirstResponder:(id)sender {
    currentFirstResponder = self;
}
@end
