//
//  ImageCenterTableViewCell.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/21.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "ImageCenterTableViewCell.h"

@implementation ImageCenterTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    //imageviewでやる場合、画像サイズとラベルの位置の調整が難しいので柔軟に対応するためlabelにする
//    self.imvCenter.contentMode =
//    UIViewContentModeScaleAspectFit;
//    self.imvCenter.clipsToBounds = YES;//fitの場合は必要ないが念のため
    
    self.lblCenter.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:17.f];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
