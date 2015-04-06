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
        
        _widthView.layer.masksToBounds = YES;
        _widthView.layer.cornerRadius = 3.0f;
        _heightView.layer.masksToBounds = YES;
        _heightView.layer.cornerRadius = 3.0f;
        
        _depthView.hidden = YES;
        
        _materialView.layer.masksToBounds = YES;
        _materialView.layer.cornerRadius = 3.0f;
        
        _verNumFirstVW.layer.masksToBounds =YES;
        _verNumFirstVW.layer.cornerRadius = 3.0f;
        _verNumSecVW.layer.masksToBounds = YES;
        _verNumSecVW.layer.cornerRadius = 3.0f;
        _verNumThirdVW.hidden = YES;
        
        _zhuanbiaoView.layer.masksToBounds = YES;
        _zhuanbiaoView.layer.cornerRadius = 3.0f;
        
        _signView.layer.masksToBounds = YES;
        _signView.layer.cornerRadius = 3.0f;
        
        _pingXianView.layer.masksToBounds = YES;
        _pingXianView.layer.cornerRadius = 3.0f;
        
        _videoDescView.layer.masksToBounds = YES;
        _videoDescView.layer.cornerRadius = 3.0f;
    }
    return self;
    
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        _videoDescLabel.text = @"详细信息:";
    }else{
        _videoDescLabel.text = @"";
    }
}

@end
