//
//  S5S6ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S5S6ViewController.h"

@interface S5S6ViewController ()

@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (assign, nonatomic) IBOutlet UIImageView *animView;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S5S6ViewController

@synthesize appendixView = _appendixView;
@synthesize animView = _animView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self rezetSlideAnimation];
}

- (void)startSlideAnimation
{
    
   // [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationCurveLinear animations:^{self.anim2View.frame = CGRectMake(520, 238, 116, 265);} completion:nil];
    CABasicAnimation *animationLeft = [CABasicAnimation animationWithKeyPath: @"transform.rotation"];
    animationLeft.fromValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(1)];
    animationLeft.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(-1)];
    animationLeft.duration = 1;
    animationLeft.repeatCount = MAXFLOAT;
    animationLeft.removedOnCompletion = YES;
    animationLeft.autoreverses = YES;
    [self.animView.layer addAnimation:animationLeft forKey:@"transform.rotation"]; 
}

- (void)rezetSlideAnimation
{
    self.appendixView.alpha = 0;
    [self.animView.layer removeAllAnimations];
    CGAffineTransform rotateRightTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(1));
    [self.animView.layer setAffineTransform:rotateRightTransform];
}

- (IBAction)showAppendix
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendixView.alpha = 1;} completion:nil];
}

- (IBAction)hideAppendix
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendixView.alpha = 0;} completion:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.appendixView = nil;
    self.animView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
