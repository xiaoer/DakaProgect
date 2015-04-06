//
//  ForgetPWSecVC.h
//  DakaProgect
//
//  Created by super on 15/4/6.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "CustomViewController.h"

@interface ForgetPWSecVC : CustomViewController

@property (nonatomic,weak) IBOutlet UIScrollView *tolScrollview;
@property (nonatomic,weak) IBOutlet UILabel         *telLabel;
@property (nonatomic,weak) IBOutlet UITextField     *passWordTextField;

@property (nonatomic,weak) IBOutlet UIButton *setButton;

@property (nonatomic) NSString *telStr;

-(IBAction)setButtonSelected:(id)sender;



@end
