//
//  CameraOverlayVC.h
//  MSCKing
//
//  Created by lipeifeng on 14-6-10.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "CustomViewController.h"
#import "ISIrisView.h"


@protocol CameraOverlayVCDelegate <NSObject>
@optional
-(void)cameraCaptureFinised:(NSArray *)imagePaths originPaths:(NSArray *)orginPaths;
-(void)photoLibrayFinised:(NSArray *)imagePaths originPaths:(NSArray *)orginPaths;
-(void)textDidFinised:(NSString *)descr;
@end

@class AVCamCaptureManager, AVCamPreviewView, AVCaptureVideoPreviewLayer;
@interface CameraOverlayVC : CustomViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    BOOL iscamering;
}
@property (nonatomic,retain) AVCamCaptureManager *captureManager;
@property (nonatomic,retain) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;

@property (nonatomic,assign) id <CameraOverlayVCDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;           //完成button
@property (weak, nonatomic) IBOutlet UIButton *takePhotoButton;      //中间拍照button
@property (weak, nonatomic) IBOutlet UIButton *photoLibraryButton;     //相册按钮
@property (weak, nonatomic) IBOutlet UIButton *frontBackButton;        //切换按钮
@property (weak, nonatomic) IBOutlet UIView *shutterView;              //整个拍照区域view

@property (weak, nonatomic) IBOutlet UIView *flashOpcityView;           //自动背景view
@property (weak, nonatomic) IBOutlet UIView *libraryOpctityView;       //相册背景view
@property (weak, nonatomic) IBOutlet UIView *frontOpctityView;         //切换背景

@property (nonatomic,retain) IBOutlet UIView *videoPreviewView;
@property (weak, nonatomic) IBOutlet UIView *torchView;                  
@property (weak, nonatomic) IBOutlet UILabel *currentTorchLabel;        //散光灯现在状态label
@property (weak, nonatomic) IBOutlet UIView *holdView;                  //拍照后照片承载view
@property (weak, nonatomic) IBOutlet UIScrollView *holdScrollView;      //拍照后显示照片scrollview
@property (nonatomic,retain) ISIrisView *irisView;

@property (nonatomic,retain)  NSMutableArray *imagePathThumilArray;
@property (nonatomic,retain) NSMutableArray *imagePathOriginArray;
@property (nonatomic,retain) NSMutableArray *imagePathFromLibraryArray;
@property (nonatomic,retain) NSMutableArray *imagePathOrighinFromLibrary;

//闪光灯
-(IBAction)turnTorchOn:(id)sender;
-(IBAction)turnTorchOff:(id)sender;
-(IBAction)toggleTorchView:(id)sender;

//前后摄像头
- (IBAction)toggleCamera:(id)sender;

//进入照片库
- (IBAction)enterPhotoAlbum:(id)sender;
//拍摄照片
- (IBAction)captureStillImage:(id)sender;
//完成
-(IBAction)done:(id)sender;
//取消
- (IBAction)cancel:(id)sender;


@end
