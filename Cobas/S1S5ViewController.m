//
//  S1S5ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S1S5ViewController.h"
#import "FlipViewController.h"

@interface S1S5ViewController ()

@property (assign, nonatomic) IBOutlet UIButton *step1Button;
@property (assign, nonatomic) IBOutlet UIButton *step2Button;
@property (assign, nonatomic) IBOutlet UIView *appendixView;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;
- (IBAction)step1Pressed:(UIButton *)sender;
- (IBAction)step2Pressed:(UIButton *)sender;

@end

@implementation S1S5ViewController

@synthesize step1Button = _step1Button;
@synthesize step2Button = _step2Button;
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
    self.appendixView.alpha = 0;
    
    FlipViewController *flip1 = [[[FlipViewController alloc] init] autorelease];
    flip1.view.frame = CGRectMake(172, 270, 25, 25);
    FlipViewController *flip2 = [[[FlipViewController alloc] init] autorelease];
    flip2.view.frame = CGRectMake(160, 285, 25, 25);
    
    [self.step1Button addSubview:flip1.view];
    [self.step2Button addSubview:flip2.view];

}

- (void)rezetSlideAnimation
{
    self.appendixView.alpha = 0;
    self.step1Button.tag = 0;
    self.step2Button.tag = 0;
    [self.step1Button setBackgroundImage:[UIImage imageNamed:@"S1S5Step1"] forState:UIControlStateNormal];
    [self.step2Button setBackgroundImage:[UIImage imageNamed:@"S1S5Step2"] forState:UIControlStateNormal];
}

- (IBAction)showAppendix
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendixView.alpha = 1;} completion:nil];
}

- (IBAction)hideAppendix
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendixView.alpha = 0;} completion:nil];
}

- (IBAction)step1Pressed:(UIButton *)sender
{
    if (sender.tag)
    {
        sender.tag = 0;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self step1Button] cache:YES];
        [self.step1Button setBackgroundImage:[UIImage imageNamed:@"S1S5Step1"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
    else 
    {
        sender.tag = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self step1Button] cache:YES];
        [self.step1Button setBackgroundImage:[UIImage imageNamed:@"S1S5Ans1"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
}

- (IBAction)step2Pressed:(UIButton *)sender
{
    if (sender.tag)
    {
        sender.tag = 0;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self step2Button] cache:YES];
        [self.step2Button setBackgroundImage:[UIImage imageNamed:@"S1S5Step2"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
    else 
    {
        sender.tag = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self step2Button] cache:YES];
        [self.step2Button setBackgroundImage:[UIImage imageNamed:@"S1S5Ans2"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.step1Button = nil;
    self.step2Button = nil;
    self.appendixView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
