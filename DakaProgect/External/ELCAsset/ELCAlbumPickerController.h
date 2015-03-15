//
//  AlbumPickerController.h
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "ELCAssetGroupCell.h"
#import "ELCAssetTablePicker.h"
#import "CustomViewController.h"


@protocol CameraOverlayVCDelegate;

@interface ELCAlbumPickerController : CustomViewController <ELCDelegate,UITableViewDelegate,UITableViewDataSource>
{
    ALAssetsLibrary *library;
}

@property (nonatomic, strong) NSMutableArray    *assetGroups;
@property (nonatomic, weak)   id <CameraOverlayVCDelegate> delegate;
@property (nonatomic,weak) IBOutlet UITableView *elcTableView;
@property (nonatomic,assign) int selectdNum;
- (IBAction)cancel:(id)sender;
@property(nonatomic,assign) int backType;
@end

