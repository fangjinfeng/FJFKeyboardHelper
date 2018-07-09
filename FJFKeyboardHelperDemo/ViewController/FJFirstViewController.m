
//
//  FJSecondViewController.m
//  MOAKeyboardHelper
//
//  Created by fjf on 2018/6/28.
//  Copyright © 2018年 fjf. All rights reserved.
//

// tool
#import "FJFKeyboardHelper.h"
// vc
#import "FJFirstViewController.h"


@implementation FJFirstViewController

#pragma mark -------------------------- Life  Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewControls];
    [self layoutViewControls];
}

#pragma mark -------------------------- Response  Event

- (void)tapGesture:(UITapGestureRecognizer *)recognizer {
    [self.view endEditing:YES];
}

#pragma mark -------------------------- Private Methods
- (void)setupViewControls {
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // 键盘 管理
    [FJFKeyboardHelper handleKeyboardWithContainerView:self.view];
}


- (void)layoutViewControls {
    CGFloat containerViewHeight = 80;
    CGFloat containerViewWidth = [UIScreen mainScreen].bounds.size.width;
    NSInteger containerViewCount = (NSInteger)(self.view.bounds.size.height / containerViewHeight);
    for (NSInteger tmpIndex = 0; tmpIndex < containerViewCount; tmpIndex++) {
        UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, tmpIndex * containerViewHeight, containerViewWidth, containerViewHeight)];
        containerView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [containerView addGestureRecognizer:tapGesture];
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 35, containerViewWidth - 30, 40)];
        textField.borderStyle = UITextBorderStyleLine;
        textField.placeholder = @"请输入提示信息";
        containerView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0f green:arc4random_uniform(256)/256.0f blue:arc4random_uniform(256)/256.0f alpha:1.0f];
        [containerView addSubview:textField];
        [self.view addSubview:containerView];
        
    }
}

@end
