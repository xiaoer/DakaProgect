//
//  ChooseSortVC.m
//  DakaProgect
//
//  Created by super on 15/3/14.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "ChooseSortVC.h"
#import "UtilityFunc.h"
#import "DKGlobalDefine.h"
#import "LRNavigationController.h"
#import "SliderViewController.h"
#import "UploadArtWorkVC.h"
#import "DKGlobalDefine.h"


@interface ChooseSortVC ()

@end

@implementation ChooseSortVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"选择分类"];
    [self.view setBackgroundColor:UIColorFromRGB(0xe5e5e5)];
     [UtilityFunc resetScrlView:_totalScrollView contentInsetWithNaviBar:YES tabBar:NO iOS7ContentInsetStatusBarHeight:0 inidcatorInsetStatusBarHeight:-1];
    _totalScrollView.backgroundColor = UIColorFromRGB(0xe5e5e5);
    NSMutableArray *nameArray = [[NSMutableArray alloc] initWithObjects:@"版画",@"丙烯",@"瓷器",@"雕塑装置",@"民间美术",@"书法手稿",@"水彩",@"水墨",@"素描手绘",@"艺术衍生品",@"油画",@"玉器",@"杂项",@"综合材料",@"视频",nil];
    NSMutableArray *tagsArray = [[NSMutableArray alloc] initWithObjects:@"100",@"101",@"102",@"103",@"104",@"105",@"106",@"107",@"108",@"109",@"110",@"111",@"112",@"113",@"114", nil];
    CGRect rect = CGRectZero;
    rect.origin.x = 10;
    rect.origin.y = 10;
    rect.size.width = ((iPhoneWidth) - 40)/3;
    rect.size.height = ((iPhoneWidth) - 40)/3;
    for(int i = 0; i < [nameArray count];i++)
    {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:[nameArray objectAtIndex:i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor redColor];
        button.tag = [[tagsArray objectAtIndex:i] intValue];
        button.frame = rect;
        [button addTarget:self action:@selector(sortButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [_totalScrollView addSubview:button];
        rect.origin.x += (rect.size.width+10);
        if ( (i+1)%3 == 0 ) {
            rect.origin.x = 10;
            rect.origin.y += (rect.size.height+10);
        }
    }
    _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(rect) +20);
}

-(void)sortButtonSelected:(UIButton *)sendButton
{
    UploadArtWorkVC *artWorkVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"UploadArtWorkVC"];
    artWorkVC.tag = sendButton.tag;
    [(LRNavigationController*)[SliderViewController sharedSliderController].navigationController  pushViewControllerWithLRAnimated:artWorkVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
