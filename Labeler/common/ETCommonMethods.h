//
//  ETCommonMethods.h
//  BASE3
//
//  Created by EndoTsuyoshi on 2015/01/07.
//  Copyright (c) 2015年 in.thebase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETCommonMethods : NSObject


+(BOOL)isNullComparedToString:(NSString *)string;
+(BOOL)isNullComparedToObj:(id)obj;
+ (void)resizeAspectFitImageWithImage:(UIImage*)img
                               atSize:(CGFloat)size
                           imageWidth:(int)imageWidth
                          imageHeight:(int)imageHeight
                           completion:(void(^)(UIImage*))completion;
+(float)getOSVersion;
+(BOOL)getIsSuccessStatus:(NSDictionary *)results;

+(NSString *)setCommaSeperateInt:(int)intNumArg;
+(NSString *)setCommaSeperateString:(NSString *)strNumArg;
+(void)removeAllAccountInfoInKeychain;

+(BOOL)is4SDevice480;
+(BOOL)is5Device568;
+(BOOL)is6Device667;
+(BOOL)is6pDevice736;


+(BOOL)isAliveController:(UIViewController *)senderController;
@end
