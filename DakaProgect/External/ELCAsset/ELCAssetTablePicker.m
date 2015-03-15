//
//  AssetTablePicker.m
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import "ELCAssetTablePicker.h"
#import "ELCAssetCell.h"
#import "ELCAsset.h"
#import "ELCAlbumPickerController.h"
#import "CameraOverlayVC.h"
#import "FileHelper.h"
#import "MBProgressHUD.h"
#import "AssetObject.h"
#import "AppDelegate.h"
#import "LxUI.h"
#import "BIndicator.h"
#import "DKGlobalDefine.h"

@implementation ELCAssetTablePicker

@synthesize assetGroup, elcAssets,delegate;

-(void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xf1f1f1);
    self.tableView.backgroundColor =UIColorFromRGB(0xf1f1f1);
    [self setNaviBarTitle:_navTitle];

    [UtilityFunc resetScrlView:_tableView contentInsetWithNaviBar:YES tabBar:NO iOS7ContentInsetStatusBarHeight:0 inidcatorInsetStatusBarHeight:-1];
    [_comButton setBackgroundImage:[LxUI imageTensileWithName:@"Denglu"] forState:UIControlStateNormal];
    [_comButton setBackgroundImage:[LxUI imageTensileWithName:@"Denglu_dianji"] forState:UIControlStateHighlighted];
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    hud = [[MBProgressHUD alloc] initWithView:app.window];
    [app.window addSubview:hud];
    hud.removeFromSuperViewOnHide = YES;
        
	[self.tableView setSeparatorColor:[UIColor clearColor]];
	[self.tableView setAllowsSelection:NO];

    self.elcAssets = [[NSMutableArray alloc] init];
    cImageThumilPaths = [[NSMutableArray alloc] init];
    cImageOriginPaths = [[NSMutableArray alloc] init];
	[self performSelectorInBackground:@selector(preparePhotos) withObject:nil];
     self.selectedNumLabel.text = [NSString stringWithFormat:@"%d",_selectedNum];
    // Show partial while full list loads
	//[self.tableView performSelector:@selector(reloadData) withObject:nil afterDelay:.5];
}

-(void)preparePhotos
{

    //同步过程
    [self.assetGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) 
     {         
         if(result == nil) {
             return;
         }
         
         AssetObject *object = [[AssetObject alloc] init];
         object.asset = result;
         object.seleted = NO;
         
         [self.elcAssets addObject:object];
     }];
	[self.tableView reloadData];
    if ([self.elcAssets count] >0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:(ceil([self.assetGroup numberOfAssets] / 3.0))-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }
}


-(void)preData:(id)sender
{    
    NSMutableArray *selecteds = [[NSMutableArray alloc] init];
    
    for(AssetObject *object in self.elcAssets){
        if(object.seleted){
            [selecteds addObject:object];
        }
    }
    
    float processNum = 30.0;
    
    int arrayc = ceil(selecteds.count / processNum);
    
    NSMutableArray *allArrays = [[NSMutableArray alloc] init];
    
    for(int i = 0;i<arrayc;i++){
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [allArrays addObject:array];

        int  length = (selecteds.count - i*processNum) < processNum ? (selecteds.count - i*processNum) : processNum;
        
        NSRange range = NSMakeRange(i*processNum, length);
        
        NSArray *arrayn = [selecteds subarrayWithRange:range];
    
        [array addObjectsFromArray:arrayn];
    }
    
    [self performSelectorOnMainThread:@selector(preDataDone:) withObject:allArrays waitUntilDone:YES];
}

-(void)preDataDone:(NSMutableArray *)allArrays{
    [NSThread detachNewThreadSelector:@selector(writeFile:) toTarget:self withObject:allArrays];
}

-(void)writeFileDone:(id)sender{
    [hud hide:YES];
    [self.delegate elcPhotoFinished:cImageThumilPaths originPaths:cImageOriginPaths];
}

-(void)writeFile:(NSMutableArray *)allArrays{
    
    if(allArrays.count == 0){
        [self performSelectorOnMainThread:@selector(writeFileDone:) withObject:nil waitUntilDone:YES];
        return;
    }
    
    NSMutableArray *array = [allArrays objectAtIndex:0];
    
    int i =0;
    for(AssetObject *object in array){
        @autoreleasepool {
            
        NSString *imageThumilPath = [FileHelper generateImageThumilPath];
        NSString *imageOriginPath = [FileHelper genarateImagePath];
        
        CGImageRef ref = [[object.asset defaultRepresentation] fullScreenImage];
        UIImage *imageFull = [UIImage imageWithCGImage:ref];
        
        //保存相机缩略图
        UIImage *thumilImage = [FileHelper scaleToSize:imageFull size:CGSizeMake(150, 150)];
        NSData *thumilImageData = UIImageJPEGRepresentation(thumilImage, 0.7);
        if([thumilImageData writeToFile:imageThumilPath atomically:YES]){
            [cImageThumilPaths addObject:imageThumilPath];
        }
        
        //保存原图缩略图 按比例缩放，最短边不超过1000
        UIImage *originImage = [FileHelper rotateImage:imageFull boundw:1000.0f];
        NSData *originImageData = UIImageJPEGRepresentation(originImage, 0.7);
        if([originImageData writeToFile:imageOriginPath atomically:YES]){
            [cImageOriginPaths addObject:imageOriginPath];
        }
        
        NSLog(@"width:%f height:%f",originImage.size.width,originImage.size.height);
        NSLog(@"i:%d",i++);
        }
        
        hud.detailsLabelText = [NSString stringWithFormat:@"剩余 %d 张", _selectedNum--];
    }
    
    [allArrays removeObjectAtIndex:0];
    
    [self performSelectorOnMainThread:@selector(preDataDone:) withObject:allArrays waitUntilDone:YES];
    
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) doneAction:(id)sender {
    [hud show:YES];
    hud.labelText = @"正在加载...";
    hud.detailsLabelText = [NSString stringWithFormat:@"剩余 %d 张",_selectedNum];
    
    [NSThread detachNewThreadSelector:@selector(preData:) toTarget:self withObject:nil];
}

#pragma mark UITableViewDataSource Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  ((iPhoneWidth) - 12)/3 +6;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ceil([self.assetGroup numberOfAssets] / 3.0);
}

- (NSArray*)assetsForIndexPath:(NSIndexPath*)_indexPath {
    
	int index = (int)(_indexPath.row*3);
	int maxIndex = (int)(_indexPath.row*3+2);
    
	// DLog(@"Getting assets for %d to %d with array count %d", index, maxIndex, [assets count]);
    
	if(maxIndex < [self.elcAssets count]) {
        
		return [NSArray arrayWithObjects:[self.elcAssets objectAtIndex:index],
				[self.elcAssets objectAtIndex:index+1],
				[self.elcAssets objectAtIndex:index+2],
				nil];
	}
    
	else if(maxIndex-1 < [self.elcAssets count]) {
        
		return [NSArray arrayWithObjects:[self.elcAssets objectAtIndex:index],
				[self.elcAssets objectAtIndex:index+1],
				nil];
	}
    
	else if(maxIndex-2 < [self.elcAssets count]) {
        
		return [NSArray arrayWithObjects:[self.elcAssets objectAtIndex:index],
				nil];
	}
    
	return nil;
}

-(IBAction)buttonClicked:(UIButton *)sender{
    int index =(int) sender.tag;
    AssetObject *object = [self.elcAssets objectAtIndex:index];
    if (!object.seleted) {
        if (_selectedNum ==9)
        {
            [BIndicator showMessage:@"最多为9张，谢谢" duration:1.5f];
            return;
        }
    }
    object.seleted = !object.seleted;
    
    if(object.seleted){
        _selectedNum ++;
    }else{
        _selectedNum --;
    }
    
    self.selectedNumLabel.text = [NSString stringWithFormat:@"%d",_selectedNum];
    
    [self.tableView reloadData];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"ELCAssetCell";
        
    ELCAssetCell *cell = (ELCAssetCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if(cell == nil)
    {
        cell = [[ELCAssetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell.thumil0.button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
           [cell.thumil1.button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
           [cell.thumil2.button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray *aCellAssets = [self assetsForIndexPath:indexPath];
    
    cell.thumil0.hidden = YES;
    cell.thumil1.hidden = YES;
    cell.thumil2.hidden = YES;
    
    cell.thumil0.overlayView.hidden = YES;
    cell.thumil1.overlayView.hidden = YES;
    cell.thumil2.overlayView.hidden = YES;
    
    switch (aCellAssets.count) {
        case 1:
        {
            AssetObject *object0 = [aCellAssets objectAtIndex:0];
            cell.thumil0.hidden = NO;
            cell.thumil0.thumilView.image = [UIImage imageWithCGImage:object0.asset.thumbnail];
            cell.thumil0.button.tag = indexPath.row*3 +0;
            
            cell.thumil0.overlayView.hidden = !object0.seleted;
            
            break;
        }
        case 2:
        {
            AssetObject *object0 = [aCellAssets objectAtIndex:0];
            AssetObject *object1 = [aCellAssets objectAtIndex:1];
            cell.thumil0.hidden = NO;
            cell.thumil0.thumilView.image = [UIImage imageWithCGImage:object0.asset.thumbnail];
            cell.thumil0.button.tag = indexPath.row*3 +0;
            cell.thumil0.overlayView.hidden = !object0.seleted;
            
            cell.thumil1.hidden = NO;
            cell.thumil1.thumilView.image = [UIImage imageWithCGImage:object1.asset.thumbnail];
            cell.thumil1.button.tag = indexPath.row*3 +1;
            cell.thumil1.overlayView.hidden = !object1.seleted;
            break;
        }
        case 3:
        {
            AssetObject *object0 = [aCellAssets objectAtIndex:0];
            AssetObject *object1 = [aCellAssets objectAtIndex:1];
            AssetObject *object2 = [aCellAssets objectAtIndex:2];
            cell.thumil0.hidden = NO;
            cell.thumil0.thumilView.image = [UIImage imageWithCGImage:object0.asset.thumbnail];
            cell.thumil0.button.tag = indexPath.row*3 +0;
            cell.thumil0.overlayView.hidden = !object0.seleted;
            
            cell.thumil1.hidden = NO;
            cell.thumil1.thumilView.image = [UIImage imageWithCGImage:object1.asset.thumbnail];
            cell.thumil1.button.tag = indexPath.row*3 +1;
            cell.thumil1.overlayView.hidden = !object1.seleted;
            
            cell.thumil2.hidden = NO;
            cell.thumil2.thumilView.image = [UIImage imageWithCGImage:object2.asset.thumbnail];
            cell.thumil2.button.tag = indexPath.row*3 +2;
            cell.thumil2.overlayView.hidden = !object2.seleted;
            
            break;
        }
            
        default:
            break;
    }

    return cell;
}

- (void)viewDidUnload {
    hud = nil;
    [self setElcAssets:nil];
    [self setTableView:nil];
    [self setSelectedNumLabel:nil];
    [super viewDidUnload];
}

@end
