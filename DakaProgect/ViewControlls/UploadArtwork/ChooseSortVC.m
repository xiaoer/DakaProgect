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

@interface ChooseSortVC ()

@end

@implementation ChooseSortVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"选择分类"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
     [UtilityFunc resetScrlView:_totalScrollView contentInsetWithNaviBar:YES tabBar:NO iOS7ContentInsetStatusBarHeight:0 inidcatorInsetStatusBarHeight:-1];
    _totalScrollView.backgroundColor = [UIColor blackColor];
    NSMutableArray *nameArray = [[NSMutableArray alloc] initWithObjects:@"版画",@"丙烯",@"瓷器",@"雕塑装置",@"民间美术",@"书法手稿",@"水彩",@"水墨",@"素描手绘",@"艺术衍生品",@"油画",@"玉器",@"杂项",@"综合材料", nil];
    
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
        button.tag = 100 +i;
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
    NSLog(@"sendbutton tag is %ld",(long)sendButton.tag);
    UploadArtWorkVC *artWorkVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"UploadArtWorkVC"];
    [(LRNavigationController*)[SliderViewController sharedSliderController].navigationController  pushViewControllerWithLRAnimated:artWorkVC];
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
