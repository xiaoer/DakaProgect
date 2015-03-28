//
//  UPVideoView.m
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "UPVideoView.h"

@implementation UPVideoView

-(id)initFromNib
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"UPVideoView" owner:self options:nil] lastObject];
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
        
        _videoHourView.layer.masksToBounds = YES;
        _videoHourView.layer.cornerRadius = 3.0f;
        
        _videoMinuteView.layer.masksToBounds = YES;
        _videoMinuteView.layer.cornerRadius = 3.0f;
        
        _videoSecondView.layer.masksToBounds = YES;
        _videoSecondView.layer.cornerRadius = 3.0f;
        
        
        
         _screenScaleView.layer.masksToBounds = YES;
        _screenScaleView.layer.cornerRadius = 3.0f;
         _videoFormView.layer.masksToBounds = YES;
        _videoFormView.layer.cornerRadius = 3.0f;
         _videoColorView.layer.masksToBounds = YES;
        _videoColorView.layer.cornerRadius = 3.0f;
         _videoSoundView.layer.cornerRadius = 3.0f;
        _videoSoundView.layer.masksToBounds = YES;
         _videoSubTitleView.layer.cornerRadius = 3.0f;
        _videoSubTitleView.layer.masksToBounds = YES;
        
        _videoDescView.layer.cornerRadius = 3.0f;
        _videoDescView.layer.masksToBounds = YES;
//        CGRect rect = self.frame;
//        rect.size.width = iPhoneWidth;
//        self.frame = rect;
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

//-(IBAction)screenScaleButtonSelected:(id)sender;
//-(IBAction)videoFormButtonSelected:(id)sender;
//-(IBAction)videoColorButtonSelected:(id)sender;
//-(IBAction)videoSoundButtonSelected:(id)sender;
//-(IBAction)videoSubTitleSelected:(id)sender;



@end
