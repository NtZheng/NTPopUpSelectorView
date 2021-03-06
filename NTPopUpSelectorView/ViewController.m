//
//  ViewController.m
//  NTPopUpSelectorView
//
//  Created by Nineteen on 9/13/16.
//  Copyright © 2016 Nineteen. All rights reserved.
//

#import "ViewController.h"
#import "NTPopUpSelectorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame = CGRectMake(200, 100, 50, 25);
    button.frame = frame;
    [button setTitle:@"测试" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)clickButtonAction {
    
    NTPopUpSelectorView *view = [NTPopUpSelectorView popUpSelectorViewWithbubbleFrame:CGRectMake(145, 130, 100, 160) clickOption:^(NSIndexPath *indexPath, NTPopUpSelectorView *popUpSelectorView) {
        if (indexPath.row == 0) {
            NSLog(@"1");
            [popUpSelectorView removeFromSuperViewWithAnimation];
        } else if (indexPath.row == 1) {
            NSLog(@"2");
        } else if (indexPath.row == 2) {
            NSLog(@"3");
        }
    } clickMask:^(NTPopUpSelectorView *popUpSelectorView){
        [popUpSelectorView removeFromSuperViewWithAnimation];
    }];
    
    [view addOptionWihtText:@"NEU"];
    [view addOptionWihtText:@"Nineteen"];
    [view addOptionWihtText:@"郑祯"];
    
    [view showSelectorViewWithAnimationInView:self.view frame:self.view.bounds];
}

@end
