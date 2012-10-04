//
//  S7S2ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface S7S2ViewController : UIViewController
{
    UIView *_appendixView;
    UIView *_part1View;
    UIView *_part2View;
    UIView *_part3View;
    UIImageView *_anim1View;
    UIImageView *_anim2View;
    UIImageView *_anim3View;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
