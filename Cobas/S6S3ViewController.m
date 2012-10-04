//
//  S6S3ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S6S3ViewController.h"
#import "FlipViewController.h"

@interface S6S3ViewController ()

@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (assign, nonatomic) IBOutlet UIView *anim1View;
@property (assign, nonatomic) IBOutlet UIView *anim2View;
@property (assign, nonatomic) IBOutlet UIButton *anim1Button;
@property (assign, nonatomic) IBOutlet UIButton *anim2Button;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;
- (IBAction)button1Pressed:(UIButton *)sender;
- (IBAction)button2Pressed:(UIButton *)sender;

@end

@implementation S6S3ViewController

@synthesize appendixView = _appendixView;
@synthesize anim1View = _anim1View;
@synthesize anim2View = _anim2View;
@synthesize anim1Button = _anim1Button;
@synthesize anim2Button = _anim2Button;

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
    
    FlipViewController *flip1 = [[[FlipViewController alloc] init] autorelease];
    flip1.view.frame = CGRectMake(102, 172, 25, 25);
    FlipViewController *flip2 = [[[FlipViewController alloc] init] autorelease];
    flip2.view.frame = CGRectMake(102, 172, 25, 25);
    
    [self.anim1Button addSubview:flip1.view];
    [self.anim2Button addSubview:flip2.view];
}

- (void)startSlideAnimation
{
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationCurveLinear animations:^{self.anim1View.frame = CGRectMake(490, 243, 95, 217);} completion:nil];
    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationCurveLinear animations:^{self.anim2View.alpha = 1;} completion:nil];
}

- (void)rezetSlideAnimation
{
    self.appendixView.alpha = 0;
    self.anim1View.frame = CGRectMake(490, 243, 0, 217);
    self.anim2View.alpha = 0;
    self.anim1Button.tag = 0;
    self.anim2Button.tag = 0;
    [self.anim1View.layer removeAllAnimations];
    [self.anim2View.layer removeAllAnimations];
    [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S6S3Anim1"] forState:UIControlStateNormal];
    [self.anim2Button setBackgroundImage:[UIImage imageNamed:@"S6S3Anim2"] forState:UIControlStateNormal];
}

- (IBAction)button1Pressed:(UIButton *)sender
{
    if(sender.tag)
    {
        sender.tag = 0;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self anim1Button] cache:YES];
        [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S6S3Anim1"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
    else 
    {
        sender.tag = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self anim1Button] cache:YES];
        [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S6S3Anim1Back"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
}

- (IBAction)button2Pressed:(UIButton *)sender
{
    if(sender.tag)
    {
        sender.tag = 0;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self anim2Button] cache:YES];
        [self.anim2Button setBackgroundImage:[UIImage imageNamed:@"S6S3Anim2"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
    else 
    {
        sender.tag = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self anim2Button] cache:YES];
        [self.anim2Button setBackgroundImage:[UIImage imageNamed:@"S6S3Anim2Back"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
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
    self.anim1View = nil;
    self.anim2View = nil;
    self.anim1Button = nil;
    self.anim2Button = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
