//
//  CustomNavigationController.h
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "GlobalDefine.h"
#import "LRNavigationController.h"

@interface CustomNavigationController : LRNavigationController

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack;

@end
