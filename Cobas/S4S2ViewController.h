//
//  S4S2ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface S4S2ViewController : UIViewController
{
    UIView *_maskView;   
    UIImageView *_animView;
    UIView *_appendixView;
    NSArray *_dots1Collection;
    NSArray *_dots2Collection;
    NSTimer *_my1Timer;
    NSTimer *_my2Timer;
    uint _timer1Count;
    uint _timer2Count;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
