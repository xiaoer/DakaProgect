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
        _sortView.layer.cornerRadius =5.0f;
        _nameView.layer.masksToBounds = YES;
        _nameView.layer.cornerRadius = 5.0f;
        _artistView.layer.masksToBounds = YES;
        _artistView.layer.cornerRadius = 5.0f;
//        CGRect rect = self.frame;
//        rect.size.width = iPhoneWidth;
//        rect.size.height = 254;
//        self.frame = rect;
        
//        float ly = 70;
//        
//        rect = CGRectZero;
//        rect.origin.x = 12;
//        rect.origin.y = ly;
//        rect.size.width = (iPhoneWidth) -24;
//        rect.size.height = 50;
//        _nameTextView = [[BaseTextView alloc] initView];
//        _nameTextView.frame = rect;
//        _nameTextView.textView.placeholder = @"艺术品名称";
//        [self addSubview:_nameTextView];
//        
//        ly += 67;
//        rect.origin.y =ly;
//        _artistTextView = [[BaseTextView alloc] initView];
//        _artistTextView.textView.placeholder = @"艺术家姓名";
//        _artistTextView.frame = rect;
//        [self addSubview:_artistTextView];
//
//        ly += 67;
//        rect.origin.y = ly;
//        _sortView = [[BaseTextView alloc] initView];
//        _sortView.textView.placeholder = @"分类";
//        _sortView.frame = rect;
//        _sortView.userInteractionEnabled = NO;
//        [self addSubview:_sortView];
        
        
    }
    return self;
}



@end
