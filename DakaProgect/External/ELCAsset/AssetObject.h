//
//  AssetObject.h
//  CreateRecipe
//
//  Created by chenyang on 1/24/13.
//  Copyright (c) 2013 chenyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface AssetObject : NSObject

@property (nonatomic,retain) ALAsset *asset;
@property (nonatomic,assign) BOOL seleted;
@end
