//
//  UPBanhuaView.h
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UPBanhuaView : UIView

@property (nonatomic,weak) IBOutlet UITextField *nian1TextField;
@property (nonatomic,weak) IBOutlet UITextField *nian2TextField;
@property (nonatomic,weak) IBOutlet UITextField *nian3TextField;
@property (nonatomic,weak) IBOutlet UIView      *nian4View;
@property (nonatomic,weak) IBOutlet UITextField *nian4TextField;
@property (nonatomic,weak) IBOutlet UIView      *yueView;
@property (nonatomic,weak) IBOutlet UITextField *yueTextField;
@property (nonatomic,weak) IBOutlet UIView      *riView;
@property (nonatomic,weak) IBOutlet UITextField *riTextField;


@property (nonatomic,weak) IBOutlet UIView *heightView;
@property (nonatomic,weak) IBOutlet UITextField *heightTextField;
@property (nonatomic,weak) IBOutlet UIView *widthView;
@property (nonatomic,weak) IBOutlet UITextField *widthTextField;
@property (nonatomic,weak) IBOutlet UIView *depthView;
@property (nonatomic,weak) IBOutlet UITextField *depthTextField;


@property (nonatomic,weak) IBOutlet UIView *materialView;
@property (nonatomic,weak) IBOutlet UILabel *materialLabel;

@property (nonatomic,weak) IBOutlet UIView *verNumFirstVW;
@property (nonatomic,weak) IBOutlet UITextField *verNumFirstTF;
@property (nonatomic,weak) IBOutlet UIView *verNumSecVW;
@property (nonatomic,weak) IBOutlet UITextField *verNumSecTF;
@property (nonatomic,weak) IBOutlet UIView *verNumThirdVW;


-(id)initFromNib;

@end
