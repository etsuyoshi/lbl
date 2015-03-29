//
//  UIFont+Common.m
//  BASE3
//
//  Created by EndoTsuyoshi on 2015/02/08.
//  Copyright (c) 2015年 in.thebase. All rights reserved.
//

#import "UIFont+Common.h"

@implementation UIFont (Common)

+ (UIFont *)header
{
    return [UIFont fontWithName:@"HelveticaNeue" size:18.0];
}

+ (UIFont *)subheader
{
    return [UIFont fontWithName:@"HelveticaNeue-Thin" size:14.0];
}

+ (UIFont *)subheaderCoordinator
{
    return [UIFont fontWithName:@"HelveticaNeue" size:14.0];
}


+ (UIFont *)fontHirakaku{
    return [self fontHirakakuWithSize:14.f];
}

+ (UIFont *)fontHirakakuWithSize:(float)size
{
//    return [UIFont fontWithName:STRING_LABEL_FONT_HIRAKAKUPRON_W6 size:size];
    return [UIFont fontWithName:@"HiraKakuProN-W6" size:size];
}

+ (UIFont *)fontHirakaku3WithSize:(float)size
{
    //    return [UIFont fontWithName:STRING_LABEL_FONT_HIRAKAKUPRON_W6 size:size];
    return [UIFont fontWithName:@"HiraKakuProN-W3" size:size];
}


@end