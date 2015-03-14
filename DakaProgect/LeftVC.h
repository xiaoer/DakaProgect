//
//  LeftVC.h
//  DakaProgect
//
//  Created by super on 15/3/14.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "DKUIViewController.h"
#import "SliderViewController.h"

@interface LeftVC : DKUIViewController

@property (nonatomic,weak) IBOutlet UIButton *mainButton;
@property (nonatomic,weak) IBOutlet UIButton *myArtworkButton;
@property (nonatomic,weak) IBOutlet UIButton *sharedHisButton;
@property (nonatomic,weak) IBOutlet UIButton *draftButton;
@property (nonatomic,weak) IBOutlet UIButton *setButton;

-(IBAction)mainButtonSelected:(id)sender;
-(IBAction)myArtworkButtonSelected:(id)sender;
-(IBAction)sharedHisButtonSelected:(id)sender;
-(IBAction)draftButtonSelected:(id)sender;
-(IBAction)setButtonSelected:(id)sender;


@end
