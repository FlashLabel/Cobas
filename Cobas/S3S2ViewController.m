//
//  S3S2ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S3S2ViewController.h"

@interface S3S2ViewController ()

@property (assign, nonatomic) IBOutlet UIScrollView *slideScroll;
@property (assign, nonatomic) IBOutlet UIImageView *bg1View;
@property (assign, nonatomic) IBOutlet UIImageView *bg2View;
@property (assign, nonatomic) IBOutlet UIView *anim1View;
@property (assign, nonatomic) IBOutlet UIView *anim2View;
@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (assign, nonatomic) IBOutlet UIButton *nextButton;
@property (assign, nonatomic) IBOutlet UIButton *backButton;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;
- (IBAction)show1View;
- (IBAction)show2View;

- (IBAction)scrollNext;
- (IBAction)scrollBack;

@end

@implementation S3S2ViewController

@synthesize slideScroll = _slideScroll;
@synthesize bg1View = _bg1View;
@synthesize bg2View = _bg2View;
@synthesize anim1View = _anim1View;
@synthesize anim2View = _anim2View;
@synthesize appendixView = _appendixView;
@synthesize nextButton = _nextButton;
@synthesize backButton = _backButton;

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
    [self.slideScroll setContentSize:CGSizeMake(1024*2, 505)];
    self.slideScroll.delegate = self;
    
    [self rezetSlideAnimation];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = floor((scrollView.contentOffset.x - 944 / 2) / 944) + 1;
    if (page == 1)
    {
        self.bg1View.hidden = YES;
        self.bg2View.hidden = NO; 
    }
    else 
    {
        self.bg1View.hidden = NO;
        self.bg2View.hidden = YES;
    }
}

- (IBAction)show1View
{
    CGRect rect1= self.anim1View.frame;
    rect1.size.width = 941;
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationTransitionNone animations:^{self.anim1View.frame = rect1;} completion:nil];
    [self.nextButton setHidden:NO];
    
}

- (IBAction)show2View
{
    CGRect rect2= self.anim2View.frame;
    rect2.size.width = 940;
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationTransitionNone animations:^{self.anim2View.frame = rect2;} completion:nil];
    //[self.backButton setHidden:NO];
    
}

- (IBAction)scrollNext
{
    [self.slideScroll setContentOffset:CGPointMake(1024, 0) animated:YES];
}

- (IBAction)scrollBack
{
    [self.slideScroll setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (void)rezetSlideAnimation
{
    self.appendixView.alpha = 0;
    self.bg1View.hidden = NO;
    self.bg2View.hidden = YES;
    
    CGRect rect1 = self.anim1View.frame;
    rect1.size.width = 0;
    self.anim1View.frame = rect1;
    
    CGRect rect2 = self.anim2View.frame;
    rect2.size.width = 0;
    self.anim2View.frame = rect2;
    
    self.slideScroll.contentOffset = CGPointMake(0, 0);
    
    [self.nextButton setHidden:YES];
    //[self.backButton setHidden:YES];
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
    self.slideScroll = nil;
    self.bg1View = nil;
    self.bg2View = nil;
    self.anim1View = nil;
    self.anim2View = nil;
    self.appendixView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
