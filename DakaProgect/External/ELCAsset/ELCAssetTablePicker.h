//
//  AssetTablePicker.h
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "MBProgressHUD.h"
#import "CustomViewController.h"

@protocol ELCDelegate <NSObject>
-(void)elcPhotoFinished:(NSArray *)imagePaths originPaths:(NSArray *)originPaths;
@end

@interface ELCAssetTablePicker : CustomViewController
{
	NSMutableArray *elcAssets;
	NSMutableArray *cImageThumilPaths;
    NSMutableArray *cImageOriginPaths;
    
    MBProgressHUD *hud;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *selectedNumLabel;
@property (weak, nonatomic) IBOutlet UIButton *comButton;
@property (nonatomic, weak) ALAssetsGroup *assetGroup;
@property (nonatomic, retain) NSMutableArray *elcAssets;
@property (nonatomic, retain) NSString *navTitle;
@property (nonatomic, assign) int selectedNum;
@property (nonatomic,weak) id <ELCDelegate> delegate;

-(void)preparePhotos;
-(IBAction)backAction:(id)sender;
-(IBAction)doneAction:(id)sender;
-(IBAction)buttonClicked:(id)sender;

@end