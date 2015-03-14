//
//  LeftVC.m
//  DakaProgect
//
//  Created by super on 15/3/14.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "LeftVC.h"

@interface LeftVC ()

@end

@implementation LeftVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)mainButtonSelected:(id)sender
{
    [self AllButtonSetUnSelected:sender];
    [[SliderViewController sharedSliderController] showContentControllerWithModel:@"ViewController"];
}
-(IBAction)myArtworkButtonSelected:(id)sender
{
    [self AllButtonSetUnSelected:sender];
    [[SliderViewController sharedSliderController] showContentControllerWithModel:@"MyArtworkVC"];
}
-(IBAction)sharedHisButtonSelected:(id)sender
{
    [self AllButtonSetUnSelected:sender];
    [[SliderViewController sharedSliderController] showContentControllerWithModel:@"SharedHisVC"];
}
-(IBAction)draftButtonSelected:(id)sender
{
    [self AllButtonSetUnSelected:sender];
    [[SliderViewController sharedSliderController] showContentControllerWithModel:@"DraftVC"];
}
-(IBAction)setButtonSelected:(id)sender
{
    [self AllButtonSetUnSelected:sender];
    [[SliderViewController sharedSliderController] showContentControllerWithModel:@"SettingVC"];
}

-(void)AllButtonSetUnSelected:(id)sender
{
    NSArray *buttonArray = [NSArray arrayWithObjects:_mainButton,_myArtworkButton,_sharedHisButton,_draftButton,_setButton,nil];
    for (int i =0 ; i < [buttonArray count]; i ++) {
        [[buttonArray objectAtIndex:i] setSelected:NO];
    }
    [(UIButton *)sender setSelected:YES];
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
