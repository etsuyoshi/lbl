//
//  RightIconTableViewCell.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/20.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "RightIconTableViewCell.h"

@implementation RightIconTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.imvFace.layer.cornerRadius =
    self.imvFace.bounds.size.width/2;
    
    self.imvFace.contentMode =
    UIViewContentModeScaleAspectFill;
    
    self.imvFace.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
