//
//  UploadArtWorkVC.h
//  DakaProgect
//
//  Created by super on 15/3/14.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "CustomViewController.h"
#import "ELCAlbumPickerController.h"
#import "LRNavigationController.h"
#import "CameraOverlayVC.h"

@interface UploadArtWorkVC : CustomViewController<UIActionSheetDelegate,CameraOverlayVCDelegate>

@property (nonatomic,weak) IBOutlet UIScrollView *totalScrollView;

@end
