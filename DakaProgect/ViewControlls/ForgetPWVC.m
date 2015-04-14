//
//  ForgetPWVC.m
//  DakaProgect
//
//  Created by super on 15/4/6.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "ForgetPWVC.h"

@interface ForgetPWVC ()

@end

@implementation ForgetPWVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNaviBarTitle:@"忘记密码"];
    [self.view setBackgroundColor:UIColorFromRGB(0xe5e5e5)];
}

-(IBAction)nextStepButtonSelected:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
