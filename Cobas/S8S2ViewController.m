//
//  S8S2ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S8S2ViewController.h"
#import "FlipViewController.h"

@interface S8S2ViewController ()

@property (assign, nonatomic) IBOutlet UIButton *anim1Button;

- (IBAction)button1Pressed:(UIButton *)sender;

@end

@implementation S8S2ViewController

@synthesize anim1Button = _anim1Button;

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
    
    FlipViewController *flip1 = [[[FlipViewController alloc] init] autorelease];
    flip1.view.frame = CGRectMake(351, 275, 25, 25);
    
    [self.anim1Button addSubview:flip1.view];
}

- (IBAction)button1Pressed:(UIButton *)sender
{
    if(sender.tag)
    {
        sender.tag = 0;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self anim1Button] cache:YES];
        [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S8S2Anim"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
    else 
    {
        sender.tag = 1;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self anim1Button] cache:YES];
        [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S8S2AnimBack"] forState:UIControlStateNormal];
        [UIView commitAnimations];
    }
}

- (void)rezetSlideAnimation
{
    self.anim1Button.tag = 0;
    [self.anim1Button setBackgroundImage:[UIImage imageNamed:@"S8S2Anim"] forState:UIControlStateNormal];
}

- (void)dealloc
{
    NSLog(@">>> !!!!!");

    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.anim1Button = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
