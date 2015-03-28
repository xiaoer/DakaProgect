//
//  UPBaseView.h
//  DakaProgect
//
//  Created by super on 15/3/22.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTextView.h"

@interface UPBaseView : UIView
@property (nonatomic,weak) IBOutlet UIView  *nameView;
@property (nonatomic,weak) IBOutlet UITextField *nameTextField;
@property (nonatomic,weak) IBOutlet UIView  *artistView;
@property (nonatomic,weak) IBOutlet UITextField *artistTextField;
@property (nonatomic,weak) IBOutlet UIView  *sortView;
@property (nonatomic,weak) IBOutlet UILabel  *typeLabel;

//@property (nonatomic,strong) BaseTextView  *artistTextView;
//@property (nonatomic,strong) BaseTextView  *sortView;
//@property (nonatomic,strong) UILabel       *typeLabel;

-(id)initFromNib;


@end
