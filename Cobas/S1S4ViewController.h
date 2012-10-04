//
//  S1S4ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface S1S4ViewController : UIViewController
{
    UIImageView *_animView;
    UIView *_popupView;
    CALayer *_animLayer;
    UIView *_appendixView;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
