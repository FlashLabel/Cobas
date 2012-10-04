//
//  S1S6ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface S1S6ViewController : UIViewController
{
    UIView *_step1View;
    UIView *_step2View;
    UIView *_step3View;
    UIView *_step4View;
    UIImageView *_ans1View;
    UIImageView *_ans2View;
    UIImageView *_ans3View;
    UIImageView *_ans4View;
    UIButton *_but1Button;
    UIButton *_but2Button;
    UIButton *_but3Button;
    UIButton *_but4Button;
    UIView *_appendixView;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
