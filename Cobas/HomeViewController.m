//
//  HomeViewController.m
//  Cobas
//
//  Created by  on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "PresentationTableViewController.h"

@interface HomeViewController ()

- (IBAction)startPresentation;

- (IBAction)legalButton;
- (IBAction)privacyButton;
- (IBAction)termButton;

@end

@implementation HomeViewController

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft || interfaceOrientation==UIInterfaceOrientationLandscapeRight)
        return YES;
    return NO;
}

#pragma mark - Actions
- (IBAction)startPresentation
{
//    [UIView beginAnimations:@"transition" context:nil];
//    [UIView setAnimationDuration:1.0];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:NO];
    [self.navigationController pushViewController:[[[PresentationTableViewController alloc] init] autorelease] animated:YES];
//    [UIView commitAnimations];
}

- (IBAction)legalButton
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.roche.co.uk/portal/uk/dia_disclaimer"]];
}

- (IBAction)privacyButton
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.roche.co.uk/portal/uk/xxxprivacyxxx"]];
}

- (IBAction)termButton
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.roche.co.uk/portal/uk/xxxlegalxxx"]];
}


@end
