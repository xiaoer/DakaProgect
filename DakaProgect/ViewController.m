//
//  ViewController.m
//  DakaProgect
//
//  Created by lipeifeng on 15/2/11.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 100, 100, 100);
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
