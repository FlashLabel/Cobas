//
//  S4S4ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S4S4ViewController.h"

@interface S4S4ViewController ()

@property (assign, nonatomic) IBOutlet UIImageView *animView;
@property (assign, nonatomic) IBOutlet UIImageView *maskView;
@property (retain, nonatomic) CALayer *animLayer;
@property (retain, nonatomic) CALayer *anim2Layer;
@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (assign, nonatomic) IBOutlet UIView *upMaskView;
@property (assign, nonatomic) IBOutlet UIImageView *upImageView;
@property (assign, nonatomic) IBOutlet UIImageView *textView;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S4S4ViewController

@synthesize animView = _animView;
@synthesize maskView = _maskView;
@synthesize animLayer = _animLayer;
@synthesize anim2Layer = _anim2Layer;
@synthesize appendixView = _appendixView;
@synthesize upMaskView = _upMaskView;
@synthesize upImageView = _upImageView;
@synthesize textView = _textView;

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
     
//    CGRect contRect = self.animView.frame;
//    contRect.origin.y = 0;
//    contRect.origin.x = 0;
//    self.anim2Layer = [CALayer layer];
//    self.anim2Layer.frame = contRect;
//    self.anim2Layer.contents = (id)[UIImage imageNamed:@"S4S4Mask"].CGImage;
//    self.anim2Layer.shouldRasterize = YES;
//    self.anim2Layer.opaque = YES;
//    
//    contRect.size.width = contRect.size.width*2;
//    self.animLayer = [CALayer layer];
//    self.animLayer.frame = contRect;
//    self.animLayer.contents = (id) [UIImage imageNamed:@"S4S4Anim"].CGImage;
//    self.animLayer.backgroundColor = [UIColor clearColor].CGColor;
//    self.animLayer.mask = self.anim2Layer; 
//    self.animLayer.shouldRasterize = YES;
//    self.animLayer.opaque = YES;
//    
//    [self.animView.layer addSublayer:self.animLayer];
    //[self.animView.layer addSublayer:maskLayer];
}

- (void)startSlideAnimation
{
    [UIView animateWithDuration:2 delay:0 options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear) animations:^{self.animView.frame = CGRectMake(82, 287, 1412, 234);} completion:nil];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{self.upMaskView.frame = CGRectMake(800, 247, 0, 313);} completion:nil];
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{self.upImageView.frame = CGRectMake(-800, 0, 1024, 313);} completion:nil];
    [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationOptionTransitionNone animations:^{self.textView.alpha = 1;} completion:nil];
}

- (void)rezetSlideAnimation
{
    self.textView.alpha = 0;
    self.appendixView.alpha = 0;
    self.animView.frame = CGRectMake(-706+82, 287, 1412, 234);
    self.upMaskView.frame = CGRectMake(0, 247, 800, 313);
    self.upImageView.frame = CGRectMake(0, 0, 1024, 313);
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
    self.animView = nil;
    self.maskView = nil;
    self.appendixView = nil;
    self.upMaskView = nil;
    self.upImageView = nil;
    self.textView = nil;
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
