//
//  RegisterFirstVC.m
//  DakaProgect
//
//  Created by super on 15/4/6.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "RegisterFirstVC.h"
#import "LxUI.h"

@interface RegisterFirstVC ()

@end

@implementation RegisterFirstVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNaviBarTitle:@"验证手机"];
    [self.view setBackgroundColor:UIColorFromRGB(0xe5e5e5)];
    [UtilityFunc resetScrlView:_tolScrollView contentInsetWithNaviBar:YES tabBar:NO iOS7ContentInsetStatusBarHeight:0 inidcatorInsetStatusBarHeight:-1];
    _valView.layer.masksToBounds = YES;
    _valView.layer.cornerRadius = 3.0f;
    _userTelView.layer.masksToBounds = YES;
    _userTelView.layer.cornerRadius = 3.0f;
    
    [_retryButton setBackgroundImage:[LxUI createImageWithColor:UIColorFromRGB(0x0078FA)] forState:UIControlStateNormal];
    [_retryButton.layer setCornerRadius:5.0f];
    [_retryButton.layer setMasksToBounds:YES];
    
    [_nextStepButton setBackgroundImage:[LxUI createImageWithColor:UIColorFromRGB(0x0078FA)] forState:UIControlStateNormal];
    _nextStepButton.layer.cornerRadius = 3.0f;
    _nextStepButton.layer.masksToBounds = YES;
}

-(IBAction)nextStepButtonSelected:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
