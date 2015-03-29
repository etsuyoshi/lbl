//
//  AddLinkTableViewCell.h
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/29.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddLinkTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *tfLink;
@property (weak, nonatomic) IBOutlet UIImageView *imvAdd;
@property (weak, nonatomic) IBOutlet UIView *viewBackOfImv;
@property (weak, nonatomic) IBOutlet UIView *viewBackOfTextField;

@end
