//
//  BIndacatorView.m
//  iLook
//
//  Created by Zhang Yinghui on 11-7-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BIndicator.h"
#import "LxUI.h"
#import "DKGlobalDefine.h"

static UIView * IndicatorView = nil;
static int IndicatorContentTag = 999;

@implementation BIndicator
+ (UIView *)createIndicator:(BOOL)withIndicator message:(NSString *)msg inView:(UIView *)container{
    [self registerForNotifications];
    UIFont *font = [UIFont boldSystemFontOfSize:16];
    CGSize size = [msg sizeWithFont:font];
    float k = withIndicator?(2*28/2):0;
    float w = sqrt(4*size.width*size.height/3+k*k)+k+10;
    size = [msg sizeWithFont:font constrainedToSize:CGSizeMake(w, CGFLOAT_MAX)];
    float h = size.height + withIndicator?28:0;
    h = MAX(h, w*3/4);
    w = MAX(w, 120);
    CGRect rect = CGRectMake(0, 0, w+20, h+20);    
	UIView *view = [[[UIView alloc] initWithFrame:rect] autorelease];
	view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];

	view.layer.cornerRadius = 8.0;
    
    rect = CGRectInset(rect, 10, 10);
    if (withIndicator) {
        UIActivityIndicatorView *aiv = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] autorelease];
        [aiv setFrame:CGRectMake(rect.origin.x+(rect.size.width-28)/2, rect.origin.y, 32, 32)];
        [aiv startAnimating];
        [view addSubview:aiv];
        rect.origin.y += 28;
        rect.size.height -= 28;
    }
//    UILabel *label = createLabel(rect, font, nil, [UIColor whiteColor], [UIColor blackColor], CGSizeMake(0, -1), UITextAlignmentCenter, 0, UILineBreakModeTailTruncation);
    
//    frame.origin.x = ceilf(frame.origin.x);
//    frame.origin.y = ceilf(frame.origin.y);
//    frame.size.width = ceilf(frame.size.width);
//    frame.size.height = ceilf(frame.size.height);
    UILabel *_label = [[UILabel alloc] initWithFrame:rect];
	_label.font = font;
	_label.backgroundColor = [UIColor clearColor];
//	_label.textColor = textColor;
//	if (shadow) {
		_label.shadowColor = [UIColor blackColor];
		_label.shadowOffset = CGSizeMake(0, -1);
//	}
	_label.numberOfLines = 0;
	_label.lineBreakMode = UILineBreakModeTailTruncation;
	_label.textAlignment = UITextAlignmentCenter;
	_label.text = msg;
	_label.textColor = [UIColor whiteColor];
	[view addSubview:_label];
    [view setTag:IndicatorContentTag];
    
    if (IndicatorView && [IndicatorView superview]) {
        [IndicatorView removeFromSuperview];
    }
    //RELEASE(IndicatorView);
    [IndicatorView release],IndicatorView = Nil;
    IndicatorView = [[UIView alloc] initWithFrame:container.bounds];
    view.center = CGPointMake(IndicatorView.bounds.size.width/2, IndicatorView.bounds.size.height*0.4);
    [IndicatorView addSubview:view];
    [container addSubview:IndicatorView];
    [container bringSubviewToFront:IndicatorView];
    return  view;
    
}
+ (UIView *)createIndicator:(BOOL)withIndicator messageArray:(NSArray *)msgArray inView:(UIView *)container{
    [self registerForNotifications];
    UIFont *font = [UIFont boldSystemFontOfSize:17];
    CGRect rect ;
    rect = CGRectMake(0, 0, 213, 156);
	UIView *view = [[[UIView alloc] initWithFrame:rect] autorelease];
	view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
	view.layer.cornerRadius = 8.0;
    
    rect = CGRectMake((rect.size.width - [UIImage imageNamed:@"voice_huatong"].size.width)/2 ,10 , [UIImage imageNamed:@"voice_huatong"].size.width, [UIImage imageNamed:@"voice_huatong"].size.height);
    
    UIImageView *_imageView = [[UIImageView alloc] initWithFrame:rect];
    _imageView.image = [UIImage imageNamed:@"voice_huatong"];
    [view addSubview:_imageView];

    rect = CGRectMake(view.frame.size.width /2 - 50, CGRectGetMaxY(rect)+10, 100, 20);
    UILabel *_introducelabel = [[UILabel alloc] initWithFrame:rect];
    _introducelabel.backgroundColor = [UIColor clearColor];
    _introducelabel.text = nil;
    _introducelabel.font = [UIFont systemFontOfSize:17];
    _introducelabel.textColor = UIColorFromRGB(0xf2f2f2);
    _introducelabel.textAlignment =  NSTextAlignmentCenter;
    [view addSubview:_introducelabel];
    [_introducelabel release],_introducelabel = Nil;
    
    rect = CGRectMake(0, CGRectGetMaxY(rect) +10, view.frame.size.width, 1);
    UILabel *_linelabel = [[UILabel alloc] initWithFrame:rect];
    _linelabel.backgroundColor = UIColorFromRGB(0x666666);
    [view addSubview:_linelabel];
    [_linelabel release],_linelabel = Nil;
    
    rect = CGRectMake(0, CGRectGetMaxY(rect) +6 , view.frame.size.width /3,30);
    UILabel *_firstlabel = [[UILabel alloc] initWithFrame:rect];
	_firstlabel.font = font;
	_firstlabel.backgroundColor = [UIColor clearColor];
    _firstlabel.shadowColor = [UIColor blackColor];
    _firstlabel.shadowOffset = CGSizeMake(0, -1);
	_firstlabel.numberOfLines = 1;
	_firstlabel.lineBreakMode =   UILineBreakModeTailTruncation;
	_firstlabel.textAlignment =  NSTextAlignmentCenter ;
	_firstlabel.text = [msgArray objectAtIndex:0];
	_firstlabel.textColor = UIColorFromRGB(0xf2f2f2);
	[view addSubview:_firstlabel];
    [view setTag:IndicatorContentTag];
    [_firstlabel release],_firstlabel = Nil;
    
    rect.origin.x =view.frame.size.width /3;
    UILabel *_secondlabel = [[UILabel alloc] initWithFrame:rect];
	_secondlabel.font = font;
	_secondlabel.backgroundColor = [UIColor clearColor];
    _secondlabel.shadowColor = [UIColor blackColor];
    _secondlabel.shadowOffset = CGSizeMake(0, -1);
	_secondlabel.numberOfLines = 0;
	_secondlabel.lineBreakMode = UILineBreakModeTailTruncation;
	_secondlabel.textAlignment = NSTextAlignmentCenter ;
	_secondlabel.text = [msgArray objectAtIndex:1];
	_secondlabel.textColor = UIColorFromRGB(0xf2f2f2);
	[view addSubview:_secondlabel];
    [view setTag:IndicatorContentTag];
    [_secondlabel release],_secondlabel = Nil;
    
    rect.origin.x = (view.frame.size.width /3) *2;
    UILabel *_thirdlabel = [[UILabel alloc] initWithFrame:rect];
	_thirdlabel.font = font;
	_thirdlabel.backgroundColor = [UIColor clearColor];
    _thirdlabel.shadowColor = [UIColor blackColor];
    _thirdlabel.shadowOffset = CGSizeMake(0, -1);
	_thirdlabel.numberOfLines = 0;
	_thirdlabel.lineBreakMode = UILineBreakModeTailTruncation;
	_thirdlabel.textAlignment =  NSTextAlignmentCenter ;
	_thirdlabel.text = [msgArray objectAtIndex:2];
	_thirdlabel.textColor = UIColorFromRGB(0xf2f2f2);
	[view addSubview:_thirdlabel];
    [view setTag:IndicatorContentTag];
    [_thirdlabel release],_thirdlabel = Nil;
    
    if (IndicatorView && [IndicatorView superview]) {
        [IndicatorView removeFromSuperview];
    }
    [IndicatorView release],IndicatorView = Nil;
    IndicatorView = [[UIView alloc] initWithFrame:container.bounds];
    view.center = CGPointMake(IndicatorView.bounds.size.width/2, IndicatorView.bounds.size.height*0.4);
    [IndicatorView addSubview:view];
    [container addSubview:IndicatorView];
    [container bringSubviewToFront:IndicatorView];
    return  view;
    
}
+ (UIView *)showMessage:(NSString *)msg duration:(float) t inView:(UIView *)view{
    [self createIndicator:NO message:msg inView:view];
	[self fadeOutWithDelay:t];
	return IndicatorView;
}
+(UIView *)showMessage:(NSString *)msg duration:(float)t{
    UIView *view = [[UIApplication sharedApplication] keyWindow];
    return [BIndicator showMessage:msg duration:t inView:view];
}

+ (UIView *)showMessage:(NSString *)msg inView:(UIView *)view{
    UIView *v = [[[UIView alloc] initWithFrame:view.bounds] autorelease];
    [self createIndicator:YES message:msg inView:v];
	[view addSubview:v];
    IndicatorView = [v retain];
    return v;
}
+ (UIView *)showMessageAndFadeOut:(NSString *)msg{
    return [self showMessage:msg duration:1.0];
}

+ (UIView *)showMessage:(NSString *)msg{
    return [BIndicator showMessage:msg inView:[[UIApplication sharedApplication] keyWindow]];
}
+ (void)fadeOutWithDelay:(float)t{
    [self unregisterFromNotifications];
    if (!IndicatorView && ![IndicatorView superview]) {
       // RELEASE(IndicatorView);
        [IndicatorView release],IndicatorView = Nil;
        return;
    }
    [UIView animateWithDuration:0.2 delay:t 
						options:UIViewAnimationOptionCurveEaseOut
					 animations:^{
                         UIView *contentView = [IndicatorView viewWithTag:IndicatorContentTag];
                         if (!contentView) {
                             return ;
                         }
						 CGAffineTransform _transform = CGAffineTransformMakeScale( 0.1 , 0.1 );
						 [contentView setTransform:_transform];
						 contentView.alpha = 0;
                         
					 } 
					completion :^(BOOL finished){	
                        [IndicatorView removeFromSuperview];
                        //RELEASE(IndicatorView);
                        [IndicatorView release],IndicatorView = Nil;
					}];
}
+ (void)fadeOut{
    [self fadeOutWithDelay:1.0];
}
+ (void)registerForNotifications {
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	[nc addObserver:self selector:@selector(deviceOrientationDidChange:)
			   name:UIDeviceOrientationDidChangeNotification object:nil];
}

+ (void)unregisterFromNotifications {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (void)deviceOrientationDidChange:(NSNotification *)notification
{
    //DLog(@"notification is %d",[notification.object orientation]);
    if ([notification.object orientation] ==1)
    {
        IndicatorView.frame = CGRectMake(0, 0,[[UIApplication sharedApplication] keyWindow].rootViewController.view.frame.size.width, [[UIApplication sharedApplication] keyWindow].rootViewController.view.frame.size.height);
        for (UIView *view in [IndicatorView subviews]) {
            //DLog(@"view tag is %d",view.tag);
            if (view.tag == IndicatorContentTag) {
                view.center = CGPointMake(IndicatorView.bounds.size.width/2, IndicatorView.bounds.size.height*0.4);
            }
        }
    }
    else if ([notification.object orientation] ==3 || [notification.object orientation] ==4)
    {
         IndicatorView.frame = CGRectMake(0, 0,[[UIApplication sharedApplication] keyWindow].rootViewController.view.frame.size.height, [[UIApplication sharedApplication] keyWindow].rootViewController.view.frame.size.width);
        for (UIView *view in [IndicatorView subviews]) {
            //DLog(@"view tag is %d",view.tag);
            if (view.tag == IndicatorContentTag) {
               view.center = CGPointMake(IndicatorView.bounds.size.width/2, IndicatorView.bounds.size.height*0.4);
            }
        }
    }
}
@end
