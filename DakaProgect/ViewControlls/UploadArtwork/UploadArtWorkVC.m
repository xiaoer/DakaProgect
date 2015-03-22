//
//  UploadArtWorkVC.m
//  DakaProgect
//
//  Created by super on 15/3/14.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "UploadArtWorkVC.h"
#import "DKGlobalDefine.h"


@interface UploadArtWorkVC ()

@end

@implementation UploadArtWorkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"上传艺术品"];
    [self.view setBackgroundColor:UIColorFromRGB(0xe5e5e5)];
    [UtilityFunc resetScrlView:_totalScrollView contentInsetWithNaviBar:YES tabBar:NO iOS7ContentInsetStatusBarHeight:0 inidcatorInsetStatusBarHeight:-1];
    UIButton *choosePicButton = [[UIButton alloc] init];
    [choosePicButton addTarget:self action:@selector(choosePicButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    choosePicButton.frame = CGRectMake(100, 100, 100, 100);
    [choosePicButton setTitle:@"上传图片" forState:UIControlStateNormal];
    [_totalScrollView addSubview:choosePicButton];
    
  //  _baseView = [[UPBaseView alloc] in]
    switch (_tag) {
        case 100:
            
            break;
        case 101:
            
            break;
        case 102:
            
            break;
        case 103:
            
            break;
        case 104:
            
            break;
        case 105:
            
            break;
        case 106:
            
            break;
        case 107:
            
            break;
        case 108:
            
            break;
        case 109:
            
            break;
        case 110:
            
            break;
        case 111:
            
            break;
        case 112:
            
            break;
        case 113:
            
            break;
        case 1114:
            
            break;
            
        default:
            break;
    }
    
    
}

-(void)choosePicButtonSelected:(UIButton *)sendButton
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"上传图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册中选择",@"手机拍照", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ((long)buttonIndex == 1) {
        NSLog(@"手机拍照");
        
        CameraOverlayVC *v =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CameraOverlayVC"];
        v.delegate = self;
        CATransition* transition = [CATransition animation];
        transition.duration = 0.4f;
        transition.timingFunction = [CAMediaTimingFunction
                                     functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        transition.subtype = kCATransitionFromTop;
        [self.navigationController.view.layer addAnimation:transition forKey:nil];
        
        [(LRNavigationController*)self.navigationController  pushViewControllerWithLRAnimated:v];
    }else if ((long)buttonIndex == 0){
        NSLog(@"从相册中选择");
        ELCAlbumPickerController *v = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ELCAlbumPickerController"];
        v.delegate = self;
        v.selectdNum =0;
        v.backType = 1;
        [(LRNavigationController*)self.navigationController  pushViewControllerWithLRAnimated:v];
    
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
