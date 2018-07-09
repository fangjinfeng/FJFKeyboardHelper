//
//  FJFirstViewController.m
//  YSTextInputKeyboardCategory
//
//  Created by fjf on 2018/6/1.
//  Copyright © 2018年 youngsoft. All rights reserved.
//
// tool
#import "FJFKeyboardHelper.h"
// cell
#import "FJFTextfieldCell.h"
// vc
#import "FJSecondViewController.h"
// category
#import "UITableViewCell+Creation.h"

@interface FJSecondViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FJSecondViewController

#pragma mark -------------------------- Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewControls];
}

#pragma mark -------------------------- System Delegate

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 111;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FJFTextfieldCell *cell = (FJFTextfieldCell *)[FJFTextfieldCell qn_systemTableViewCellWithTableView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [FJFTextfieldCell defaultCellHeight];
}

#pragma mark -------------------------- Private Methods

- (void)setupViewControls {
    [self.view addSubview:self.tableView];
    
    [FJFKeyboardHelper handleKeyboardWithScrollView:self.tableView];
}

#pragma mark -------------------------- Getter / Setter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _tableView;
}
@end
