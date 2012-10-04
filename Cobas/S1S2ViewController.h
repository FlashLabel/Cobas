//
//  S1S2ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface S1S2ViewController : UIViewController
{
    UIImageView *_femS1;
    UIImageView *_femS2;
    UIImageView *_femS3;
    UIImageView *_femS4;
    UIImageView *_femS5;
    UIImageView *_femS6;
    UIImageView *_femS7;
    UIImageView *_femS8;
    
    UIImageView *_femB1;
    UIImageView *_femB2;
    UIImageView *_femB3;
    
    UIImageView *_femSNum;
    UIImageView *_femBNum;
    
    UIImageView *_femL1Num;
    UIImageView *_femL2Num;
    UIImageView *_femL3Num;
    UIImageView *_femL4Num;
    UIImageView *_femL5Num;
    UIImageView *_femL6Num;
    
    UIImageView *_femDot;
    
    UIView *_appendixView;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
