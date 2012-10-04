//
//  S5S8ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface S5S8ViewController : UIViewController
{
    UIView *_appendixView;
    UIView *_anim2View;
    UIImageView *_anim3View;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
