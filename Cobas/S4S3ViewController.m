//
//  S4S3ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S4S3ViewController.h"

@interface S4S3ViewController ()

@property (assign, nonatomic) IBOutlet UIImageView *anim1View;
@property (assign, nonatomic) IBOutlet UIView *anim2View;
@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (assign, nonatomic) IBOutlet UIImageView *dot1View;
@property (retain, nonatomic) NSTimer *my1Timer;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S4S3ViewController

@synthesize anim1View = _anim1View;
@synthesize anim2View = _anim2View;
@synthesize appendixView = _appendixView;
@synthesize dot1View = _dot1View;
@synthesize my1Timer = _my1Timer;

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

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if ([self.my1Timer isValid])
        [self.my1Timer invalidate];
}

- (void)startSlideAnimation
{
    [UIView animateWithDuration:3 delay:0 options:(UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear) animations:^{self.anim1View.frame = CGRectMake(-61, 0, 600, 102);} completion:nil];
    //[self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24"]];
    //[UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{self.anim2View.frame = CGRectMake(69, 392, 290, 159); self.dot1View.frame=CGRectMake(0, 0, 290, 159);} completion:nil];
//    [self.anim2View setFrame:CGRectMake(69, 392, 290, 159)];
    self.my1Timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tick1:) userInfo:nil repeats:YES];

}

- (void)tick1:(NSTimer *)timer 
{
    if (_timer1Count >= 13)
    {
        [self.my1Timer invalidate];
        return;
    }    
    switch (_timer1Count)
    {
        case 0:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-1"]];
            break;
        case 1:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-2"]];
            break;
        case 2:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-3"]];
            break;
        case 3:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-4"]];
            break;
        case 4:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-5"]];
            break;
        case 5:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-6"]];
            break;
        case 6:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-7"]];
            break;
        case 7:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-8"]];
            break;
        case 8:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-9"]];
            break;
        case 9:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-10"]];
            break;
        case 10:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-11"]];
            break;
        case 11:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-12"]];
            break;
        case 12:
            [self.dot1View setImage:[UIImage imageNamed:@"S4S3Anim24-13"]];
            break;
    }
    _timer1Count ++;
}

- (void)rezetSlideAnimation
{
    _timer1Count = 0;
    if ([self.my1Timer isValid])
        [self.my1Timer invalidate];
    self.appendixView.alpha = 0;

    self.anim1View.frame = CGRectMake(-323, 0, 600, 102);
    [self.anim1View.layer removeAllAnimations];
    
    [self.dot1View setImage:[UIImage imageNamed:nil]];
    
    //[self.dot1View setFrame:CGRectMake(0, -159, 290, 159)];
    //[self.anim2View setFrame:CGRectMake(69, 392+159, 290, 0)];
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
    self.anim1View = nil;
    self.anim2View = nil;
    self.appendixView = nil;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
