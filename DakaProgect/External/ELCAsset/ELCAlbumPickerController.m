//
//  AlbumPickerController.m
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import "ELCAlbumPickerController.h"
//#import "EditStepViewController.h"
//#import "UploadSuipaiViewController.h"
//#import "UploadTableViewController.h"
//
//#import "CameraOverlayViewController.h"
#import "UploadArtWorkVC.h"
#import "CameraOverlayVC.h"
#import "LRNavigationController.h"
#import "UploadArtWorkVC.h"
#import "SliderViewController.h"
#import "DKGlobalDefine.h"



@interface ELCAlbumPickerController() 
@end

@implementation ELCAlbumPickerController

@synthesize assetGroups,delegate,backType;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.assetGroups = [[NSMutableArray alloc] init];
    self.view.backgroundColor = UIColorFromRGB(0xe5e5e5);
    self.elcTableView.backgroundColor =UIColorFromRGB(0xe5e5e5);
    [UtilityFunc resetScrlView:_elcTableView contentInsetWithNaviBar:YES tabBar:NO iOS7ContentInsetStatusBarHeight:0 inidcatorInsetStatusBarHeight:-1];
    [self setNaviBarTitle:@"相册"];
    library = [[ALAssetsLibrary alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^
    {
        
        // Group enumerator Block
        void (^assetGroupEnumerator)(ALAssetsGroup *, BOOL *) = ^(ALAssetsGroup *group, BOOL *stop) 
        {
            if (group == nil) 
            {
                return;
            }
            
            [self.assetGroups addObject:group];

            // Reload albums
            [self performSelectorOnMainThread:@selector(reloadTableView) withObject:nil waitUntilDone:YES];
        };
        
        // Group Enumerator Failure Block
        void (^assetGroupEnumberatorFailure)(NSError *) = ^(NSError *error) {

            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"%@ - %@", [error localizedDescription], [error localizedFailureReason]] delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
            [alert show];
            
        };	
        
        [library enumerateGroupsWithTypes:ALAssetsGroupAll
                               usingBlock:assetGroupEnumerator 
                             failureBlock:assetGroupEnumberatorFailure];
        
    });    
}

-(void)reloadTableView {
	[self.elcTableView reloadData];
}

- (IBAction)cancel:(id)sender {
    if(self.backType == 0){//from create recipe
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if(self.backType ==1){//from suipai
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else if(self.backType ==2){//from camera
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.assetGroups count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"idc_group_cell";
    
    ELCAssetGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ELCAssetGroupCell alloc] initFromNib];
          cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    // Get count
    ALAssetsGroup *g = (ALAssetsGroup*)[self.assetGroups objectAtIndex:indexPath.row];
    [g setAssetsFilter:[ALAssetsFilter allPhotos]];
    NSInteger gCount = [g numberOfAssets];
    
    [cell.porterImageView setImage:[UIImage imageWithCGImage:[(ALAssetsGroup*)[self.assetGroups objectAtIndex:indexPath.row] posterImage]]];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",[g valueForProperty:ALAssetsGroupPropertyName]];
    cell.countLabel.text = [NSString stringWithFormat:@"(%d)",(int)gCount];
    
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    
	ELCAssetTablePicker *picker = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"elc_table_picker"];
    picker.delegate = self;
    picker.selectedNum = _selectdNum;
    // Move me    
    picker.assetGroup = [self.assetGroups objectAtIndex:indexPath.row];
    [picker.assetGroup setAssetsFilter:[ALAssetsFilter allPhotos]];
    ALAssetsGroup *g = (ALAssetsGroup*)[self.assetGroups objectAtIndex:indexPath.row];
    picker.navTitle =[g valueForProperty:ALAssetsGroupPropertyName];
	[(LRNavigationController*)self.navigationController  pushViewControllerWithLRAnimated:picker];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return 57;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    library = nil;
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

#pragma mark-
#pragma mark- CVODelegate
-(void)elcPhotoFinished:(NSArray *)imagePaths originPaths:(NSArray *)originPaths{
    
    UIViewController *to = nil;
    for(UIViewController *cv in self.navigationController.viewControllers){
        if([cv isKindOfClass:[UploadArtWorkVC class]]){
            to = cv;
            break;
        }
    }
  
    [self.navigationController popToViewController:to animated:YES];
    [self.delegate photoLibrayFinised:imagePaths originPaths:originPaths];

}

@end
