//
//  S10S4ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S10S4ViewController.h"

@interface S10S4ViewController ()


@property (assign, nonatomic) IBOutlet UIImageView *w11View;
@property (assign, nonatomic) IBOutlet UIImageView *w12View;
@property (assign, nonatomic) IBOutlet UIImageView *w13View;
@property (assign, nonatomic) IBOutlet UIImageView *w14View;
@property (assign, nonatomic) IBOutlet UIImageView *w15View;
@property (assign, nonatomic) IBOutlet UIImageView *w16View;
@property (assign, nonatomic) IBOutlet UIImageView *w21View;
@property (assign, nonatomic) IBOutlet UIImageView *w22View;
@property (assign, nonatomic) IBOutlet UIImageView *w23View;
@property (assign, nonatomic) IBOutlet UIImageView *w24View;
@property (assign, nonatomic) IBOutlet UIImageView *w25View;
@property (assign, nonatomic) IBOutlet UIImageView *w31View;
@property (assign, nonatomic) IBOutlet UIImageView *w32View;
@property (assign, nonatomic) IBOutlet UIImageView *w33View;
@property (assign, nonatomic) IBOutlet UIImageView *w34View;
@property (assign, nonatomic) IBOutlet UIButton *buttonView;
@property (assign, nonatomic) IBOutlet UIImageView *factView;
@property (assign, nonatomic) IBOutlet UIImageView *textView;
@property (assign, nonatomic) IBOutlet UIView *arrowView;
@property (assign, nonatomic) IBOutlet UIImageView *arrowInView;

- (IBAction)startAnimation;

@end

@implementation S10S4ViewController

@synthesize w11View = _w11View;
@synthesize w12View = _w12View;
@synthesize w13View = _w13View;
@synthesize w14View = _w14View;
@synthesize w15View = _w15View;
@synthesize w16View = _w16View;
@synthesize w21View = _w21View;
@synthesize w22View = _w22View;
@synthesize w23View = _w23View;
@synthesize w24View = _w24View;
@synthesize w25View = _w25View;
@synthesize w31View = _w31View;
@synthesize w32View = _w32View;
@synthesize w33View = _w33View;
@synthesize w34View = _w34View;
@synthesize buttonView = _buttonView;
@synthesize factView = _factView;
@synthesize textView = _textView;
@synthesize arrowView = _arrowView;
@synthesize arrowInView = _arrowInView;

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

- (void)rezetSlideAnimation
{
    [self.buttonView setHidden:NO];
    self.textView.alpha = 0;
    self.factView.alpha = 0;
    
    self.w11View.frame = CGRectMake(416, 241, 23, 50);
    self.w12View.frame = CGRectMake(460, 241, 23, 50);
    self.w13View.frame = CGRectMake(586, 241, 23, 50);
    self.w14View.frame = CGRectMake(416, 315, 23, 50);
    self.w15View.frame = CGRectMake(501, 390, 23, 50);
    self.w16View.frame = CGRectMake(543, 390, 23, 50);
    
    self.w21View.frame = CGRectMake(501, 241, 23, 50);
    self.w22View.frame = CGRectMake(543, 241, 23, 50);
    self.w23View.frame = CGRectMake(460, 315, 23, 50);
    self.w24View.frame = CGRectMake(501, 315, 23, 50);
    self.w25View.frame = CGRectMake(586, 315, 23, 50);
    
    self.w31View.frame = CGRectMake(543, 315, 23, 50);
    self.w32View.frame = CGRectMake(416, 390, 23, 50);
    self.w33View.frame = CGRectMake(460, 390, 23, 50);
    self.w34View.frame = CGRectMake(586, 390, 23, 50);
    
    self.arrowView.frame = CGRectMake(290+200, 333, 43, 14);
    self.arrowInView.frame = CGRectMake(-200, 0, 443, 14);
}

- (IBAction)startAnimation
{
    [self.buttonView setHidden:YES];
    [UIView animateWithDuration:1 animations:^{
        self.w11View.frame = CGRectMake(426, 208, 23, 50);
        self.w12View.frame = CGRectMake(456, 208, 23, 50);
        self.w13View.frame = CGRectMake(516, 208, 23, 50);
        self.w14View.frame = CGRectMake(486, 208, 23, 50);
        self.w15View.frame = CGRectMake(545, 208, 23, 50);
        self.w16View.frame = CGRectMake(576, 208, 23, 50);
        
        self.w21View.frame = CGRectMake(472, 312, 23, 50);
        self.w22View.frame = CGRectMake(530, 312, 23, 50);
        self.w23View.frame = CGRectMake(440, 312, 23, 50);
        self.w24View.frame = CGRectMake(501, 312, 23, 50);
        self.w25View.frame = CGRectMake(560, 312, 23, 50);
        
        self.w31View.frame = CGRectMake(516, 415, 23, 50);
        self.w32View.frame = CGRectMake(456, 415, 23, 50);
        self.w33View.frame = CGRectMake(486, 415, 23, 50);
        self.w34View.frame = CGRectMake(546, 415, 23, 50);
    }];
    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationTransitionNone animations:^{
        self.textView.alpha = 1;
        self.arrowView.frame = CGRectMake(290, 333, 443, 14);
        self.arrowInView.frame = CGRectMake(0, 0, 443, 14);
    } completion:nil];
    [UIView animateWithDuration:1 delay:2 options:UIViewAnimationTransitionNone animations:^{self.factView.alpha = 1;} completion:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.w11View = nil;
    self.w12View = nil;
    self.w13View = nil;
    self.w14View = nil;
    self.w15View = nil;
    self.w16View = nil;
    self.w21View = nil;
    self.w22View = nil;
    self.w23View = nil;
    self.w24View = nil;
    self.w25View = nil;
    self.w31View = nil;
    self.w32View = nil;
    self.w33View = nil;
    self.w34View = nil;
    self.buttonView = nil;
    self.factView = nil;
    self.textView = nil;
    self.arrowView = nil;
    self.arrowInView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
