//
//  LeftArrowTableViewCell.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/21.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "LeftArrowTableViewCell.h"

@implementation LeftArrowTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.lblItemName.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:17.f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
