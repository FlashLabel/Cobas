//
//  S5S6ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface S5S6ViewController : UIViewController
{
    UIView *_appendixView;
    UIImageView *_animView;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
