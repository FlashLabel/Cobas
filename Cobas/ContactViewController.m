//
//  ContactViewController.m
//  Cobas
//
//  Created by  on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

- (IBAction)cobasSiteButton;
- (IBAction)rocheSiteButton;
- (IBAction)rocheContactButton;
- (IBAction)joSiteButton;

- (IBAction)rocheEmailButton;
- (IBAction)joEmailButton;

- (IBAction)closeView;

- (IBAction)legalButton;
- (IBAction)privacyButton;
- (IBAction)termButton;

@end

@implementation ContactViewController

@synthesize delegate = _delegate;

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

- (void)dealloc
{
    _delegate = nil;
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft || interfaceOrientation==UIInterfaceOrientationLandscapeRight)
        return YES;
    return NO;
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissModalViewControllerAnimated:YES];
}

#pragma mark - Actions

- (IBAction)rocheEmailButton
{
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
    [mailComposer setMailComposeDelegate:self];
    [mailComposer setSubject:@"Cobas"];
    [mailComposer setToRecipients:[NSArray arrayWithObject:@"uk.hpv@roche.com"]];
    NSMutableString *body = [NSMutableString stringWithString:@""];
    [mailComposer setMessageBody:body isHTML:NO];
    [self presentModalViewController:mailComposer animated:YES];
    [mailComposer release];
}

- (IBAction)joEmailButton
{
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
    [mailComposer setMailComposeDelegate:self];
    [mailComposer setSubject:@"Cobas"];
    [mailComposer setToRecipients:[NSArray arrayWithObject:@"info@jostrust.org.uk"]];
    NSMutableString *body = [NSMutableString stringWithString:@""];
    [mailComposer setMessageBody:body isHTML:NO];
    [self presentModalViewController:mailComposer animated:YES];
    [mailComposer release];
}

- (IBAction)cobasSiteButton
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.hpv16and18.com"]];
}

- (IBAction)rocheSiteButton
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.roche.co.uk/portal/uk/diagnostics"]];
}

- (IBAction)rocheContactButton
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.roche.co.uk/portal/uk/xxxcontactxxx"]];
}

- (IBAction)joSiteButton
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.jostrust.org.uk"]];
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

- (IBAction)closeView
{
    if([self.delegate respondsToSelector:@selector(closeContactView)])
        [self.delegate closeContactView];
}

@end
