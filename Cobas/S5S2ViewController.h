//
//  S5S2ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface S5S2ViewController : UIViewController
{
    UIImageView *_part1View;
    UIImageView *_part2View;
    UIImageView *_part3View;
    UIImageView *_part4View;
    UIView *_appendixView;
    UIButton *_part1Button;
    UIButton *_part2Button;
    UIButton *_part3Button;
    UIButton *_part4Button;
}

- (void)rezetSlideAnimation;

@end
