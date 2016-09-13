//
//  NTPopUpSelectorView.m
//  NTPopUpSelectorView
//
//  Created by Nineteen on 9/13/16.
//  Copyright © 2016 Nineteen. All rights reserved.
//

#import "NTPopUpSelectorView.h"

@interface NTPopUpSelectorView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImageView *bubbleImageView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NTPopUpSelectorView

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - 懒加载
- (UIImageView *)bubbleImageView {
    if (_bubbleImageView == nil) {
        
    }
    return _bubbleImageView;
}

- (UIView *)maskView {
    if (_maskView == nil) {
        
    }
    return _maskView;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 10, 10) style:UITableViewStylePlain];
    }
    return _tableView;
}

#pragma mark - dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"NTPopUpSelectorViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

#pragma mark - delegate



#pragma mark - methods



#pragma mark - API


@end
