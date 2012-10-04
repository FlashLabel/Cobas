//
//  S5S8ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S5S8ViewController.h"

@interface S5S8ViewController ()

@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (assign, nonatomic) IBOutlet UIImageView *anim3View;
@property (assign, nonatomic) IBOutlet UIView *anim2View;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S5S8ViewController

@synthesize appendixView = _appendixView;
@synthesize anim3View = _anim3View;
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
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationCurveLinear animations:^{self.anim2View.frame = CGRectMake(520, 238, 116, 265);} completion:nil];
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationCurveLinear animations:^{self.anim3View.alpha = 1;} completion:nil];
}

- (void)rezetSlideAnimation
{
    self.appendixView.alpha = 0;
    self.anim2View.frame = CGRectMake(520, 238, 0, 265);
    self.anim3View.alpha = 0;
    [self.anim2View.layer removeAllAnimations];
    [self.anim3View.layer removeAllAnimations];
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
    self.anim3View = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
