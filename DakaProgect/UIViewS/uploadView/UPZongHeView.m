//
//  UPZongHeView.m
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "UPZongHeView.h"

@implementation UPZongHeView

-(id)initFromNib
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"UPZongHeView" owner:self options:nil] lastObject];
    if(self)
    {
    }
    return self;
}
@end
