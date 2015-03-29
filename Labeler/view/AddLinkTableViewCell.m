//
//  AddLinkTableViewCell.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/29.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "AddLinkTableViewCell.h"

@implementation AddLinkTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.viewBackOfImv.backgroundColor = [UIColor whiteColor];
    self.viewBackOfTextField.backgroundColor = [UIColor whiteColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
