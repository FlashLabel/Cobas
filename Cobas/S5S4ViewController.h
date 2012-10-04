//
//  S5S4ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface S5S4ViewController : UIViewController
{
    UIView *_appendixView;
    UIButton *_switchButton;
    UIImageView *_bg1View;
    UIImageView *_bg2View;
    UIImageView *_dot1View;
    UIImageView *_dot2View;
    
    NSTimer *_my1Timer;
    NSTimer *_my2Timer;
    uint _timer1Count;
    uint _timer2Count;
    UIButton *_but1Button;
    UIButton *_but2Button;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
