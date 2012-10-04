//
//  S4S2ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S4S2ViewController.h"

@interface S4S2ViewController ()

@property (assign, nonatomic) IBOutlet UIView *maskView;
@property (assign, nonatomic) IBOutlet UIImageView *animView;
@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (retain, nonatomic) IBOutletCollection(UIImageView) NSArray *dots1Collection;
@property (retain, nonatomic) IBOutletCollection(UIImageView) NSArray *dots2Collection;
@property (retain, nonatomic) NSTimer *my1Timer;
@property (retain, nonatomic) NSTimer *my2Timer;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S4S2ViewController

@synthesize maskView = _maskView;
@synthesize animView = _animView;
@synthesize appendixView = _appendixView;
@synthesize dots1Collection = _dots1Collection;
@synthesize dots2Collection = _dots2Collection;
@synthesize my1Timer = _my1Timer;
@synthesize my2Timer = _my2Timer;

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
    //[[self.dots1Collection objectAtIndex:0] setHidden:NO];
}

- (void)dealloc
{
    [_dots1Collection release];
    [_dots2Collection release];
    [super dealloc];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if ([self.my1Timer isValid]) {
        [self.my1Timer invalidate];
    }
    if ([self.my2Timer isValid]) {
        [self.my2Timer invalidate];
    }
}
- (void)startSlideAnimation
{
    //[UIView animateWithDuration:1 animations:^{self.maskView.frame = CGRectMake(135, 150, 750, 320);}];
    //[UIView animateWithDuration:1 animations:^{self.animView.frame = CGRectMake(-52, -95, 793, 481);}];
    //[UIView animateWithDuration:1 animations:^{self.animView.alpha = 1;}];
    self.my1Timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(tick1:) userInfo:nil repeats:YES];
    self.my2Timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(tick2:) userInfo:nil repeats:YES];
}

- (void)tick1:(NSTimer *)timer {
    if (_timer1Count >= [_dots1Collection count])
    {
        [self.my1Timer invalidate];
        return;
    }    
    [[self.dots1Collection objectAtIndex:_timer1Count] setHidden:NO];
    _timer1Count ++;
}

- (void)tick2:(NSTimer *)timer {
    if (_timer2Count >= [_dots2Collection count])
    {
        [self.my2Timer invalidate];
        return;
    }    
    [[self.dots2Collection objectAtIndex:_timer2Count] setHidden:NO];
    _timer2Count ++;
}

- (void)rezetSlideAnimation
{
    _timer1Count= 0;
    for (uint i = 0; i< [self.dots1Collection count]; ++i)
    {
        [[self.dots1Collection objectAtIndex:i] setHidden:YES];
    }
    _timer2Count= 0;
    for (uint j = 0; j< [self.dots2Collection count]; ++j)
    {
        [[self.dots2Collection objectAtIndex:j] setHidden:YES];
    }
    if ([self.my1Timer isValid])
        [self.my1Timer invalidate];
    if ([self.my2Timer isValid])
        [self.my2Timer invalidate];
    self.appendixView.alpha = 0;
    //self.maskView.frame = CGRectMake(135, 470, 750, 0);
    //self.animView.frame = CGRectMake(-52, -415, 793, 481);
    //self.animView.alpha = 0;
    //[self.maskView.layer removeAllAnimations];
   // [self.animView.layer removeAllAnimations];
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
    self.maskView = nil;
    self.animView = nil;
    self.appendixView = nil;
    self.my1Timer = nil;
    self.my2Timer = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
