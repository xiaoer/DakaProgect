//
//  ViewController.m
//  DakaProgect
//
//  Created by lipeifeng on 15/2/11.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "ViewController.h"
#import "ChooseSortVC.h"
#import "LRNavigationController.h"
#import "SliderViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIButton *uploadButton = [[UIButton alloc] init];
    [uploadButton setTitle:@"上传按钮" forState:UIControlStateNormal];
    [uploadButton setFrame:CGRectMake(100, 100, 100, 100)];
    [uploadButton addTarget:self action:@selector(uploadButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:uploadButton];
}

-(void)uploadButtonSelected:(UIButton *)sendButton
{
    ChooseSortVC *chooseSortVc =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ChooseSortVC"];
    [(LRNavigationController*)[SliderViewController sharedSliderController].navigationController  pushViewControllerWithLRAnimated:chooseSortVc];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
