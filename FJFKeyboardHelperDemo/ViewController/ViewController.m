//
//  ViewController.m
//  YSTextInputKeyboardCategory
//
//  Created by apple on 16/1/7.
//  Copyright (c) 2016年 youngsoft. All rights reserved.
//

// vc
#import "ViewController.h"
#import "FJFirstViewController.h"
#import "FJSecondViewController.h"
#import "FJThreeViewController.h"
#import "FJFourViewController.h"

// category
#import "UITableView+Creation.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
// tableView
@property (nonatomic, strong) UITableView *tableView;
// cellNameArray
@property (nonatomic, strong) NSArray <NSString *>*cellNameArray;
@end

@implementation ViewController

#pragma mark -------------------------- Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupViewControls];
    [self layoutViewControls];
    
}

#pragma mark -------------------------- System Delegate

#pragma mark --- UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellNameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.cellNameArray[indexPath.row];
    return cell;
}

#pragma mark --- UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIViewController *tmpVc = nil;
    if (indexPath.row == 0) {
        tmpVc = [[FJFirstViewController alloc] init];
    }
    else if(indexPath.row == 1) {
        tmpVc = [[FJSecondViewController alloc] init];
    }
    else if(indexPath.row == 2){
        tmpVc = [[FJThreeViewController alloc] init];
    }
    else {
        tmpVc = [[FJFourViewController alloc] init];
    }

    [self.navigationController pushViewController:tmpVc animated:YES];

}



#pragma mark -------------------------- Private Methods
- (void)setupViewControls {
    [self.view addSubview:self.tableView];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)layoutViewControls {
    self.tableView.frame = self.view.bounds;
}
#pragma mark -------------------------- Setter / Getter

// tableView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView moa_plainTableView];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return  _tableView;
}

- (NSArray <NSString *>*)cellNameArray {
    if (!_cellNameArray) {
        _cellNameArray = @[@"普通视图", @"tableViewCell", @"复杂视图", @"测试视图"];
    }
    return _cellNameArray;
}

@end
