//
//  S3S6ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface S3S6ViewController : UIViewController
{
    UIView *_appendix1View;
    UIView *_appendix2View;
    UIView *_appendix4View;
    
    UIImageView *_anim1View;
    UIImageView *_anim2View;
    UIImageView *_anim3View;
    UIImageView *_anim4View;
    int _currentNum;
    
    UIButton *_hideButton;
    
    UIButton *_anim1Button;
    UIButton *_anim2Button;
    UIButton *_anim3Button;
    UIButton *_anim4Button;
}

- (void)rezetSlideAnimation;

@end
