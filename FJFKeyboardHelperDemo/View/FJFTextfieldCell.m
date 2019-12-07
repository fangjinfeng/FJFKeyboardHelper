
//
//  FJFTextfieldCell.m
//  YSTextInputKeyboardCategory
//
//  Created by fjf on 2018/6/1.
//  Copyright © 2018年 youngsoft. All rights reserved.
//

#import "FJFTextfieldCell.h"

@implementation FJFTextfieldCell

#pragma mark -------------------------- Life Circle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCellControls];
        [self layoutCellSubControls];
    }
    return self;
}

#pragma mark -------------------------- Public Methods
+ (CGFloat)defaultCellHeight {
    return 150.0f;
}

#pragma mark -------------------------- Private Methods

- (void)setupCellControls {
    [self addSubview:self.textField];
}

- (void)layoutCellSubControls {
    self.textField.frame = CGRectMake(12, 12, [UIScreen mainScreen].bounds.size.width - 24,  40);
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(self.textField.frame) + 5, self.textField.frame.size.width, self.textField.frame.size.height)];
    textField.borderStyle = UITextBorderStyleLine;
    textField.placeholder = @"请输入提示信息";
    [self addSubview:textField];
}

#pragma mark -------------------------- Setter /  Getter

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.borderStyle = UITextBorderStyleLine;
        _textField.placeholder = @"请输入提示信息";
    }
    return _textField;
}
@end
