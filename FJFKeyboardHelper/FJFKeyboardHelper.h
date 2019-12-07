//
//  MOAKeyboardManager.h
//  FJDesignDemo
//
//  Created by fjf on 2018/6/1.
//  Copyright © 2018年 sangfor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FJFKeyboardManagerBlock) (NSString *notiName, NSDictionary *notiInfo, CGRect keyBoardRect);


// 键盘 管理
@interface FJFKeyboardHelper : NSObject

// responseTapGesture (默认为YES)
@property (nonatomic, assign, getter=isResponseTapGesture) BOOL  responseTapGesture;

/**
 移除 键盘 管理器
 */
- (void)removeKeyboardHelper;

/**
 更新 键盘 和 响应者 间距

 @param spacing 键盘 和 响应者 间距(默认0.5)
 */
- (void)updateKeyboardTofirstResponderSpacing:(CGFloat)spacing;

/**
 处理 containerView 键盘 遮挡
 
 @param containerView 需要移动的视图
 */
+ (FJFKeyboardHelper *)handleKeyboardWithContainerView:(UIView *)containerView;


/**
 处理 scrollView 键盘 遮挡(列表型)

 @param scrollView scrollView
 */
+ (FJFKeyboardHelper *)handleKeyboardWithScrollView:(UIScrollView *)scrollView;


/**
 处理 键盘

 @param showBlock 显示 回调
 @param hideBlock 隐藏 回调
 */
+ (FJFKeyboardHelper *)handleKeyboardWithShowBlock:(FJFKeyboardManagerBlock)showBlock hideBlock:(FJFKeyboardManagerBlock)hideBlock;


@end
