//
//  ReviewTableViewCell.h
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/29.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imvLeft;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblExplain;

@end
