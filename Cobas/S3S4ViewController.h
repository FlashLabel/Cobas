//
//  S3S4ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface S3S4ViewController : UIViewController
{
    UIView *_appendixView;
    UIImageView *_animView;
    UIImageView *_anim2View;
    CALayer *_animLayer;
    CALayer *_anim2Layer;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
