//
//  S6S5ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S6S5ViewController.h"

@interface S6S5ViewController ()

@property (assign, nonatomic) IBOutlet UIView *step1View;
@property (assign, nonatomic) IBOutlet UIView *step2View;
@property (assign, nonatomic) IBOutlet UIView *step3View;
@property (assign, nonatomic) IBOutlet UIView *step4View;

@property (assign, nonatomic) IBOutlet UIImageView *ans1View;
@property (assign, nonatomic) IBOutlet UIImageView *ans2View;
@property (assign, nonatomic) IBOutlet UIImageView *ans3View;
@property (assign, nonatomic) IBOutlet UIImageView *ans4View;

@property (assign, nonatomic) IBOutlet UIButton *but1Button;
@property (assign, nonatomic) IBOutlet UIButton *but2Button;
@property (assign, nonatomic) IBOutlet UIButton *but3Button;
@property (assign, nonatomic) IBOutlet UIButton *but4Button;
@property (assign, nonatomic) IBOutlet UIView *appendixView;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;
- (IBAction)showAnswer:(id)sender;

@end

@implementation S6S5ViewController

@synthesize step1View = _step1View;
@synthesize step2View = _step2View;
@synthesize step3View = _step3View;
@synthesize step4View = _step4View;

@synthesize ans1View = _ans1View;
@synthesize ans2View = _ans2View;
@synthesize ans3View = _ans3View;
@synthesize ans4View = _ans4View;

@synthesize but1Button = _but1Button;
@synthesize but2Button = _but2Button;
@synthesize but3Button = _but3Button;
@synthesize but4Button = _but4Button;
@synthesize appendixView = _appendixView;

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
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{self.step1View.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.5 delay:0.3 options:UIViewAnimationOptionCurveLinear animations:^{self.step2View.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.5 delay:0.6 options:UIViewAnimationOptionCurveLinear animations:^{self.step3View.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.5 delay:0.9 options:UIViewAnimationOptionCurveLinear animations:^{self.step4View.alpha = 1;} completion:nil];
}

- (void)rezetSlideAnimation
{
    [self.ans1View setHidden:YES];
    [self.ans2View setHidden:YES];
    [self.ans3View setHidden:YES];
    [self.ans4View setHidden:YES];
    
    [self.step1View setAlpha:0];
    [self.step2View setAlpha:0];
    [self.step3View setAlpha:0];
    [self.step4View setAlpha:0];
    
    [self.but1Button setHidden:NO];
    [self.but2Button setHidden:NO];
    [self.but3Button setHidden:NO];
    [self.but4Button setHidden:NO];
    self.appendixView.alpha = 0;
}

- (IBAction)showAppendix
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendixView.alpha = 1;} completion:nil];
}

- (IBAction)hideAppendix
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendixView.alpha = 0;} completion:nil];
}

-(IBAction)showAnswer:(UIButton *)sender
{
    [sender setHidden:YES];
    switch (sender.tag) {
        case 1:
            [self.ans1View setHidden:NO];
            break;
        case 2:
            [self.ans2View setHidden:NO];
            break;
        case 3:
            [self.ans3View setHidden:NO];
            break;
        case 4:
            [self.ans4View setHidden:NO];
            break;
        default:
            break;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.step1View = nil;
    self.step2View = nil;
    self.step3View = nil;
    self.step4View = nil;
    self.ans1View = nil;
    self.ans2View = nil;
    self.ans3View = nil;
    self.ans4View = nil;
    self.appendixView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
