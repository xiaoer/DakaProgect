//
//  AssetCell.m
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import "ELCAssetCell.h"
#import "ELCAsset.h"
#import "AssetObject.h"
#import "DKGlobalDefine.h"
#import "DKGlobalDefine.h"

@implementation ELCAssetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = CGRectZero;
        rect = self.frame;
        rect.size.width = iPhoneWidth;
        rect.size.height = (iPhoneWidth - 12)/3 +6;
        self.frame = rect;
        self.contentView.frame = rect;
        self.contentView.backgroundColor = UIColorFromRGB(0xe5e5e5);
        self.backgroundColor = UIColorFromRGB(0xe5e5e5);
        
        rect.origin.x = 0;
        rect.origin.y = 3;
        rect.size.width = (iPhoneWidth - 12)/3;
        rect.size.height = (iPhoneWidth - 12)/3;
        
        _thumil0 = [[ELCAsset alloc] initFromXib];
        _thumil0.frame = rect;
        [self.contentView addSubview:_thumil0];
        rect.origin.x +=((iPhoneWidth - 12)/3 +6);
        _thumil1 = [[ELCAsset alloc] initFromXib];
        _thumil1.frame = rect;
        [self.contentView addSubview:_thumil1];
        rect.origin.x +=((iPhoneWidth - 12)/3 +6);
        _thumil2 = [[ELCAsset alloc] initFromXib];
        _thumil2.frame = rect;
        [self.contentView addSubview:_thumil2];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
