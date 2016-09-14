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
        
    } clickMask:^{
        
    }];
    [view addOptionWihtText:@"你好" andImage:nil];
    [view addOptionWihtText:@"你不好吗" andImage:nil];
    [view addOptionWihtText:@"你很好" andImage:nil];
//    view.frame = self.view.bounds;
//    [self.view addSubview:view];
    [view showSelectorViewWithAnimationInView:self.view frame:self.view.bounds];
}

@end
