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
    
    NTPopUpSelectorView *view = [NTPopUpSelectorView popUpSelectorViewWithbubbleFrame:CGRectMake(100, 100, 100, 200) clickOption:^(NSIndexPath *indexPath) {
        if (indexPath.row == 0) {
            NSLog(@"1");
        } else if (indexPath.row == 1) {
            NSLog(@"2");
        } else if (indexPath.row == 2) {
            NSLog(@"3");
        }
    } clickMask:^{
        
    }];
    
    [view addOptionWihtText:@"你好" andImage:nil];
    [view addOptionWihtText:@"你不好吗" andImage:nil];
    [view addOptionWihtText:@"你很好" andImage:nil];
    
    [view showSelectorViewWithAnimationInView:self.view frame:self.view.bounds];
}

@end
