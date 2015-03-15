//
//  ELCAssetGroupCell.m
//  CreateRecipe
//
//  Created by chenyang on 1/5/13.
//  Copyright (c) 2013 chenyang. All rights reserved.
//

#import "ELCAssetGroupCell.h"

@implementation ELCAssetGroupCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initFromNib
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"ELCAssetGroupCell" owner:self options:nil] lastObject];
    if(self)
    {
        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
