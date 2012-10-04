//
//  S2S2ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S2S2ViewController.h"
#import "PieSliceLayer.h"

@interface S2S2ViewController ()

@property (assign, nonatomic) IBOutlet UIButton *animButton;
@property (assign, nonatomic) IBOutlet UIImageView *animView;
@property (assign, nonatomic) IBOutlet UIImageView *anim2View;

- (IBAction)addAnimation;

@end

@implementation S2S2ViewController

@synthesize animButton = _animButton;
@synthesize animView = _animView;
@synthesize anim2View = _anim2View;

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
    
    PieSliceLayer *slice = [PieSliceLayer layer];
    slice.strokeColor = [UIColor colorWithWhite:0 alpha:0];
    slice.strokeWidth = 0;
    slice.frame = CGRectMake(0, 0, self.animView.frame.size.width, self.animView.frame.size.height);
    slice.fillColor = [UIColor redColor];
    slice.startAngle = DEGREES_TO_RADIANS(-90);
    slice.endAngle = DEGREES_TO_RADIANS(-90);
    
    CALayer *animLeftLayer = [CALayer layer];
    animLeftLayer.frame = slice.frame;
    animLeftLayer.contents = (id) [UIImage imageNamed:@"S2S2Anim"].CGImage;
    animLeftLayer.backgroundColor = [UIColor clearColor].CGColor;
    animLeftLayer.mask = slice; 
    animLeftLayer.shouldRasterize = YES;
    animLeftLayer.opaque = YES;
    
    [self.animView.layer addSublayer:animLeftLayer];
}

- (IBAction)addAnimation
{
    self.animButton.hidden = YES;
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationTransitionNone animations:^{self.anim2View.alpha = 1;} completion:nil];
    PieSliceLayer *slice = (PieSliceLayer *)[[self.animView.layer.sublayers objectAtIndex:0] mask];
    slice.endAngle = DEGREES_TO_RADIANS(270);
}

- (void)rezetSlideAnimation
{
    self.anim2View.alpha = 0;
    self.animButton.hidden = NO;
    
    PieSliceLayer *slice = (PieSliceLayer *)[[self.animView.layer.sublayers objectAtIndex:0] mask];
    slice.endAngle = DEGREES_TO_RADIANS(-90);
    [slice removeAllAnimations];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.anim2View = nil;
    self.animButton = nil;
    self.animView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
