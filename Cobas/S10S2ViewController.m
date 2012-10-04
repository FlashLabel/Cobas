//
//  S10S2ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S10S2ViewController.h"

@interface S10S2ViewController ()

@property (assign, nonatomic) IBOutlet UIImageView *mapView;
@property (assign, nonatomic) IBOutlet UIImageView *factsView;
@property (retain, nonatomic) CALayer *animLayer;

- (void)startAnimating;

@end

@implementation S10S2ViewController

@synthesize mapView = _mapView;
@synthesize factsView = _factsView;
@synthesize animLayer = _animLayer;

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
    
    [self.factsView setAlpha:0];
    
    CGRect contRect = self.mapView.frame;
    contRect.origin.y = 0;
    contRect.origin.x = 0;
    contRect.size.width = 1529;
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = contRect;
    maskLayer.contents = (id)[UIImage imageNamed:@"S10S1BgMask"].CGImage;
    maskLayer.shouldRasterize = YES;
    maskLayer.opaque = YES;
    
    contRect.size.width = 1021;
    self.animLayer = [CALayer layer];
    self.animLayer.frame = contRect;
    self.animLayer.contents = (id) [UIImage imageNamed:@"S10S1BgEnd"].CGImage;
    self.animLayer.backgroundColor = [UIColor clearColor].CGColor;
    self.animLayer.mask = maskLayer; 
    self.animLayer.shouldRasterize = YES;
    self.animLayer.opaque = YES;
    
    [self.mapView.layer addSublayer:self.animLayer];
    
    contRect = self.animLayer.mask.frame;
    contRect.origin.x = -1529;
    self.animLayer.mask.frame = contRect;
    
}

- (void)startSlideAnimation
{
    [self.factsView setAlpha:0];
    [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{self.factsView.alpha = 1;} completion:nil];
    
    CGRect contRect = self.animLayer.mask.frame;
    contRect.origin.x = 0;
    self.animLayer.mask.frame = contRect;
    [self startAnimating];
}

- (void)rezetSlideAnimation
{
    [self.factsView setAlpha:0];

    CGRect contRect = self.animLayer.mask.frame;
    contRect.origin.x = -1529;
    self.animLayer.mask.frame = contRect;
}

- (void)startAnimating 
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform.translation.x"];
    animation.fromValue = [NSNumber numberWithFloat:-1529];
    animation.toValue = [NSNumber numberWithFloat:0];
    animation.duration = 1;
    animation.repeatCount = 1;
    animation.removedOnCompletion = YES;
    [self.animLayer.mask addAnimation:animation forKey:@"transform.translation.x"]; 
}

- (void)viewDidDisappear:(BOOL)animated 
{
    [super viewDidDisappear:animated];
    [self.animLayer.mask removeAllAnimations];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.mapView = nil;
    self.factsView = nil;
    self.animLayer = nil;
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
