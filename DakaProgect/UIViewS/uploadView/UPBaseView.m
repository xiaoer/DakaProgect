//
//  UPBaseView.m
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "UPBaseView.h"

@implementation UPBaseView

-(id)initFromNib
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"UPBaseView" owner:self options:nil] lastObject];
    if(self)
    {
        
        _sortView.layer.masksToBounds = YES;
        _sortView.layer.cornerRadius =3.0f;
        _nameView.layer.masksToBounds = YES;
        _nameView.layer.cornerRadius = 3.0f;
        _artistView.layer.masksToBounds = YES;
        _artistView.layer.cornerRadius = 3.0f;
    }
    return self;
}



@end
