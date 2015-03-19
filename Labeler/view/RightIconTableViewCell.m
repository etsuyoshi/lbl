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
    
    self.imageView.layer.cornerRadius =
    self.imageView.bounds.size.width/2;
    
    self.imageView.contentMode =
    UIViewContentModeScaleAspectFill;
    
    self.imageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
