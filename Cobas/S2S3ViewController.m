//
//  S2S3ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S2S3ViewController.h"
#import "FlipViewController.h"

@interface S2S3ViewController ()

@property (assign, nonatomic) IBOutlet UIButton *anim1Button;
@property (assign, nonatomic) IBOutlet UIButton *anim2Button;

- (IBAction)button1Pressed:(UIButton *)sender;
- (IBAction)button2Pressed:(UIButton *)sender;

@end

@implementation S2S3ViewController

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
    //[self.view addSubview:[[[[FlipViewController alloc] init] view] autorelease]];
    FlipViewController *flip1 = [[[FlipViewController alloc] init] autorelease];
    flip1.view.frame = CGRectMake(153, 275, 25, 25);
    FlipViewController *flip2 = [[[FlipViewController alloc] init] autorelease];
    flip2.view.frame = CGRectMake(153, 275, 25, 25);

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
        [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S2S3Anim1"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
    else 
    {
        sender.tag = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self anim1Button] cache:YES];
        [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S2S3Anim1Back"] forState:UIControlStateNormal];
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
        [self.anim2Button setBackgroundImage:[UIImage imageNamed:@"S2S3Anim2"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
    else 
    {
        sender.tag = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self anim2Button] cache:YES];
        [self.anim2Button setBackgroundImage:[UIImage imageNamed:@"S2S3Anim2Back"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
}

- (void)rezetSlideAnimation
{
    self.anim1Button.tag = 0;
    self.anim2Button.tag = 0;
    [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S2S3Anim1"] forState:UIControlStateNormal];
    [self.anim2Button setBackgroundImage:[UIImage imageNamed:@"S2S3Anim2"] forState:UIControlStateNormal];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.anim1Button = nil;
    self.anim2Button = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
