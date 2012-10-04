//
//  S3S4ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S3S4ViewController.h"

@interface S3S4ViewController ()

@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (assign, nonatomic) IBOutlet UIImageView *animView;
@property (assign, nonatomic) IBOutlet UIImageView *anim2View;
@property (retain, nonatomic) CALayer *animLayer;
@property (retain, nonatomic) CALayer *anim2Layer;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S3S4ViewController

@synthesize appendixView = _appendixView;
@synthesize animView = _animView;
@synthesize anim2View = _anim2View;
@synthesize animLayer = _animLayer;
@synthesize anim2Layer = _anim2Layer;

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
     self.appendixView.alpha = 0;
    
    CGRect contRect = self.animView.frame;
    contRect.origin.x = 0;
    contRect.origin.y = 0;
    self.animLayer = [CALayer layer];
    self.animLayer.frame = contRect;
    self.animLayer.anchorPoint = CGPointMake(0.5, 0.95);
    self.animLayer.contents = (id) [UIImage imageNamed:@"S3S4Anim"].CGImage;
    self.animLayer.backgroundColor = [UIColor clearColor].CGColor;
    self.animLayer.shouldRasterize = YES;
    self.animLayer.opaque = YES;
    
    self.anim2Layer = [CALayer layer];
    self.anim2Layer.frame = contRect;
    self.anim2Layer.anchorPoint = CGPointMake(0.5, 0.95);
    self.anim2Layer.contents = (id) [UIImage imageNamed:@"S3S4Anim"].CGImage;
    self.anim2Layer.backgroundColor = [UIColor clearColor].CGColor;
    self.anim2Layer.shouldRasterize = YES;
    self.anim2Layer.opaque = YES;
    
    [self.animView.layer addSublayer:self.animLayer];
    [self.anim2View.layer addSublayer:self.anim2Layer];

}

- (void)startSlideAnimation
{
    CABasicAnimation *animationLeft = [CABasicAnimation animationWithKeyPath: @"transform.rotation"];
    animationLeft.fromValue = [NSNumber numberWithFloat:0];
    animationLeft.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(360)];
    animationLeft.duration = 5;
    animationLeft.repeatCount = MAXFLOAT;
    animationLeft.removedOnCompletion = YES;
    [self.animView.layer addAnimation:animationLeft forKey:@"transform.rotation"]; 
    
    CABasicAnimation *animationRight = [CABasicAnimation animationWithKeyPath: @"transform.rotation"];
    animationRight.fromValue = [NSNumber numberWithFloat:0];
    animationRight.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(360)];
    animationRight.duration = 20;
    animationRight.repeatCount = MAXFLOAT;
    animationRight.removedOnCompletion = YES;
    [self.anim2View.layer addAnimation:animationRight forKey:@"transform.rotation"]; 
}

- (void)rezetSlideAnimation
{
     self.appendixView.alpha = 0;
    [self.animView.layer removeAllAnimations];
     [self.anim2View.layer removeAllAnimations];
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

- (void)dealloc
{
    [super dealloc];
    [_animLayer release];
    [_anim2Layer release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
