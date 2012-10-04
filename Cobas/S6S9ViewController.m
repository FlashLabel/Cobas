//
//  S6S9ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S6S9ViewController.h"

@interface S6S9ViewController ()

@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (assign, nonatomic) IBOutlet UIImageView *anim2View;
@property (assign, nonatomic) IBOutlet UIView *anim1View;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S6S9ViewController

@synthesize appendixView = _appendixView;
@synthesize anim1View = _anim1View;
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
}

- (void)startSlideAnimation
{
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationCurveLinear animations:^{self.anim1View.frame = CGRectMake(288, 256, 396, 199);} completion:nil];
    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationCurveLinear animations:^{self.anim2View.alpha = 1;} completion:nil];
}

- (void)rezetSlideAnimation
{
    self.appendixView.alpha = 0;
    self.anim1View.frame = CGRectMake(288, 256, 0, 199);
    self.anim2View.alpha = 0;
    [self.anim1View.layer removeAllAnimations];
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
    self.anim2View = nil;
    self.anim1View = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
