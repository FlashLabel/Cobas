//
//  S1S2ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S1S2ViewController.h"

@interface S1S2ViewController ()

@property (assign, nonatomic) IBOutlet UIImageView *femS1;
@property (assign, nonatomic) IBOutlet UIImageView *femS2;
@property (assign, nonatomic) IBOutlet UIImageView *femS3;
@property (assign, nonatomic) IBOutlet UIImageView *femS4;
@property (assign, nonatomic) IBOutlet UIImageView *femS5;
@property (assign, nonatomic) IBOutlet UIImageView *femS6;
@property (assign, nonatomic) IBOutlet UIImageView *femS7;
@property (assign, nonatomic) IBOutlet UIImageView *femS8;
@property (assign, nonatomic) IBOutlet UIImageView *femB1;
@property (assign, nonatomic) IBOutlet UIImageView *femB2;
@property (assign, nonatomic) IBOutlet UIImageView *femB3;
@property (assign, nonatomic) IBOutlet UIImageView *femSNum;
@property (assign, nonatomic) IBOutlet UIImageView *femBNum;
@property (assign, nonatomic) IBOutlet UIImageView *femL1Num;
@property (assign, nonatomic) IBOutlet UIImageView *femL2Num;
@property (assign, nonatomic) IBOutlet UIImageView *femL3Num;
@property (assign, nonatomic) IBOutlet UIImageView *femL4Num;
@property (assign, nonatomic) IBOutlet UIImageView *femL5Num;
@property (assign, nonatomic) IBOutlet UIImageView *femL6Num;
@property (assign, nonatomic) IBOutlet UIImageView *femDot;
@property (assign, nonatomic) IBOutlet UIView *appendixView;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S1S2ViewController

@synthesize femB1 = _femB1;
@synthesize femB2 = _femB2;
@synthesize femB3 = _femB3;
@synthesize femS1 = _femS1;
@synthesize femS2 = _femS2;
@synthesize femS3 = _femS3;
@synthesize femS4 = _femS4;
@synthesize femS5 = _femS5;
@synthesize femS6 = _femS6;
@synthesize femS7 = _femS7;
@synthesize femS8 = _femS8;
@synthesize femSNum = _femSNum;
@synthesize femBNum = _femBNum;
@synthesize femL1Num = _femL1Num;
@synthesize femL2Num = _femL2Num;
@synthesize femL3Num = _femL3Num;
@synthesize femL4Num = _femL4Num;
@synthesize femL5Num = _femL5Num;
@synthesize femL6Num = _femL6Num;
@synthesize femDot = _femDot;
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
    
    [self rezetSlideAnimation];
}

- (void)startSlideAnimation
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.femS1.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.3 delay:0.2 options:UIViewAnimationOptionTransitionNone animations:^{ self.femS2.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.3 delay:0.4 options:UIViewAnimationOptionTransitionNone animations:^{ self.femS3.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.3 delay:0.6 options:UIViewAnimationOptionTransitionNone animations:^{ self.femS4.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.3 delay:0.8 options:UIViewAnimationOptionTransitionNone animations:^{ self.femS5.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.3 delay:1 options:UIViewAnimationOptionTransitionNone animations:^{ self.femS6.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.3 delay:1.2 options:UIViewAnimationOptionTransitionNone animations:^{ self.femS7.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.3 delay:1.4 options:UIViewAnimationOptionTransitionNone animations:^{ self.femS8.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.femB1.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionTransitionNone animations:^{ self.femB2.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationOptionTransitionNone animations:^{ self.femB3.alpha = 1;} completion:nil];
    
    CGRect femSRect = self.femSNum.frame;
    femSRect.origin.y = 0;
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.femSNum.frame = femSRect;} completion:nil];
    
    CGRect femBRect = self.femBNum.frame;
    femBRect.origin.y = 0;
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.femBNum.frame = femBRect;} completion:nil];
    
    CGRect femL1Rect = self.femL1Num.frame;
    femL1Rect.origin.y = 0;
    CGRect femL2Rect = self.femL2Num.frame;
    femL2Rect.origin.y = 0;
    CGRect femL3Rect = self.femL3Num.frame;
    femL3Rect.origin.y = 0;
    CGRect femL4Rect = self.femL4Num.frame;
    femL4Rect.origin.y = 0;
    CGRect femL5Rect = self.femL5Num.frame;
    femL5Rect.origin.y = 0;
    CGRect femL6Rect = self.femL6Num.frame;
    femL6Rect.origin.y = -711;
    [UIView animateWithDuration:1 delay:0.3 options:UIViewAnimationOptionTransitionNone animations:^{ self.femL1Num.frame = femL1Rect; self.femL1Num.alpha = 1;} completion:nil];
    [UIView animateWithDuration:1 delay:0.6 options:UIViewAnimationOptionTransitionNone animations:^{ self.femL2Num.frame = femL2Rect; self.femL2Num.alpha = 1;} completion:nil];
    [UIView animateWithDuration:1 delay:0.9 options:UIViewAnimationOptionTransitionNone animations:^{ self.femL3Num.frame = femL3Rect; self.femL3Num.alpha = 1;} completion:nil];
    [UIView animateWithDuration:1 delay:1.2 options:UIViewAnimationOptionTransitionNone animations:^{ self.femL4Num.frame = femL4Rect; self.femL4Num.alpha = 1;} completion:nil];
    [UIView animateWithDuration:1 delay:1.5 options:UIViewAnimationOptionTransitionNone animations:^{ self.femL5Num.frame = femL5Rect; self.femL5Num.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.5 delay:1.8 options:UIViewAnimationOptionTransitionNone animations:^{ self.femL6Num.frame = femL6Rect; self.femL6Num.alpha = 1;} completion:nil];
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionTransitionNone animations:^{ self.femDot.alpha = 1;} completion:nil];

}

- (void)rezetSlideAnimation
{
    self.femS1.alpha = 0;
    self.femS2.alpha = 0;
    self.femS3.alpha = 0;
    self.femS4.alpha = 0;
    self.femS5.alpha = 0;
    self.femS6.alpha = 0;
    self.femS7.alpha = 0;
    self.femS8.alpha = 0;
    self.femB1.alpha = 0;
    self.femB2.alpha = 0;
    self.femB3.alpha = 0;
    
    CGRect femSRect = self.femSNum.frame;
    femSRect.origin.y = -femSRect.size.height;
    self.femSNum.frame = femSRect;
    
    CGRect femBRect = self.femBNum.frame;
    femBRect.origin.y = -femBRect.size.height;
    self.femBNum.frame = femBRect;
    
    CGRect femL1Rect = self.femL1Num.frame;
    femL1Rect.origin.y = -femL1Rect.size.height;
    self.femL1Num.frame = femL1Rect;
    CGRect femL2Rect = self.femL2Num.frame;
    femL2Rect.origin.y = -femL2Rect.size.height;
    self.femL2Num.frame = femL2Rect;
    CGRect femL3Rect = self.femL3Num.frame;
    femL3Rect.origin.y = -femL3Rect.size.height;
    self.femL3Num.frame = femL3Rect;
    CGRect femL4Rect = self.femL4Num.frame;
    femL4Rect.origin.y = -femL4Rect.size.height;
    self.femL4Num.frame = femL4Rect;
    CGRect femL5Rect = self.femL5Num.frame;
    femL5Rect.origin.y = -femL5Rect.size.height;
    self.femL5Num.frame = femL5Rect;
    CGRect femL6Rect = self.femL6Num.frame;
    femL6Rect.origin.y = -femL6Rect.size.height;
    self.femL6Num.frame = femL6Rect;
    
    self.femL1Num.alpha = 0;
    self.femL2Num.alpha = 0;
    self.femL3Num.alpha = 0;
    self.femL4Num.alpha = 0;
    self.femL5Num.alpha = 0;
    self.femL6Num.alpha = 0;
    
    self.femDot.alpha = 0;
    self.appendixView.alpha = 0;
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
    self.femS1 = nil;
    self.femS2 = nil;
    self.femS3 = nil;
    self.femS4 = nil;
    self.femS5 = nil;
    self.femS6 = nil;
    self.femS7 = nil;
    self.femS8 = nil;
    self.femB1 = nil;
    self.femB2 = nil;
    self.femB3 = nil;
    self.femSNum = nil;
    self.femBNum = nil;
    self.femL1Num = nil;
    self.femL2Num = nil;
    self.femL3Num = nil;
    self.femL4Num = nil;
    self.femL5Num = nil;
    self.femL6Num = nil;
    self.femDot = nil;
    self.appendixView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
