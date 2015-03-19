//
//  ETCommonMethods.m
//  BASE3
//
//  Created by EndoTsuyoshi on 2015/01/07.
//  Copyright (c) 2015年 in.thebase. All rights reserved.
//

#import "ETCommonMethods.h"

@implementation ETCommonMethods


+(BOOL)isNullComparedToString:(NSString *)string{
    if([string isEqual:[NSNull null]] ||
       string == nil){
        return YES;
    }
    return NO;
}

+(BOOL)isNullComparedToObj:(id)obj{
    if([obj isEqual:[NSNull null]] ||
       obj == nil){
        return YES;
    }
    return NO;
}

//+ (void)resizeAspectFitImageWithImage:(UIImage*)img
//                               atSize:(CGFloat)size
//                           imageWidth:(int)imageWidth
//                          imageHeight:(int)imageHeight
//                           completion:(void(^)(UIImage*))completion
//{
//    CIImage *ciImage = [[CIImage alloc] initWithImage:img];
//    // リサイズする倍率を求める:2
//    // 新しい画像サイズ
//    CGSize newSize = CGSizeMake(imageWidth, imageHeight);
//    //    CGSize newSize = CGSizeMake(imageWidth*2, imageHeight*2);
//    
//    // ソーズ画像のサイズと、新しいサイズの比率計算
//    CGRect imageRect = [ciImage extent];
//    CGPoint scale = CGPointMake(newSize.width/imageRect.size.width,
//                                newSize.height/imageRect.size.height);
//    
//    //CGFloat scale = img.size.width < img.size.height ? size/img.size.height : size/img.size.width;
//    // CGAffineTransformでサイズ変更
//    CIImage *filteredImage = [ciImage imageByApplyingTransform:CGAffineTransformMakeScale(scale.x,scale.y)];
//    // UIImageに変換
//    UIImage *newImg = [self uiImageFromCIImage:filteredImage];
//    
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        completion(newImg);
//    });
//}
//
//
//+ (void)centerCroppingImageWithImage:(UIImage*)img atSize:(CGSize)size completion:(void(^)(UIImage*))completion
//{
//    CIImage *ciImage = [[CIImage alloc] initWithImage:img];
//    /* 画像のサイズ */
//    CGSize imgSize = CGSizeMake(img.size.width * img.scale,
//                                img.size.height * img.scale);
//    /* トリミングするサイズ */
//    CGSize croppingSize = CGSizeMake(size.width * [UIScreen mainScreen].scale,
//                                     size.height * [UIScreen mainScreen].scale);
//    /* 中央でトリミング */
//    CIImage *filteredImage = [ciImage imageByCroppingToRect:CGRectMake(imgSize.width/2.f - croppingSize.width/2.f,
//                                                                       imgSize.height/2.f - croppingSize.height/2.f,
//                                                                       croppingSize.width,
//                                                                       croppingSize.height)];
//    /* UIImageに変換する */
//    UIImage *newImg = [self uiImageFromCIImage:filteredImage];
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        completion(newImg);
//    });
//}
//
//+ (UIImage*)uiImageFromCIImage:(CIImage*)ciImage
//{
//    CIContext *ciContext = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @NO }];
//    CGImageRef imgRef = [ciContext createCGImage:ciImage fromRect:[ciImage extent]];
//    UIImage *newImg  = [UIImage imageWithCGImage:imgRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
//    CGImageRelease(imgRef);
//    //CGImageContext(aho);
//    return newImg;
//    
//    /* iOS6.0以降だと以下が使用可能 */
//    //  [[UIImage alloc] initWithCIImage:ciImage scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];f
//}
//
//
//+(float)getOSVersion{
//    return [[[UIDevice currentDevice] systemVersion] floatValue];
//}
//+(BOOL)getIsSuccessStatus:(NSDictionary *)results{
//    
//    NSLog(@"status = %@(%@)",
//          results[STRING_API_KEY_STATUS],
//          [results[STRING_API_KEY_STATUS] class]);
//    
//    if([results[STRING_API_KEY_STATUS] isKindOfClass:[NSString class]]){
//        
//        NSString *strStatus = results[STRING_API_KEY_STATUS];
//        
//        //別の値ならエラーメッセ表示
//        if(!([strStatus isEqualToString:@"yes"] ||
//             [strStatus isEqualToString:@"YES"] ||
//             [strStatus isEqualToString:@"no"] ||
//             [strStatus isEqualToString:@"NO"])){
//            [SVProgressHUD showErrorWithStatus:
//             [NSString stringWithFormat:
//             @"意図しない値が検出されました(%@)",strStatus]];
//        }
//        //正式
//        if([strStatus isEqualToString:@"yes"])return YES;
//        return NO;
////    }else if([(id)results[STRING_API_KEY_STATUS] isKindOfClass:[BOOL class]]){
////        
////        return (BOOL)[results[STRING_API_KEY_STATUS] boolValue];
//    }else{
//        [SVProgressHUD showErrorWithStatus:@"意図しないstatusの型が検出されました"];
//        NSLog(@"result = %@, \nstatus-class=%@, casted bool = %d",
//              results,
//              [results[STRING_API_KEY_STATUS] class],
//              (BOOL)[results[STRING_API_KEY_STATUS] boolValue]);
//        return (BOOL)[results[STRING_API_KEY_STATUS] boolValue];
////        return NO;
//    }
//}

+(NSString *)setCommaSeperateInt:(int)intNumArg{
    NSString *strNumArg = [NSString stringWithFormat:@"%d", intNumArg];
    return [self setCommaSeperateString:strNumArg];
}



+(NSString *)setCommaSeperateString:(NSString *)strNumArg{
    NSInteger intPrice = [strNumArg integerValue];
    
    // まずはNSNumberに変換
    NSNumber *priceNumber = [[NSNumber alloc] initWithInteger:intPrice];
    
    // 数値を3桁ごとカンマ区切りにするように設定
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGroupingSeparator:@","];
    [formatter setGroupingSize:3];
    
    // 数値を3桁ごとカンマ区切り形式で文字列に変換する
    NSString *result = [formatter stringFromNumber:priceNumber];
    return result;
}


//+(void)removeAllAccountInfoInKeychain{
//    
//    UICKeyChainStore *store =
//    [UICKeyChainStore keyChainStoreWithService:KEYCHAIN_LABEL_ROOT_PATH];
//    [store removeItemForKey:KEYCHAIN_LABEL_EMAIL];
//    [store removeItemForKey:KEYCHAIN_LABEL_PASSWORD];
//    [store removeItemForKey:KEYCHAIN_LABEL_SESSION_ID];
//    
//    //etusermanagerのsessionidをnullにする
//    [[ETUserManager sharedManager] signOutWithBlock:
//    ^(BOOL isSuccess, NSError *error){
//        if(isSuccess){
//            //do nothing
//        }else{
//            //do nothing
//        }
//    }];
//    
//    
//}


+(BOOL)is4SDevice480{//320 x 480
    NSLog(@"wd=%f, hg=%f", [UIScreen mainScreen].bounds.size.width,
          [UIScreen mainScreen].bounds.size.height);
    //WIDTH = 320.000000, HEIGHT = 480.000000
    return [UIScreen mainScreen].bounds.size.width == 320.f &&
        [UIScreen mainScreen].bounds.size.height == 480.f;
}
+(BOOL)is5Device568{//320 x 568
    return [UIScreen mainScreen].bounds.size.width == 320.f &&
    [UIScreen mainScreen].bounds.size.height == 568.f;
}
+(BOOL)is6Device667{//375 x 667
    return [UIScreen mainScreen].bounds.size.width == 375.f &&
    [UIScreen mainScreen].bounds.size.height == 667.f;
}
+(BOOL)is6pDevice736{//414 x 736
    return [UIScreen mainScreen].bounds.size.width == 414.f &&
    [UIScreen mainScreen].bounds.size.height == 736.f;
}


//当該ビューが生きているかどうか
+(BOOL)isAliveController:(UIViewController *)senderController{
    return [senderController isViewLoaded] && senderController.view.window;
}

@end
