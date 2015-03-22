//
//  UPYanShenView.m
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "UPYanShenView.h"

@implementation UPYanShenView

-(id)initFromNib
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"UPYanShenView" owner:self options:nil] lastObject];
    if(self)
    {
        CGRect rect = self.frame;
        rect.size.width = iPhoneWidth;
        self.frame = rect;
    }
    return self;
}

@end
