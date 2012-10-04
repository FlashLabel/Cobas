//
//  S3S2ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface S3S2ViewController : UIViewController <UIScrollViewDelegate>
{
    UIScrollView *_slideScroll;
    UIImageView *_bg1View;
    UIImageView *_bg2View;
    UIView *_anim1View;
    UIView *_appendixView;
    UIButton *_nextButton;
    UIButton *_backButton;
}

- (void)rezetSlideAnimation;

@end
