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
    [self setNaviBarTitle:@"上传艺术品:选择类别"];
    [self.view setBackgroundColor:UIColorFromRGB(0xe5e5e5)];
     [UtilityFunc resetScrlView:_totalScrollView contentInsetWithNaviBar:YES tabBar:NO iOS7ContentInsetStatusBarHeight:0 inidcatorInsetStatusBarHeight:-1];
    _totalScrollView.backgroundColor = UIColorFromRGB(0xe5e5e5);
    NSMutableArray *normalArray = [[NSMutableArray alloc] initWithObjects:@"youhua_normal",@"bingxi_nomal",@"banhua_nomal",@"shuicai_normal",@"shuimo_normal",@"shugao_normal",@"sumiao_normal",@"zonghe_normal",@"diaoshu_normal",@"yangsheng_normal",@"yinxiang_normal",@"shexian_normal",@"mingjian_normal",@"yuqi_normal",@"ciqi_normal",nil];
    NSMutableArray *selectedArray = [[NSMutableArray alloc] initWithObjects:@"youhua_selected",@"bingxi_selected",@"banhua_selected",@"shuicai_selected",@"shuimo_selected",@"shugao_selected",@"sumiao_selected",@"zonghe_selected.png",@"diaoshu_selected",@"yangsheng_selected",@"yinxiang_selected",@"shexian_selected",@"mingjian_selected",@"yuqi_selected",@"ciqi_selected",nil];
    
    NSMutableArray *nameArray = [[NSMutableArray alloc] initWithObjects:@"油画",@"丙烯",@"版画",@"水彩",@"水墨",@"书法手稿",@"素描手绘",@"综合材料",@"雕塑装置",@"艺术衍生品",@"影像",@"摄影",@"民间美术",@"玉器",@"瓷器",nil];
    
//    NSMutableArray *nameArray = [[NSMutableArray alloc] initWithObjects:@"版画",@"丙烯",@"瓷器",@"雕塑装置",@"民间美术",@"书法手稿",@"水彩",@"水墨",@"素描手绘",@"艺术衍生品",@"油画",@"玉器",@"杂项",@"综合材料",@"视频",nil];
    NSMutableArray *tagsArray = [[NSMutableArray alloc] initWithObjects:@"100",@"101",@"102",@"103",@"104",@"105",@"106",@"107",@"108",@"109",@"110",@"111",@"112",@"113",@"114", nil];
    CGRect rect = CGRectZero;
    rect.origin.x = ((iPhoneWidth) - 240)/4;
    rect.origin.y = 10;
    rect.size.width = 80;
    rect.size.height = 80;
    for(int i = 0; i < [nameArray count];i++)
    {
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundImage:[UIImage imageNamed:[normalArray objectAtIndex:i]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:[selectedArray objectAtIndex:i]] forState:UIControlStateHighlighted];
        [button setBackgroundImage:[UIImage imageNamed:[selectedArray objectAtIndex:i]] forState:UIControlStateSelected];
//        [button setTitle:[nameArray objectAtIndex:i] forState:UIControlStateNormal];
//        button.backgroundColor = [UIColor redColor];
        button.tag = [[tagsArray objectAtIndex:i] intValue];
        button.frame = rect;
        [button addTarget:self action:@selector(sortButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [_totalScrollView addSubview:button];
        rect.origin.x += (rect.size.width+((iPhoneWidth) - 240)/4);
        if ( (i+1)%3 == 0 ) {
            rect.origin.x = ((iPhoneWidth) - 240)/4;
            rect.origin.y += (rect.size.height+30);
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
