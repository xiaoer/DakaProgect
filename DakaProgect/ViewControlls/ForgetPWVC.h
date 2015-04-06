//
//  ForgetPWVC.h
//  DakaProgect
//
//  Created by super on 15/4/6.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "CustomViewController.h"

@interface ForgetPWVC : CustomViewController

@property (nonatomic,weak) IBOutlet UIScrollView *tolScrollView;
@property (nonatomic,weak) IBOutlet UITextField *userTelTextField;
@property (nonatomic,weak) IBOutlet UITextField *valTextField;
@property (nonatomic,weak) IBOutlet UIButton *retryButton;
@property (nonatomic,weak) IBOutlet UIView   *retryView;
@property (nonatomic,weak) IBOutlet UILabel  *retryTimeLabel;
@property (nonatomic,weak) IBOutlet UIButton *nextStepButton;

-(IBAction)nextStepButtonSelected:(id)sender;

@end
