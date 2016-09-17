//
//  NTPopUpSelectorView.m
//  NTPopUpSelectorView
//
//  Created by Nineteen on 9/13/16.
//  Copyright © 2016 Nineteen. All rights reserved.
//

#import "NTPopUpSelectorView.h"
#import "NTPopUpSelectorTableViewCell.h"

#define NTPopUpSelectorViewImageName @"popUpSelectorView"
#define NTPopUpSelectorViewOptionText @"text"
#define NTArrowAndTotalRate 0.11

@interface NTPopUpSelectorView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImageView *bubbleImageView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) ClickOptionBlock clickOptionBlock;
@property (nonatomic, copy) ClickMaskBlock clickMaskBlock;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation NTPopUpSelectorView

{
    CGRect bubbleFrame;
}

- (instancetype)initWithBubbleFrame :(CGRect)frame {
    if (self = [super init]) {
        bubbleFrame = frame;
        self.clipsToBounds = YES;
        // 注意添加顺序
        [self addSubview:self.maskView];
        [self addSubview:self.bubbleImageView];
    }
    return self;
}

#pragma mark - 懒加载
- (UIView *)maskView {
    if (_maskView == nil) {
        _maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _maskView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickMaskAction:)];
        [_maskView addGestureRecognizer:tap];
    }
    return _maskView;
}

- (UIImageView *)bubbleImageView {
    if (_bubbleImageView == nil) {
        _bubbleImageView = [[UIImageView alloc]initWithFrame:bubbleFrame];
        _bubbleImageView.image = [UIImage imageNamed:NTPopUpSelectorViewImageName];
        [_bubbleImageView addSubview:self.tableView];
        _bubbleImageView.clipsToBounds = YES;
        _bubbleImageView.userInteractionEnabled = YES;
    }
    return _bubbleImageView;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NTArrowAndTotalRate * bubbleFrame.size.height, bubbleFrame.size.width, bubbleFrame.size.height - NTArrowAndTotalRate * bubbleFrame.size.height) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

#pragma mark - dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NTPopUpSelectorTableViewCell *cell;
    if (indexPath.row == (self.dataArray.count - 1)) {
        cell = [NTPopUpSelectorTableViewCell popUpSelectorTableViewCellWithRowHeight:(bubbleFrame.size.height - bubbleFrame.size.height * NTArrowAndTotalRate) / self.dataArray.count style:UITableViewCellStyleDefault reuseIdentifier:nil isLastOne:YES];
    } else {
        cell = [NTPopUpSelectorTableViewCell popUpSelectorTableViewCellWithRowHeight:(bubbleFrame.size.height - bubbleFrame.size.height * NTArrowAndTotalRate) / self.dataArray.count style:UITableViewCellStyleDefault reuseIdentifier:nil isLastOne:NO];
    }
    NSMutableDictionary *data = self.dataArray[indexPath.row];
    cell.textLabel.text = data[NTPopUpSelectorViewOptionText];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.clickOptionBlock(indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (bubbleFrame.size.height - bubbleFrame.size.height * NTArrowAndTotalRate) / self.dataArray.count;
}

#pragma mark - methods
- (void)clickMaskAction: (UIView *)maskView {
    self.clickMaskBlock();
}

#pragma mark - API
+ (NTPopUpSelectorView *)popUpSelectorViewWithbubbleFrame :(CGRect)frame clickOption:(ClickOptionBlock)clickOptionBlock clickMask:(ClickMaskBlock)clickMaskBlock {
    NTPopUpSelectorView *popUpSelectorView = [[self alloc] initWithBubbleFrame:frame];// 调用自身的init方法做初始化
    
    popUpSelectorView.clickOptionBlock = clickOptionBlock;
    popUpSelectorView.clickMaskBlock = clickMaskBlock;
    
    return popUpSelectorView;
}

- (void)addOptionWihtText :(NSString *)text {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NTPopUpSelectorViewOptionText] = text;
    [self.dataArray addObject:dic];
}

- (void)showSelectorViewWithAnimationInView :(UIView *)view frame :(CGRect)frame {
    self.bubbleImageView.frame = CGRectMake(bubbleFrame.origin.x, bubbleFrame.origin.y, 0, 0);
    self.bubbleImageView.layer.position = CGPointMake(bubbleFrame.origin.x + bubbleFrame.size.width, bubbleFrame.origin.y);
    self.bubbleImageView.layer.anchorPoint = CGPointMake(1, 0);
    self.maskView.alpha = 0;
    [UIView animateWithDuration:0.25f animations:^{
        self.bubbleImageView.frame = bubbleFrame;
        self.maskView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
    self.frame = frame;
    [view addSubview:self];
}

- (void)removeFromSuperViewWithAnimation {
    [UIView animateWithDuration:0.25f animations:^{
        self.maskView.alpha = 0;
        self.bubbleImageView.frame = CGRectMake(bubbleFrame.origin.x + bubbleFrame.size.width, bubbleFrame.origin.y, 0, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
