//
//  CameraOverlayVC.m
//  MSCKing
//
//  Created by lipeifeng on 14-6-10.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "CameraOverlayVC.h"
#import "AVCamCaptureManager.h"
#import "AVCamRecorder.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <QuartzCore/QuartzCore.h>
#import "FileHelper.h"
#import "GMGridView.h"
#import "GMGridViewLayoutStrategies.h"
#import "ThumilView.h"
#import "ELCAlbumPickerController.h"
#import "LRNavigationController.h"
#import "BIndicator.h"


#define CLOSE_WIDTH 67
#define OPEN_WIDTH 144
#define HOLDVIEW_TAG 123

@interface CameraOverlayVC ()<GMGridViewDataSource,CameraOverlayVCDelegate>
{
    __gm_weak GMGridView *_gmGridView;
}


- (void)loadCaptureManager;
- (void)startCameraCapture;
- (void)stopCameraCapture;

@end
@interface CameraOverlayVC (AVCamCaptureManagerDelegate) <AVCamCaptureManagerDelegate>
@end
@implementation CameraOverlayVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self hideNaviBar:YES];
        _imagePathThumilArray = [[NSMutableArray alloc] init];
        _imagePathOriginArray = [[NSMutableArray alloc] init];
        
        _imagePathOrighinFromLibrary = [[NSMutableArray alloc] init];
        _imagePathFromLibraryArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self startCameraCapture];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self stopCameraCapture];
}

- (void)startCameraCapture
{
    if (![[[self captureManager] session] isRunning])
    {
        [[[self captureManager] session] startRunning];
	};
}

- (void)stopCameraCapture
{
    if ([[[self captureManager] session] isRunning])
    {
        [[[self captureManager] session] stopRunning];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self hideNaviBar:YES];
    
    
    self.flashOpcityView.frame = self.torchView.frame;
    
    self.torchView.layer.borderWidth = 1;
    self.torchView.layer.borderColor = [UIColor darkTextColor].CGColor;
    self.torchView.layer.cornerRadius = 15;
    self.torchView.layer.masksToBounds = YES;
    
    self.flashOpcityView.layer.cornerRadius = 15;
    self.flashOpcityView.layer.masksToBounds = YES;
    
    self.photoLibraryButton.layer.borderWidth = 1;
    self.photoLibraryButton.layer.borderColor = [UIColor darkTextColor].CGColor;
    self.photoLibraryButton.layer.cornerRadius = 15;
    self.photoLibraryButton.layer.masksToBounds = YES;
    
    self.libraryOpctityView.layer.cornerRadius = 15;
    self.libraryOpctityView.layer.masksToBounds = YES;
    
    self.frontBackButton.layer.borderWidth = 1;
    self.frontBackButton.layer.borderColor = [UIColor darkTextColor].CGColor;
    self.frontBackButton.layer.cornerRadius = 15;
    self.frontBackButton.layer.masksToBounds = YES;
    
    self.frontOpctityView.layer.cornerRadius = 15;
    self.frontOpctityView.layer.masksToBounds = YES;
    
    // Do any additional setup after loading the view from its nib.
    
    [self loadCaptureManager];
    
    
    ISIrisView *irisView = [[ISIrisView alloc] initWithFrame:self.shutterView.frame];
    self.irisView = irisView;
    [self.shutterView addSubview:irisView];
    [self.irisView closeIris];
    
    GMGridView *gmGridView = [[GMGridView alloc] initWithFrame:self.holdScrollView.frame];
    gmGridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    gmGridView.style = GMGridViewStylePush;
    gmGridView.itemSpacing = 5;
    gmGridView.minEdgeInsets = UIEdgeInsetsMake(2, 5, 2, 5);
    gmGridView.centerGrid = NO;
    gmGridView.layoutStrategy = [GMGridViewLayoutStrategyFactory strategyFromType:GMGridViewLayoutHorizontal];
    [self.holdScrollView addSubview:gmGridView];
    _gmGridView = gmGridView;
    
    _gmGridView.dataSource = self;
    
    _gmGridView.mainSuperView = self.view;
    if(_imagePathThumilArray.count > 0){
        self.holdView.hidden = NO;
        
        [_gmGridView scrollToObjectAtIndex:_imagePathThumilArray.count-1 animated:YES];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sessionDidStartRunning:) name:AVCaptureSessionDidStartRunningNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sessionDidStopRunning:) name:AVCaptureSessionDidStopRunningNotification object:nil];
    
    
    // Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    _imagePathThumilArray = nil;
    _imagePathOriginArray = nil;
    _imagePathFromLibraryArray = nil;
    _imagePathOrighinFromLibrary = nil;
    _gmGridView = nil;
    
    self.captureManager = nil;
    self.captureVideoPreviewLayer = nil;
    self.irisView = nil;
    
    [self setDoneButton:nil];
    [self setTakePhotoButton:nil];
    [self setPhotoLibraryButton:nil];
    [self setFrontBackButton:nil];
    [self setFlashOpcityView:nil];
    [self setLibraryOpctityView:nil];
    [self setTorchView:nil];
    [self setCurrentTorchLabel:nil];
    [self setShutterView:nil];
    [self setHoldView:nil];
    [self setHoldScrollView:nil];

    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVCaptureSessionDidStartRunningNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVCaptureSessionDidStopRunningNotification object:nil];
    
    [self setFrontOpctityView:nil];
    [super viewDidUnload];
    
}


#pragma mark-
#pragma mark- Notification
-(void)sessionDidStartRunning:(NSNotification *)noti{
    [self.irisView openIris];
}
-(void)sessionDidStopRunning:(NSNotification *)noti{
    [self.irisView closeIris];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//闪光灯
-(IBAction)turnTorchOn:(id)sender
{
    [UIView animateWithDuration:.2f
                     animations:^{
                         CGRect rect = self.torchView.frame;
                         rect.size.width = CLOSE_WIDTH;
                         self.torchView.frame = rect;
                         self.flashOpcityView.frame = self.torchView.frame;
                     }
                     completion:^(BOOL finished){
                         self.currentTorchLabel.text = @"开启";
                         [[self captureManager] turnOnLed];
                         self.photoLibraryButton.hidden = NO;
                         self.libraryOpctityView.hidden = NO;
                     }
     ];

}
-(IBAction)turnTorchOff:(id)sender
{
    
    [UIView animateWithDuration:.2f
                     animations:^{
                         CGRect rect = self.torchView.frame;
                         rect.size.width = CLOSE_WIDTH;
                         self.torchView.frame = rect;
                         self.flashOpcityView.frame = self.torchView.frame;
                     }
                     completion:^(BOOL finished){
                         self.currentTorchLabel.text = @"关闭";
                         [[self captureManager] turnOffLed];
                         self.photoLibraryButton.hidden = NO;
                         self.libraryOpctityView.hidden = NO;
                     }
     ];
}
-(IBAction)toggleTorchView:(id)sender
{
    if(CGRectGetWidth(self.torchView.frame) == CLOSE_WIDTH){
        [UIView animateWithDuration:.2f
                         animations:^{
                             CGRect rect = self.torchView.frame;
                             rect.size.width = OPEN_WIDTH;
                             self.torchView.frame = rect;
                             self.flashOpcityView.frame = self.torchView.frame;
                         }
                         completion:^(BOOL finished){
                             self.currentTorchLabel.text = @"自动";
                             [[self captureManager] turnAutoLed];
                             self.photoLibraryButton.hidden = YES;
                             self.libraryOpctityView.hidden = YES;
                             
                         }
         ];
    }
    else{
        [UIView animateWithDuration:.2f
                         animations:^{
                             CGRect rect = self.torchView.frame;
                             rect.size.width = CLOSE_WIDTH;
                             self.torchView.frame = rect;
                             self.flashOpcityView.frame = self.torchView.frame;
                         }
                         completion:^(BOOL finished){
                             self.currentTorchLabel.text = @"自动";
                             [[self captureManager] turnAutoLed];
                             self.photoLibraryButton.hidden = NO;
                             self.libraryOpctityView.hidden = NO;
                         }
         ];
    }
}

//前后摄像头
- (IBAction)toggleCamera:(id)sender
{
    [[self captureManager] toggleCamera];
    AVCaptureDevicePosition position = [[[self captureManager].videoInput device] position];
    
    if (position == AVCaptureDevicePositionBack){
        self.torchView.hidden = NO;
        self.flashOpcityView.hidden = NO;
        
    }
    else if (position == AVCaptureDevicePositionFront){
        self.torchView.hidden = YES;
        self.flashOpcityView.hidden = YES;
    }
}

//进入照片库
- (IBAction)enterPhotoAlbum:(id)sender
{
    ELCAlbumPickerController *v = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ELCAlbumPickerController"];
    v.selectdNum =_imagePathThumilArray.count;
    v.delegate = self;
    v.backType = 1;
    [(LRNavigationController *)self.navigationController pushViewControllerWithLRAnimated:v];
  //  [LRNavigationController navagtaion:(LRNavigationController *)self.navigationController pushViewControllerWithLRAnimated:v];
}

-(void)loadCaptureManager{
    if ([self captureManager] == nil) {
		AVCamCaptureManager *manager = [[AVCamCaptureManager alloc] init];
        
		[self setCaptureManager:manager];
		
		[[self captureManager] setDelegate:self];
        
		if ([[self captureManager] setupSession]) {
            // Create video preview layer and add it to the UI
			AVCaptureVideoPreviewLayer *newCaptureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:[[self captureManager] session]];
			UIView *view = [self videoPreviewView];
			CALayer *viewLayer = [view layer];
			[viewLayer setMasksToBounds:YES];
			
			CGRect bounds = [view bounds];
			[newCaptureVideoPreviewLayer setFrame:bounds];
			
			if ([newCaptureVideoPreviewLayer isOrientationSupported]) {
				[newCaptureVideoPreviewLayer setOrientation:AVCaptureVideoOrientationPortrait];
			}
			
			[newCaptureVideoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
			
			[viewLayer insertSublayer:newCaptureVideoPreviewLayer below:[[viewLayer sublayers] objectAtIndex:0]];
			
			[self setCaptureVideoPreviewLayer:newCaptureVideoPreviewLayer];
		}
	}
}


//拍摄照片
- (IBAction)captureStillImage:(id)sender
{
    if (_imagePathThumilArray.count >= 9) {
        [BIndicator showMessage:@"最多只能选择9张" duration:0.5f];
        return;
    }
    
    if(iscamering == NO){
        iscamering = YES;
        [[self captureManager] captureStillImage];
        [self.irisView closeIris];
    }

}
//完成
-(IBAction)done:(id)sender
{
    [(LRNavigationController *)self.navigationController popViewControllerWithLRAnimated];
    
    if([self.delegate respondsToSelector:@selector(cameraCaptureFinised:originPaths:)])
    {
        [self.delegate cameraCaptureFinised:_imagePathThumilArray originPaths:_imagePathOriginArray];
    }
}
//取消
- (IBAction)cancel:(id)sender
{
    [(LRNavigationController *)self.navigationController popViewControllerWithLRAnimated];
}

#pragma mark-
#pragma mark- CVODelegate

-(void)photoLibrayFinised:(NSArray *)imagePaths originPaths:(NSArray *)orginPaths{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if([self.delegate respondsToSelector:@selector(cameraCaptureFinised:originPaths:)]){
        [self.delegate cameraCaptureFinised:_imagePathThumilArray originPaths:_imagePathOriginArray];
    }
    
    if([self.delegate respondsToSelector:@selector(photoLibrayFinised:originPaths:)]){
        [self.delegate photoLibrayFinised:imagePaths originPaths:orginPaths];
    }
    
}
//////////////////////////////////////////////////////////////
#pragma mark GMGridViewDataSource
//////////////////////////////////////////////////////////////

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView{
    return _imagePathThumilArray.count;
}

- (CGSize)sizeForItemsInGMGridView:(GMGridView *)gridView
{
    return CGSizeMake(50, 60);
}

- (GMGridViewCell *)GMGridView:(GMGridView *)gridView cellForItemAtIndex:(NSInteger)index
{
    static NSString *t_cell = @"thumil_cell";
    ThumilView *cell = (ThumilView *)[gridView dequeueReusableCell:t_cell];
    
    if (!cell){
        cell = [[ThumilView alloc] initReuseIdentifer:t_cell];
    }
    
    NSString *imagePath = [_imagePathThumilArray objectAtIndex:index];
    dispatch_async(dispatch_get_main_queue(), ^{
        cell.imageView.image = [UIImage imageWithContentsOfFile:imagePath];
    });
    
    return cell;
}


@end

@implementation CameraOverlayVC (AVCamCaptureManagerDelegate)

- (void)captureManager:(AVCamCaptureManager *)captureManager didFailWithError:(NSError *)error
{
    
}

- (void)captureManagerRecordingBegan:(AVCamCaptureManager *)captureManager
{
    
}

- (void)captureManagerRecordingFinished:(AVCamCaptureManager *)captureManager
{
    
}

-(void)captureManagerStillImageDataCaptured:(NSData *)imageData{
    
    NSString *imageThumilPath = [FileHelper generateImageThumilPath];
    NSString *imageOriginPath = [FileHelper genarateImagePath];
    
    UIImage *imageFull = [UIImage imageWithData:imageData];
    
    //保存照相缩略图
    UIImage *thumilImage = [FileHelper scaleToSize:imageFull size:CGSizeMake(150, 150)];
    NSData *thumilImageData = UIImageJPEGRepresentation(thumilImage, 0.7);
    if([thumilImageData writeToFile:imageThumilPath atomically:YES]){
        [_imagePathThumilArray addObject:imageThumilPath];
    }
    
    //保存照相原图
    UIImage *originImage = [FileHelper rotateImage:imageFull boundw:1000.0f];
    NSData *originImageData = UIImageJPEGRepresentation(originImage, 0.7);
    if([originImageData writeToFile:imageOriginPath atomically:YES]){
        [_imagePathOriginArray addObject:imageOriginPath];
    }
    
    NSLog(@"width:%f,height:%f",originImage.size.width,originImage.size.height);
    
    [self.irisView openIris];
    iscamering = NO;
}

- (void)captureManagerStillImageCaptured:(AVCamCaptureManager *)captureManager
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(_imagePathThumilArray.count > 0){
            self.holdView.hidden = NO;
            [_gmGridView reloadData];
            
            [_gmGridView scrollToObjectAtIndex:_imagePathThumilArray.count-1 animated:YES];
        }
    });
}


- (void)captureManagerDeviceConfigurationChanged:(AVCamCaptureManager *)captureManager
{
	
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
