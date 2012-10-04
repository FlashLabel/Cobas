//
//  S7S3ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface S7S3ViewController : UIViewController
{
    UIView *_appendixView;
    UIImageView *_part1View;
    UIImageView *_part2View;
    UIImageView *_part3View;
    UIImageView *_part4View;
    UIImageView *_anim1View;
    UIImageView *_anim2View;
    UIImageView *_anim3View;
    UIImageView *_anim4View;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
