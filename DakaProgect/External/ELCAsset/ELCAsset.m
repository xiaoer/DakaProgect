//
//  Asset.m
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import "ELCAsset.h"
#import "ELCAssetTablePicker.h"

@implementation ELCAsset


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}


-(id)initFromXib
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"ELCAsset" owner:self options:nil] lastObject];
    if(self)
    {
        
    }
    return self;
    
}

@end

