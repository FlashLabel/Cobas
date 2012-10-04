//
//  MenuViewController.m
//  Cobas
//
//  Created by  on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuViewController.h"

#define timerTime 3.0

@interface MenuViewController ()

@property (assign, nonatomic) IBOutlet UIView *menuView;
@property (retain, nonatomic) NSTimer *menuTimer;
@property (nonatomic) BOOL state;

- (IBAction)menuButtonPressed;

@end

@implementation MenuViewController

@synthesize menuView = _menuView;
@synthesize homeButton = _homeButton;
@synthesize indexButton = _indexButton;
@synthesize contentsButton = _contentsButton;
@synthesize contactsButton = _contactsButton;
@synthesize menuTimer = _menuTimer;
@synthesize state = _state;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.state = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self showMenu:YES];
}
 
- (void)dealloc
{
    [super dealloc];
    [_menuTimer release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.menuView = nil;
    self.homeButton = nil;
    self.indexButton = nil;
    self.contentsButton = nil;
    self.contactsButton = nil;
    self.menuTimer = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    if (self.menuTimer)
//    {
//        [self.menuTimer invalidate];
//        self.menuTimer = nil;
//    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(void)showMenu:(BOOL)state
{
    CGRect menuRect = self.menuView.frame;
    if(state)
    {
        if(self.menuTimer)
        {
            [self.menuTimer invalidate];
            self.menuTimer = nil;
        }
        menuRect.origin.y = 51;
        self.menuTimer = [NSTimer scheduledTimerWithTimeInterval:timerTime target:self selector:@selector(timerTicked:) userInfo:nil repeats:NO];
    }
    else 
        menuRect.origin.y = 100;

    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{self.menuView.frame = menuRect;} completion:nil];
}

#pragma mark - Timer

- (void)timerTicked:(NSTimer*)timer 
{
    [self showMenu:NO];
     self.state = YES;
     self.menuTimer = nil;
}

#pragma mark - Actions

- (IBAction)menuButtonPressed
{
    if(self.state)
    {
        [self showMenu:YES];
        self.state = NO;
    }
}

- (void)switchTimer:(BOOL)state
{
    if (state) {
        [self.menuTimer invalidate];
        self.menuTimer = nil;
    }
    else {
        self.menuTimer = [NSTimer scheduledTimerWithTimeInterval:timerTime target:self selector:@selector(timerTicked:) userInfo:nil repeats:NO];
    }
}

@end
