//
//  S10S2ViewController.h
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface S10S2ViewController : UIViewController
{
    UIImageView *_mapView;
    UIImageView *_factsView;
    CALayer *_animLayer;
}

- (void)startSlideAnimation;
- (void)rezetSlideAnimation;

@end
