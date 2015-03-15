//
//  ThumilView.h
//  CreateRecipe
//
//  Created by chenyang on 1/5/13.
//  Copyright (c) 2013 chenyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMGridViewCell.h"

@interface ThumilView : GMGridViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
-(id)initReuseIdentifer:(NSString *)reuseIdentifer;
@end
