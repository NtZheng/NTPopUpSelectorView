//
//  NTPopUpSelectorTableViewCell.h
//  NTPopUpSelectorView
//
//  Created by Nineteen on 9/14/16.
//  Copyright © 2016 Nineteen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTPopUpSelectorTableViewCell : UITableViewCell

+ (NTPopUpSelectorTableViewCell *)popUpSelectorTableViewCellWithRowHeight :(CGFloat) height style :(UITableViewCellStyle)style reuseIdentifier :(NSString *)reuseIdentifier isLastOne :(BOOL)isLastOne;

@end
