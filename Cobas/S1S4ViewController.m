//
//  S1S4ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S1S4ViewController.h"

@interface S1S4ViewController ()

@property (assign, nonatomic) IBOutlet UIView *popupView;
@property (assign, nonatomic) IBOutlet UIImageView *animView;
@property (retain, nonatomic) CALayer *animLayer;
@property (assign, nonatomic) IBOutlet UIView *appendixView;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;
- (IBAction)showPopup;
- (IBAction)hidePopup;

@end

@implementation S1S4ViewController

@synthesize popupView = _popupView;
@synthesize animView = _animView;
@synthesize animLayer = _animLayer;
@synthesize appendixView = _appendixView;

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
    
    self.popupView.alpha = 0;
    CGRect contRect = self.animView.frame;
    contRect.origin.x = 0;
    contRect.origin.y = 0;
    self.animLayer = [CALayer layer];
    self.animLayer.frame = contRect;
    self.animLayer.contents = (id) [UIImage imageNamed:@"S1S4Anim"].CGImage;
    self.animLayer.backgroundColor = [UIColor clearColor].CGColor;
 //   self.animLayer.mask = maskLayer; 
    self.animLayer.shouldRasterize = YES;
    self.animLayer.opaque = YES;
    
    [self.animView.layer addSublayer:self.animLayer];
    self.appendixView.alpha = 0;
}

- (void)startSlideAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1];
    animation.toValue = [NSNumber numberWithFloat:0];
    animation.duration = 1;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = YES;
    animation.autoreverses = YES;
    [self.animLayer addAnimation:animation forKey:@"opacity"]; 
    
 //   self.animView.alpha = 0;
 //   [UIView animateWithDuration:1 delay:0 options:enum{1 << 4, 1<<3} animations:^{self.animView.alpha = 1;} completion:nil];
}

- (void)rezetSlideAnimation
{
    self.popupView.alpha = 0;
    [self.animLayer removeAllAnimations]; 
    self.appendixView.alpha = 0;
}

- (IBAction)showAppendix
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendixView.alpha = 1;} completion:nil];
}

- (IBAction)hideAppendix
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendixView.alpha = 0;} completion:nil];
}

- (IBAction)showPopup
{
    self.popupView.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{self.popupView.alpha = 1;} completion:nil];
}

- (IBAction)hidePopup
{
    self.popupView.alpha = 1;
    [UIView animateWithDuration:0.5 animations:^{self.popupView.alpha = 0;} completion:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.popupView = nil;
    self.animView = nil;
    self.appendixView = nil;
}

- (void)dealloc
{
    [super dealloc];
    [_animLayer release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
