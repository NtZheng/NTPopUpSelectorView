//
//  ViewController.m
//  NTPopUpSelectorView
//
//  Created by Nineteen on 9/13/16.
//  Copyright © 2016 Nineteen. All rights reserved.
//

#import "ViewController.h"
#import "NTPopUpSelectorView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NTPopUpSelectorView *view = [NTPopUpSelectorView popUpSelectorViewWithbubbleFrame:CGRectMake(100, 100, 100, 200) clickOption:^(NSIndexPath *indexPath) {
        
    } clickMask:^{
        
    }];
    [view addOptionWihtText:@"你好" andImage:@"1"];
    [view addOptionWihtText:@"你不好吗" andImage:@"2"];
    [view addOptionWihtText:@"你很好" andImage:@"3"];
    view.frame = self.view.bounds;
    [self.view addSubview:view];
    
    
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"你好";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"1");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"222");
}

@end
