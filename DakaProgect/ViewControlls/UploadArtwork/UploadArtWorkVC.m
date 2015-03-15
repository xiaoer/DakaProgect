//
//  UploadArtWorkVC.m
//  DakaProgect
//
//  Created by super on 15/3/14.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "UploadArtWorkVC.h"

@interface UploadArtWorkVC ()

@end

@implementation UploadArtWorkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"上传艺术品"];
    [self.view setBackgroundColor:[UIColor redColor]];
    [UtilityFunc resetScrlView:_totalScrollView contentInsetWithNaviBar:YES tabBar:NO iOS7ContentInsetStatusBarHeight:0 inidcatorInsetStatusBarHeight:-1];
    UIButton *choosePicButton = [[UIButton alloc] init];
    [choosePicButton addTarget:self action:@selector(choosePicButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    choosePicButton.frame = CGRectMake(100, 100, 100, 100);
    [choosePicButton setTitle:@"上传图片" forState:UIControlStateNormal];
    [_totalScrollView addSubview:choosePicButton];
}

-(void)choosePicButtonSelected:(UIButton *)sendButton
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"上传图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册中选择",@"手机拍照", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ((long)buttonIndex == 0) {
        NSLog(@"从相册中选择");
    }else if ((long)buttonIndex == 1){
        NSLog(@"手机拍照");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
