//
//  ETColor.h
//  BASE3
//
//  Created by EndoTsuyoshi on 2014/10/23.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import <UIKit/UIKit.h>
#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r, g, b, a)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface UIColor (ETColor)
+ (UIColor*)scarletColor;
+ (UIColor*)hotPinkColor;
+ (UIColor*)deepPinkColor;
+ (UIColor*)royalBlue3Color;


+ (UIColor*)ETPinkColor;
+ (UIColor*)ETTitleColor;
+ (UIColor*)ETCellSeparatorColor;
+ (UIColor*)ETCartFooterColor;
+ (UIColor*)ETCellTextColor;
+ (UIColor*)ETCellVariationBackgroundColor;
+ (UIColor*)ETCategoryTextColor;
@end
