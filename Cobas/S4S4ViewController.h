//
//  S4S4ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface S4S4ViewController : UIViewController
{
    UIImageView *_animView;
    UIImageView *_maskView;
    CALayer *_animLayer;
    CALayer *_anim2Layer;
    
    UIView *_appendixView;
    UIView *_upMaskView; 
    UIImageView *_upImageView; 
    UIImageView *_textView; 
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
