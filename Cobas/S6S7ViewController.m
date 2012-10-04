//
//  S6S7ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S6S7ViewController.h"

@interface S6S7ViewController ()

@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (assign, nonatomic) IBOutlet UIImageView *dot1View;
@property (assign, nonatomic) IBOutlet UIImageView *dot2View;
@property (assign, nonatomic) IBOutlet UIImageView *dot3View;
@property (assign, nonatomic) IBOutlet UIImageView *dot4View;
@property (assign, nonatomic) IBOutlet UIImageView *dot5View;
@property (assign, nonatomic) IBOutlet UIImageView *dot6View;
@property (assign, nonatomic) IBOutlet UIImageView *animView;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S6S7ViewController

@synthesize appendixView = _appendixView;
@synthesize animView = _animView;
@synthesize dot1View = _dot1View;
@synthesize dot2View = _dot2View;
@synthesize dot3View = _dot3View;
@synthesize dot4View = _dot4View;
@synthesize dot5View = _dot5View;
@synthesize dot6View = _dot6View;

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
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationCurveLinear animations:^{self.dot1View.frame = CGRectMake(204, 157, 145, 145);
    self.dot2View.frame = CGRectMake(37, 202, 55, 55);
    self.dot3View.frame = CGRectMake(161, 220, 19, 19);
    self.dot4View.frame = CGRectMake(346, 193, 73, 73);
    self.dot5View.frame = CGRectMake(412, 49, 361, 361);
    self.dot6View.frame = CGRectMake(769, 193, 72, 73);
    } completion:nil];
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationTransitionNone animations:^{self.animView.alpha = 1;} completion:nil];
}

- (void)rezetSlideAnimation
{
    self.appendixView.alpha = 0;
    self.animView.alpha = 0;
    self.dot1View.frame = CGRectMake(204+70, 157+70, 5 , 5);
    self.dot2View.frame = CGRectMake(37+25, 202+25, 5, 5);
    self.dot3View.frame = CGRectMake(161+10, 220+10, 5, 5);
    self.dot4View.frame = CGRectMake(346+36, 193+36, 5, 5);
    self.dot5View.frame = CGRectMake(412+180, 49+180, 5, 5);
    self.dot6View.frame = CGRectMake(769+36, 193+36, 5, 5);
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
    self.dot1View = nil;
    self.dot2View = nil;
    self.dot3View = nil;
    self.dot4View = nil;
    self.dot5View = nil;
    self.dot6View = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
