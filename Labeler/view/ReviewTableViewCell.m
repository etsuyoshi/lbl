//
//  ReviewTableViewCell.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/29.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "ReviewTableViewCell.h"

@implementation ReviewTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.lblTitle.font = [UIFont fontHirakakuWithSize:13.f];
    
    self.lblExplain.font = [UIFont fontHirakaku3WithSize:10.f];
    
//    self.lblExplain.numberOfLines = 5;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
