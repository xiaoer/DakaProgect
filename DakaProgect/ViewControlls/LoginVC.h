//
//  LoginVC.h
//  DakaProgect
//
//  Created by super on 15/4/6.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomViewController.h"

@interface LoginVC : CustomViewController
@property (nonatomic,weak) IBOutlet UIImageView  *backImageView;
@property (nonatomic,weak) IBOutlet UIScrollView *tolScrollView;
@property (nonatomic,weak) IBOutlet UIView       *loginView;
@property (nonatomic,weak) IBOutlet UIView           *userNameView;
@property (nonatomic,weak) IBOutlet UITextField      *userNameTextField;
@property (nonatomic,weak) IBOutlet UIView          *passWordView;
@property (nonatomic,weak) IBOutlet UITextField      *passWordTextField;
@property (nonatomic,weak) IBOutlet UIButton        *loginButton;
@property (nonatomic,weak) IBOutlet UIImageView     *coverImageView;


-(IBAction)regisetButtonSelected:(UIButton *)sendButton;
-(IBAction)forgetPassWordButtonSelected:(UIButton *)sendButton;
-(IBAction)loginButtonSelected:(UIButton *)sendButton;

@end
