//
//  S4S3ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface S4S3ViewController : UIViewController
{
    UIImageView *_anim1View;
    UIView *_appendixView;
    
    UIImageView *_anim21View;
    UIImageView *_anim22View;
    UIImageView *_anim23View;
    UIImageView *_anim24View;
    
    UIView *_anim2View;
    
    UIImageView *_dot1View;
    NSTimer *_my1Timer;
    uint _timer1Count;

}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
