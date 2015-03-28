//
//  BaseTextView.m
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "BaseTextView.h"

@implementation BaseTextView

-(id)initView
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xdfdfdf);
        _textView = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, (iPhoneWidth) -39, 30)];
        [_textView setTextColor:[UIColor blackColor]];
        [self addSubview:_textView];
    }
    return self;
}

@end
