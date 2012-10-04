//
//  S10S3ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface S10S3ViewController : UIViewController
{
    UIImageView *_animLeftView;
    UIImageView *_animRightView;
    CALayer *_animLeftLayer;
    CALayer *_animRightLayer;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
