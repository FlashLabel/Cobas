//
//  S10S3ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S10S3ViewController.h"

@interface S10S3ViewController ()

@property (assign, nonatomic) IBOutlet UIImageView *animLeftView;
@property (assign, nonatomic) IBOutlet UIImageView *animRightView;
@property (retain, nonatomic) CALayer *animLeftLayer;
@property (retain, nonatomic) CALayer *animRightLayer;

- (void)startAnimating;

@end

@implementation S10S3ViewController

@synthesize animLeftView = _animLeftView;
@synthesize animRightView = _animRightView;
@synthesize animLeftLayer = _animLeftLayer;
@synthesize animRightLayer = _animRightLayer;

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
    
    CGRect leftRect = self.animLeftView.frame;
    CALayer *maskLeftLayer = [CALayer layer];
    maskLeftLayer.contents = (id)[UIImage imageNamed:@"S10S3AnimMask"].CGImage;
    maskLeftLayer.shouldRasterize = YES;
    maskLeftLayer.opaque = YES;
    maskLeftLayer.anchorPoint = CGPointMake(0, 0.5);
    leftRect.origin.y = 0;
    leftRect.origin.x = leftRect.size.width;
    maskLeftLayer.frame = leftRect;
    CGAffineTransform rotateLeftTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0));
    [maskLeftLayer setAffineTransform:rotateLeftTransform];
    leftRect.origin.y = 0;
    leftRect.origin.x = 0;
    self.animLeftLayer = [CALayer layer];
    self.animLeftLayer.frame = leftRect;
    self.animLeftLayer.contents = (id) [UIImage imageNamed:@"S10S3AnimLeft"].CGImage;
    self.animLeftLayer.backgroundColor = [UIColor clearColor].CGColor;
    self.animLeftLayer.mask = maskLeftLayer; 
    self.animLeftLayer.shouldRasterize = YES;
    self.animLeftLayer.opaque = YES;
    
    ////
    
    CGRect rightRect = self.animLeftView.frame;
    CALayer *maskRightLayer = [CALayer layer];
    maskRightLayer.contents = (id)[UIImage imageNamed:@"S10S3AnimMask"].CGImage;
    maskRightLayer.shouldRasterize = YES;
    maskRightLayer.opaque = YES;
    maskRightLayer.anchorPoint = CGPointMake(1, 0.5);
    rightRect.origin.y = 0;
    rightRect.origin.x = -leftRect.size.width;
    maskRightLayer.frame = rightRect;
    CGAffineTransform rotateRightTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0));
    [maskRightLayer setAffineTransform:rotateRightTransform];
    rightRect.origin.y = 0;
    rightRect.origin.x = 0;
    self.animRightLayer = [CALayer layer];
    self.animRightLayer.frame = rightRect;
    self.animRightLayer.contents = (id) [UIImage imageNamed:@"S10S3AnimRight"].CGImage;
    self.animRightLayer.backgroundColor = [UIColor clearColor].CGColor;
    self.animRightLayer.mask = maskRightLayer; 
    self.animRightLayer.shouldRasterize = YES;
    self.animRightLayer.opaque = YES;
    
    [self.animLeftView.layer addSublayer:self.animLeftLayer];
    [self.animRightView.layer addSublayer:self.animRightLayer];
}

- (void)startSlideAnimation
{
    CGAffineTransform rotateRightTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180));
    [self.animRightLayer.mask setAffineTransform:rotateRightTransform];
    CGAffineTransform rotateLeftTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180));
    [self.animLeftLayer.mask setAffineTransform:rotateLeftTransform];
    
    [self startAnimating];
}

- (void)rezetSlideAnimation
{
    CGAffineTransform rotateRightTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0));
    [self.animRightLayer.mask setAffineTransform:rotateRightTransform];
    CGAffineTransform rotateLeftTransform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0));
    [self.animLeftLayer.mask setAffineTransform:rotateLeftTransform];
    
    [self.animRightLayer.mask removeAllAnimations];
    [self.animLeftLayer.mask removeAllAnimations];
}

- (void)startAnimating 
{
    CABasicAnimation *animationLeft = [CABasicAnimation animationWithKeyPath: @"transform.rotation"];
    animationLeft.fromValue = [NSNumber numberWithFloat:0];
    animationLeft.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(180)];
    animationLeft.duration = 1;
    animationLeft.repeatCount = 1;
    animationLeft.removedOnCompletion = YES;
    [self.animLeftLayer.mask addAnimation:animationLeft forKey:@"transform.rotation"]; 
    
    CABasicAnimation *animationRight = [CABasicAnimation animationWithKeyPath: @"transform.rotation"];
    animationRight.fromValue = [NSNumber numberWithFloat:0];
    animationRight.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(180)];
    animationRight.duration = 1;
    animationRight.repeatCount = 1;
    animationRight.removedOnCompletion = YES;
    [self.animRightLayer.mask addAnimation:animationRight forKey:@"transform.rotation"]; 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.animLeftView = nil;
    self.animRightLayer = nil;
    self.animRightView = nil;
    self.animLeftLayer = nil;
}

-(void)dealloc
{
    [super dealloc];
    [_animLeftLayer release];
    [_animRightLayer release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
