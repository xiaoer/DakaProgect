//
//  FileHelper.m
//  DakaProgect
//
//  Created by super on 15/3/15.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "FileHelper.h"
#import "UUID.h"

#import <mach/mach.h>
#import <mach/mach_host.h>


#define imageStepCachePath @"imageStepCachePath"
#define imageStepCachePathThumil @"imageStepCachePathThumil"


static NSMutableDictionary *memCache;
static natural_t minFreeMemLeft = 1024*1024*12; // reserve 12MB RAM

static natural_t get_free_memory(void)
{
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    
    vm_statistics_data_t vm_stat;
    
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS)
    {
        NSLog(@"Failed to fetch vm statistics");
        return 0;
    }
    
    /* Stats in bytes */
    natural_t mem_free = vm_stat.free_count * pagesize;
    return mem_free;
}



@implementation FileHelper

+ (NSString *) genarateImagePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageStepCachePath];
    
    if(![fileManager fileExistsAtPath:path]){
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    NSString *imagePath = [path stringByAppendingPathComponent:[UUID GetUUID]];
    return imagePath;
}

+ (NSString *)generateImageThumilPath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageStepCachePathThumil];
    
    if(![fileManager fileExistsAtPath:path]){
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    NSString *imagePath = [path stringByAppendingPathComponent:[UUID GetUUID]];
    return imagePath;
}

+ (void)deleteImagesFolder{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageStepCachePath];
    if([fileManager fileExistsAtPath:path]){
        [fileManager removeItemAtPath:path error:nil];
    }
}

+ (void)deleteImagesThumilFolder{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageStepCachePathThumil];
    if([fileManager fileExistsAtPath:path]){
        [fileManager removeItemAtPath:path error:nil];
    }
}

+ (NSArray *)getImagePaths{
    NSArray *imagePaths = [[NSUserDefaults standardUserDefaults] arrayForKey:@"image_paths"];
    return imagePaths;
}
+ (void)setImagePaths :(NSArray *)imagePaths{
    
    if(imagePaths == nil){
        [self deleteImagesFolder];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"image_paths"];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:imagePaths forKey:@"image_paths"];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSArray *)getImageThumilPaths{
    NSArray *imagePaths = [[NSUserDefaults standardUserDefaults] arrayForKey:@"image_thumil_paths"];
    return imagePaths;
}
+ (void)setImageThumilPaths :(NSArray *)imageThumilPaths{
    
    if(imageThumilPaths == nil){
        [self deleteImagesThumilFolder];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"image_thumil_paths"];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:imageThumilPaths forKey:@"image_thumil_paths"];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (UIImage*)scaleToSize:(UIImage*)img size:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

+ (void)fixOrientation:(UIImage *)aImage {
    if (aImage==nil || !aImage) {
        return;
    }
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp) return;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    UIImageOrientation orientation=aImage.imageOrientation;
    int orientation_=orientation;
    switch (orientation_) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
    }
    
    switch (orientation_) {
        case UIImageOrientationUpMirrored:{
            
        }
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    aImage=img;
    img=nil;
}

+(void)setImageCache:(UIImage *)image key:(NSString *)key{
    if(!memCache){
        memCache = [[NSMutableDictionary alloc] init];
    }
    if(get_free_memory() < minFreeMemLeft){
        [memCache removeAllObjects];
    }
    if(key!=nil){
        [memCache setObject:image forKey:key];
    }
    
}

+(UIImage *)imageForKey:(NSString *)key{
    return [memCache objectForKey:key];
}

+(void)clearCache{
    [memCache removeAllObjects];
}



@end
