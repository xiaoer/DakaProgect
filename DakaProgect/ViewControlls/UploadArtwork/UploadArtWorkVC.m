//
//  UploadArtWorkVC.m
//  DakaProgect
//
//  Created by super on 15/3/14.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "UploadArtWorkVC.h"
#import "DKGlobalDefine.h"


@interface UploadArtWorkVC ()

@end

@implementation UploadArtWorkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarTitle:@"上传艺术品"];
    [self.view setBackgroundColor:UIColorFromRGB(0xe5e5e5)];
    [UtilityFunc resetScrlView:_totalScrollView contentInsetWithNaviBar:YES tabBar:NO iOS7ContentInsetStatusBarHeight:0 inidcatorInsetStatusBarHeight:-1];
    _totalScrollView.backgroundColor= [UIColor whiteColor];
//    UIButton *choosePicButton = [[UIButton alloc] init];
//    [choosePicButton addTarget:self action:@selector(choosePicButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
//    choosePicButton.frame = CGRectMake(100, 100, 100, 100);
//    [choosePicButton setTitle:@"上传图片" forState:UIControlStateNormal];
//    [_totalScrollView addSubview:choosePicButton];
    
    _baseView = [[UPBaseView alloc] initFromNib];
    _baseView.frame = CGRectMake(0, 0, _totalScrollView.frame.size.width, 254);
    [_totalScrollView addSubview:_baseView];
    
//      NSMutableArray *nameArray = [[NSMutableArray alloc] initWithObjects:@"版画",@"丙烯",@"瓷器",@"雕塑装置",@"民间美术",@"书法手稿",@"水彩",@"水墨",@"素描手绘",@"艺术衍生品",@"油画",@"玉器",@"杂项",@"综合材料",@"视频",nil];
    
    
    switch (_tag) {
        case 100:
        {
            _banhuaView = [[UPBanhuaView alloc] initFromNib];
            _banhuaView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 634);
            [_totalScrollView addSubview:_banhuaView];
            _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_banhuaView.frame));
        }
            break;
        case 101:
        {
            _bingXiView = [[UPBingXiView alloc] initFromNib];
              _bingXiView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 568);
            [_totalScrollView addSubview:_bingXiView];
              _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_bingXiView.frame));
        }
            break;
        case 102:
        {
            _chiQiView = [[UPChiQiView alloc] initFromNib];
             _chiQiView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 500);
            [_totalScrollView addSubview:_chiQiView];
            _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_chiQiView.frame));
        }
            break;
        case 103:
        {
            _diaoShuView = [[UPDiaoShuView alloc] initFromNib];
               _diaoShuView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 568);
            [_totalScrollView addSubview:_diaoShuView];
             _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_diaoShuView.frame));
        }
            break;
        case 104:
        {
            _meiShuView = [[UPMeiShuView alloc] initFromNib];
            _meiShuView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 568);
            [_totalScrollView addSubview:_meiShuView];
            _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_meiShuView.frame));
        }
            break;
        case 105:
        {
            _shuFaView = [[UPShuFaView alloc] initFromNib];
             _shuFaView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 751);
            [_totalScrollView addSubview:_shuFaView];
            _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_shuFaView.frame));
        }
            break;
        case 106:
        {
            _shuiCaiView = [[UPShuiCaiView alloc] initFromNib];
            _shuiCaiView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 568);
            [_totalScrollView addSubview:_shuiCaiView];
            _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_shuiCaiView.frame));
        }
            break;
        case 107:
        {
            _shuiMouView = [[UPShuiMouView alloc] initFromNib];
            _shuiMouView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 684);
            [_totalScrollView addSubview:_shuiMouView];
             _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_shuiMouView.frame));
        }
            break;
        case 108:
        {
            _shouHuiView = [[UPShouHuiView alloc] initFromNib];
            _shouHuiView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 634);
            [_totalScrollView addSubview:_shouHuiView];
             _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_shouHuiView.frame));
        }
            break;
        case 109:
        {
            _yanShenView = [[UPYanShenView alloc] initFromNib];
            _yanShenView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 568);
            [_totalScrollView addSubview:_yanShenView];
            _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_yanShenView.frame));
        }
            break;
        case 110:
        {
            _youHuaView = [[UPYouHuaView alloc] initFromNib];
             _youHuaView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 568);
            [_totalScrollView addSubview:_youHuaView];
             _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_youHuaView.frame));
        }
            break;
        case 111:
        {
            _yuQiView = [[UPYuQiView alloc] initFromNib];
            _yuQiView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 500);
            [_totalScrollView addSubview:_yuQiView];
             _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_yuQiView.frame));
        }
            break;
        case 112:
        {
            _zhaXianView = [[UPZhaXianView alloc] initFromNib];
            _zhaXianView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 500);
            [_totalScrollView addSubview:_zhaXianView];
             _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_zhaXianView.frame));
        }
            break;
        case 113:
        {
            _zongHeView = [[UPZongHeView alloc] initFromNib];
            [_totalScrollView addSubview:_zongHeView];
        }
            break;
        case 114:
        {
            _videoView = [[UPVideoView alloc] initFromNib];
            _videoView.frame = CGRectMake(0, 254, _totalScrollView.frame.size.width, 635);
            [_totalScrollView addSubview:_videoView];
            _totalScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_videoView.frame));
        }
            break;
            
        default:
            break;
    }
    
    
}

-(void)choosePicButtonSelected:(UIButton *)sendButton
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"上传图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册中选择",@"手机拍照", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ((long)buttonIndex == 1) {
        NSLog(@"手机拍照");
        
        CameraOverlayVC *v =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CameraOverlayVC"];
        v.delegate = self;
        CATransition* transition = [CATransition animation];
        transition.duration = 0.4f;
        transition.timingFunction = [CAMediaTimingFunction
                                     functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        transition.subtype = kCATransitionFromTop;
        [self.navigationController.view.layer addAnimation:transition forKey:nil];
        
        [(LRNavigationController*)self.navigationController  pushViewControllerWithLRAnimated:v];
    }else if ((long)buttonIndex == 0){
        NSLog(@"从相册中选择");
        ELCAlbumPickerController *v = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ELCAlbumPickerController"];
        v.delegate = self;
        v.selectdNum =0;
        v.backType = 1;
        [(LRNavigationController*)self.navigationController  pushViewControllerWithLRAnimated:v];
    
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
