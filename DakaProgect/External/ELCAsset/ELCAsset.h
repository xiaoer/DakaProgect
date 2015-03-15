//
//  Asset.h
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "AssetObject.h"

@interface ELCAsset : UIView

@property (nonatomic, weak) IBOutlet UIImageView *overlayView;
@property (nonatomic, weak) IBOutlet UIImageView *thumilView;
@property (nonatomic, weak) IBOutlet UIButton *button;
@end