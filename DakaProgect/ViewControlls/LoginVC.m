//
//  LoginVC.m
//  DakaProgect
//
//  Created by super on 15/4/6.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "LoginVC.h"
#import "RegisterFirstVC.h"
#import "ForgetPWVC.h"
#import "LxUI.h"
#import "UIImage+ImageEffects.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self setNaviBarTitle:@"登录"];
    [self setNaviBarLeftBtn:nil];
    [self.view setBackgroundColor:UIColorFromRGB(0xe5e5e5)];
    [_backImageView setImage:[[UIImage imageNamed:@"login_back.jpg"] applyExtraLightEffect]];
    _userNameView.layer.cornerRadius = 3.0f;
    _userNameView.layer.masksToBounds = YES;
    _passWordView.layer.cornerRadius = 3.0f;
    _passWordView.layer.masksToBounds = YES;
    [_loginButton setBackgroundImage:[LxUI createImageWithColor:UIColorFromRGB(0x6ad57d)] forState:UIControlStateNormal];
    _loginButton.layer.cornerRadius = 3.0f;
    _loginButton.layer.masksToBounds = YES;
   // [self regisetButtonSelected:nil];
   // [self forgetPassWordButtonSelected:nil];
    // Do any additional setup after loading the view.
}

-(IBAction)regisetButtonSelected:(UIButton *)sendButton
{
    [_userNameTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
    RegisterFirstVC *regsterFirstVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RegisterFirstVC"];
    [self.navigationController pushViewController:regsterFirstVC animated:YES];
}

-(IBAction)forgetPassWordButtonSelected:(UIButton *)sendButton
{
    [_userNameTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
    ForgetPWVC *forgetPwVC =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ForgetPWVC"];
    [self.navigationController pushViewController:forgetPwVC animated:YES];
}

-(IBAction)loginButtonSelected:(UIButton *)sendButton
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
