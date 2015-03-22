//
//  UploadArtWorkVC.h
//  DakaProgect
//
//  Created by super on 15/3/14.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "CustomViewController.h"
#import "ELCAlbumPickerController.h"
#import "LRNavigationController.h"
#import "CameraOverlayVC.h"


#import "UPBaseView.h"
#import "UPVideoView.h"
#import "UPBanhuaView.h"
#import "UPBingXiView.h"
#import "UPChiQiView.h"
#import "UPDiaoShuView.h"
#import "UPMeiShuView.h"
#import "UPShuFaView.h"
#import "UPShuiCaiView.h"
#import "UPShuiMouView.h"
#import "UPShouHuiView.h"
#import "UPYanShenView.h"
#import "UPYouHuaView.h"
#import "UPYuQiView.h"
#import "UPZhaXianView.h"
#import "UPZongHeView.h"


@interface UploadArtWorkVC : CustomViewController<UIActionSheetDelegate,CameraOverlayVCDelegate>

@property (nonatomic,weak) IBOutlet UIScrollView *totalScrollView;

@property (nonatomic) int tag;

@property (nonatomic,strong) UPBaseView     *baseView;
@property (nonatomic,strong) UPVideoView    *videoView;
@property (nonatomic,strong) UPBanhuaView   *banhuaView;
@property (nonatomic,strong) UPBingXiView   *bingXiView;
@property (nonatomic,strong) UPChiQiView    *chiQiView;
@property (nonatomic,strong) UPDiaoShuView  *diaoShuView;
@property (nonatomic,strong) UPMeiShuView   *meiShuView;
@property (nonatomic,strong) UPShuFaView    *shuFaView;
@property (nonatomic,strong) UPShuiCaiView  *shuiCaiView;
@property (nonatomic,strong) UPShuiMouView  *shuiMouView;
@property (nonatomic,strong) UPShouHuiView  *shouHuiView;
@property (nonatomic,strong) UPYanShenView  *yanShenView;
@property (nonatomic,strong) UPYouHuaView   *youHuaView;
@property (nonatomic,strong) UPYuQiView     *yuQiView;
@property (nonatomic,strong) UPZhaXianView  *zhaXianView;
@property (nonatomic,strong) UPZongHeView   *zongHeView;

@end
