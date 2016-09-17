//
//  NTPopUpSelectorView.h
//  NTPopUpSelectorView
//
//  Created by Nineteen on 9/13/16.
//  Copyright © 2016 Nineteen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NTPopUpSelectorView;

typedef void(^ClickOptionBlock)(NSIndexPath *indexPath, NTPopUpSelectorView *popUpSelectorView);
typedef void(^ClickMaskBlock)(NTPopUpSelectorView *popUpSelectorView);

@interface NTPopUpSelectorView : UIView

/**
 *  
 *  NTPopUpSelectorView
 *
 *  @param frame                selector的frame
 *  @param clickOptionBlock     点击selector中选线执行的操作
 *  @param clickMaskBlock       点击mask时所执行的操作
 *  @param return               返回本类对象
 *
 */
+ (NTPopUpSelectorView *)popUpSelectorViewWithbubbleFrame :(CGRect)frame clickOption:(ClickOptionBlock)clickOptionBlock clickMask:(ClickMaskBlock)clickMaskBlock;

/**
 *
 *  Add option
 *
 *  @param text                 添加的选项的名字
 *
 */
- (void)addOptionWihtText :(NSString *)text;

/**
 *
 *  Show operation
 *
 *  @param view                 父视图
 *  @param frame                在父视图中的位置
 *
 */
- (void)showSelectorViewWithAnimationInView :(UIView *)view frame :(CGRect)frame;

/**
 *
 *  Remove from superView
 *
 */
- (void)removeFromSuperViewWithAnimation;

@end
