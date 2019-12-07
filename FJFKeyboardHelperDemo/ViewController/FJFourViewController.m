//
//  FJFourViewController.m
//  FJFKeyboardHelperDemo
//
//  Created by 方金峰 on 2019/4/26.
//  Copyright © 2019 fjf. All rights reserved.
//

// tool
#import "FJFKeyboardHelper.h"
#import "FJFourViewController.h"

@interface FJFourViewController ()

@end

@implementation FJFourViewController

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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
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
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 320,
                                                                           100, 40)];
    textField.borderStyle = UITextBorderStyleLine;
    textField.placeholder = @"请输入提示信息";
    [self.view addSubview:textField];
    
    UITextField *secondTextField = [[UITextField alloc] initWithFrame:CGRectMake(150, 320,
                                                                           100, 40)];
    secondTextField.borderStyle = UITextBorderStyleLine;
    secondTextField.placeholder = @"请输入提示信息";
    [self.view addSubview:secondTextField];
    
    UITextField *threeTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 350,
                                                                           100, 40)];
    threeTextField.borderStyle = UITextBorderStyleLine;
    threeTextField.placeholder = @"请输入提示信息";
    [self.view addSubview:threeTextField];
    
    UITextField *fourTextField = [[UITextField alloc] initWithFrame:CGRectMake(150, 350,
                                                                                 100, 40)];
    fourTextField.borderStyle = UITextBorderStyleLine;
    fourTextField.placeholder = @"请输入提示信息";
    [self.view addSubview:fourTextField];
}

@end
