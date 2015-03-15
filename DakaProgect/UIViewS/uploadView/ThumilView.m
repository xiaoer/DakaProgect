//
//  ThumilView.m
//  CreateRecipe
//
//  Created by chenyang on 1/5/13.
//  Copyright (c) 2013 chenyang. All rights reserved.
//

#import "ThumilView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ThumilView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initReuseIdentifer:(NSString *)reuseIdentifer{
    self = [[[NSBundle mainBundle] loadNibNamed:@"ThumilView" owner:self options:nil] objectAtIndex:0];
    if(self){
        self.reuseIdentifier = reuseIdentifer;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
