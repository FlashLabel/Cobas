//
//  S6S7ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface S6S7ViewController : UIViewController
{
    UIView *_appendixView;
    UIImageView *_animView;
    UIImageView *_dot1View;
    UIImageView *_dot2View;
    UIImageView *_dot3View;
    UIImageView *_dot4View;
    UIImageView *_dot5View;
    UIImageView *_dot6View;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
