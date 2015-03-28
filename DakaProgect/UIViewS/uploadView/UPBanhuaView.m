//
//  UPBanhuaView.m
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "UPBanhuaView.h"

@implementation UPBanhuaView

-(id)initFromNib
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"UPBanhuaView" owner:self options:nil] lastObject];
    if(self)
    {
        _nian1TextField.layer.masksToBounds = YES;
        _nian1TextField.layer.cornerRadius = 3.0f;
        _nian2TextField.layer.masksToBounds = YES;
        _nian2TextField.layer.cornerRadius = 3.0f;
        _nian3TextField.layer.masksToBounds = YES;
        _nian3TextField.layer.cornerRadius = 3.0f;
        _nian4View.layer.masksToBounds = YES;
        _nian4View.layer.cornerRadius = 3.0f;
        _yueView.layer.masksToBounds = YES;
        _yueView.layer.cornerRadius  = 3.0f;
        _riView.layer.masksToBounds = YES;
        _riView.layer.cornerRadius = 3.0f;
    }
    return self;
    
}

@end
