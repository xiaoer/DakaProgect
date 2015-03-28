//
//  UPVideoView.h
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UPVideoView : UIView<UITextViewDelegate>

@property (nonatomic,weak) IBOutlet UITextField *nian1TextField;
@property (nonatomic,weak) IBOutlet UITextField *nian2TextField;
@property (nonatomic,weak) IBOutlet UITextField *nian3TextField;
@property (nonatomic,weak) IBOutlet UIView      *nian4View;
@property (nonatomic,weak) IBOutlet UITextField *nian4TextField;
@property (nonatomic,weak) IBOutlet UIView      *yueView;
@property (nonatomic,weak) IBOutlet UITextField *yueTextField;
@property (nonatomic,weak) IBOutlet UIView      *riView;
@property (nonatomic,weak) IBOutlet UITextField *riTextField;

@property (nonatomic,weak) IBOutlet UIView *videoHourView;
@property (nonatomic,weak) IBOutlet UITextField *hourTextField;
@property (nonatomic,weak) IBOutlet UIView *videoMinuteView;
@property (nonatomic,weak) IBOutlet UITextField *minuteTextField;
@property (nonatomic,weak) IBOutlet UIView *videoSecondView;
@property (nonatomic,weak) IBOutlet UITextField *secondTextField;

@property (nonatomic,weak) IBOutlet UIView *screenScaleView;
@property (nonatomic,weak) IBOutlet UIView *videoFormView;
@property (nonatomic,weak) IBOutlet UIView *videoColorView;
@property (nonatomic,weak) IBOutlet UIView *videoSoundView;
@property (nonatomic,weak) IBOutlet UIView *videoSubTitleView;
@property (nonatomic,weak) IBOutlet UIView *videoDescView;


@property (nonatomic,weak) IBOutlet UILabel *screenScaleLabel;
@property (nonatomic,weak) IBOutlet UILabel *videoFormLabel;
@property (nonatomic,weak) IBOutlet UILabel *videoColorLabel;
@property (nonatomic,weak) IBOutlet UILabel *videoSoundLabel;
@property (nonatomic,weak) IBOutlet UILabel *videoSubTitleLabel;

@property (nonatomic,weak) IBOutlet UITextView *videoDescTextView;
@property (nonatomic,weak) IBOutlet UILabel *videoDescLabel;

@property (nonatomic,weak) IBOutlet UIButton *screenScaleButton;
@property (nonatomic,weak) IBOutlet UIButton *videoFormButton;
@property (nonatomic,weak) IBOutlet UIButton *videoColorButton;
@property (nonatomic,weak) IBOutlet UIButton *videoSoundButton;
@property (nonatomic,weak) IBOutlet UIButton *videoSubTitleButton;

-(id)initFromNib;

//-(IBAction)screenScaleButtonSelected:(id)sender;
//-(IBAction)videoFormButtonSelected:(id)sender;
//-(IBAction)videoColorButtonSelected:(id)sender;
//-(IBAction)videoSoundButtonSelected:(id)sender;
//-(IBAction)videoSubTitleSelected:(id)sender;

@end
