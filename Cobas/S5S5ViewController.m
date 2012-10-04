//
//  S5S5ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S5S5ViewController.h"

@interface S5S5ViewController ()

@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (assign, nonatomic) IBOutlet UIImageView *animView;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S5S5ViewController

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
    
    [UIView animateWithDuration:1 delay:0 options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse) animations:^{self.animView.alpha = 0;} completion:nil];
}

- (void)rezetSlideAnimation
{
    self.appendixView.alpha = 0;
    self.animView.alpha = 1;
    [self.animView.layer removeAllAnimations];
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
