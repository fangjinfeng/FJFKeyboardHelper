//
//  MOAKeyboardManager.h
//  FJDesignDemo
//
//  Created by fjf on 2018/6/1.
//  Copyright © 2018年 sangfor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MOAKeyboardManagerBlock) (NSString *notiName, NSDictionary *notiInfo, CGRect keyBoardRect);

// 键盘 管理
@interface FJFKeyboardHelper : NSObject

/**
 处理 scrollView 键盘 遮挡(列表型)

 @param scrollView scrollView
 */
+ (void)handleKeyboardWithScrollView:(UIScrollView *)scrollView;

/**
 处理 containerView 键盘 遮挡
 
 @param containerView 移动的视图
 */
+ (void)handleKeyboardWithContainerView:(UIView *)containerView;

/**
 处理 键盘

 @param showBlock 显示 回调
 @param hideBlock 隐藏 回调
 */
+ (void)handleKeyboardWithShowBlock:(MOAKeyboardManagerBlock)showBlock hideBlock:(MOAKeyboardManagerBlock)hideBlock;


@end
