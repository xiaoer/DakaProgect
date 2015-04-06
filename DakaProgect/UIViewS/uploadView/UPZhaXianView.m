//
//  UPZhaXianView.m
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "UPZhaXianView.h"

@implementation UPZhaXianView

-(id)initFromNib
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"UPZhaXianView" owner:self options:nil] lastObject];
    if(self)
    {
    }
    return self;
}

@end
