//
//  ELCAssetGroupCell.h
//  CreateRecipe
//
//  Created by chenyang on 1/5/13.
//  Copyright (c) 2013 chenyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELCAssetGroupCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *porterImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

-(id)initFromNib;

@end
