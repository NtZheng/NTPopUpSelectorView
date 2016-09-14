//
//  NTPopUpSelectorTableViewCell.m
//  NTPopUpSelectorView
//
//  Created by Nineteen on 9/14/16.
//  Copyright © 2016 Nineteen. All rights reserved.
//

#import "NTPopUpSelectorTableViewCell.h"

@implementation NTPopUpSelectorTableViewCell

+ (NTPopUpSelectorTableViewCell *)popUpSelectorTableViewCellWithRowHeight :(CGFloat) height style :(UITableViewCellStyle)style reuseIdentifier :(NSString *)reuseIdentifier isLastOne :(BOOL)isLastOne{
    NTPopUpSelectorTableViewCell *cell = [[self alloc]initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    if (isLastOne) {
        
    } else {
        UIView *bottomLineView = [[UIView alloc]initWithFrame:CGRectMake(0, height - 1, cell.bounds.size.width, 1)];
        bottomLineView.backgroundColor = [UIColor grayColor];
        [cell addSubview:bottomLineView];
    }
    return cell;
}

@end
