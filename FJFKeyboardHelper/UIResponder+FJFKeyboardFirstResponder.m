//
//  UIResponder+FirstResponder.m
//  MOAKeyboardHelper
//
//  Created by fjf on 2018/6/25.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import "UIResponder+FirstResponder.h"

static __weak id currentFirstResponder;

@implementation UIResponder (FJFKeyboardFirstResponder)
+ (id)moa_currentFirstResponder {
    currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(moa_findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}

- (void)moa_findFirstResponder:(id)sender {
    currentFirstResponder = self;
}
@end
