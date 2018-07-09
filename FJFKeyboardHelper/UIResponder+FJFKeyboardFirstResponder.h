//
//  UIResponder+FirstResponder.h
//  MOAKeyboardHelper
//
//  Created by fjf on 2018/6/25.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (FJFKeyboardFirstResponder)
+ (id)moa_currentFirstResponder;
@end
