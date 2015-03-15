//
//  FileHelper.h
//  DakaProgect
//
//  Created by super on 15/3/15.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FileHelper : NSObject

+ (NSString *)genarateImagePath;
+ (NSString *)generateImageThumilPath;
+ (void)deleteImagesFolder;
+ (void)deleteImagesThumilFolder;


+ (NSArray *)getImagePaths;
+ (void)setImagePaths :(NSArray *)imagePaths;

+ (NSArray *)getImageThumilPaths;
+ (void)setImageThumilPaths :(NSArray *)imageThumilPaths;

+(UIImage*)scaleToSize:(UIImage*)img size:(CGSize)size;

+(void)fixOrientation:(UIImage *)aImage;
+ (UIImage* )rotateImage:(UIImage *)image boundw:(float)boundw;

+(void)setImageCache:(UIImage *)image key:(NSString *)key;
+(UIImage *)imageForKey:(NSString *)key;
+(void)clearCache;


@end
