//
//  UPShuiMouView.m
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "UPShuiMouView.h"

@implementation UPShuiMouView

-(id)initFromNib
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"UPShuiMouView" owner:self options:nil] lastObject];
    if(self)
    {
    }
    return self;
}

@end
