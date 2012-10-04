//
//  S6S9ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface S6S9ViewController : UIViewController
{
    UIView *_anim1View;
    UIImageView *_anim2View;
    UIView *_appendixView;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
