//
//  RegisterFirstVC.m
//  DakaProgect
//
//  Created by super on 15/4/6.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "RegisterFirstVC.h"

@interface RegisterFirstVC ()

@end

@implementation RegisterFirstVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNaviBarTitle:@"验证手机"];
    [self.view setBackgroundColor:UIColorFromRGB(0xe5e5e5)];
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
