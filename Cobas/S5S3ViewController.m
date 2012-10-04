//
//  S5S3ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S5S3ViewController.h"
#import "FlipViewController.h"

@interface S5S3ViewController ()

@property (assign, nonatomic) IBOutlet UIButton *anim1Button;
@property (assign, nonatomic) IBOutlet UIButton *anim2Button;
@property (assign, nonatomic) IBOutlet UIView *appendixView;

- (IBAction)button1Pressed:(UIButton *)sender;
- (IBAction)button2Pressed:(UIButton *)sender;
- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S5S3ViewController

@synthesize appendixView = _appendixView;
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
    flip1.view.frame = CGRectMake(172, 272, 25, 25);
    FlipViewController *flip2 = [[[FlipViewController alloc] init] autorelease];
    flip2.view.frame = CGRectMake(160, 285, 25, 25);
    
    [self.anim1Button addSubview:flip1.view];
    [self.anim2Button addSubview:flip2.view];
    
}

- (IBAction)button1Pressed:(UIButton *)sender
{
    if(sender.tag)
    {
        sender.tag = 0;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self anim1Button] cache:YES];
        [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S5S3Anim1"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
    else 
    {
        sender.tag = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self anim1Button] cache:YES];
        [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S5S3Anim1Back"] forState:UIControlStateNormal];
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
        [self.anim2Button setBackgroundImage:[UIImage imageNamed:@"S5S3Anim2"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
    else 
    {
        sender.tag = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self anim2Button] cache:YES];
        [self.anim2Button setBackgroundImage:[UIImage imageNamed:@"S5S3Anim2Back"] forState:UIControlStateNormal];
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

- (void)rezetSlideAnimation
{
    self.anim1Button.tag = 0;
    self.anim2Button.tag = 0;
    [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S5S3Anim1"] forState:UIControlStateNormal];
    [self.anim2Button setBackgroundImage:[UIImage imageNamed:@"S5S3Anim2"] forState:UIControlStateNormal];
    self.appendixView.alpha = 0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.anim1Button = nil;
    self.anim2Button = nil;
    self.appendixView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
