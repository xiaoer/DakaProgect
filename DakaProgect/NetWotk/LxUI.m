//
//  LxUI.m
//  DakaProgect
//
//  Created by super on 15/3/15.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "LxUI.h"

@implementation LxUI
//图片从中间扩展

+ (UIImage *)imageTensileWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    NSInteger leftCapWidth = image.size.width * 0.5f;
    // 顶端盖高度
    NSInteger topCapHeight = image.size.height * 0.5f;
    return [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
}

+ (UIImage *)imageNewTensileWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
}
@end
