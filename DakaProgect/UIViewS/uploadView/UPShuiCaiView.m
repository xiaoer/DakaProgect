//
//  UPShuiCaiView.m
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "UPShuiCaiView.h"

@implementation UPShuiCaiView

-(id)initFromNib
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"UPShuiCaiView" owner:self options:nil] lastObject];
    if(self)
    {
        CGRect rect = self.frame;
        rect.size.width = iPhoneWidth;
        self.frame = rect;
    }
    return self;
}

@end
