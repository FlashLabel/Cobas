//
//  S9S2ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMovieViewController.h"

@interface S9S2ViewController : UIViewController
{
    CMovieViewController *_player;
    UIView *_appendix1View;
    UIView *_appendix2View;
    UIView *_appendix3View;
}

- (void)rezetSlideAnimation;

@end
