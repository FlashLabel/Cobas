//
//  S6S8ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S6S8ViewController.h"
#import "UICustomSwitch.h"

@interface S6S8ViewController ()

@property (assign, nonatomic) IBOutlet UIView *appendixView;
@property (assign, nonatomic) IBOutlet UIImageView *bg1View;
@property (assign, nonatomic) IBOutlet UIImageView *bg2View;
@property (assign, nonatomic) IBOutlet UIButton *switchButton;
@property (assign, nonatomic) IBOutlet UIImageView *dot1View;
@property (assign, nonatomic) IBOutlet UIImageView *dot2View;
@property (retain, nonatomic) NSTimer *my1Timer;
@property (retain, nonatomic) NSTimer *my2Timer;
@property (assign, nonatomic) IBOutlet UIButton *but1Button;
@property (assign, nonatomic) IBOutlet UIButton *but2Button;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;
//- (IBAction)switchBg:(UIButton *)sender;
- (IBAction)buttonPressed:(UIButton *)sender;  

@end

@implementation S6S8ViewController

@synthesize appendixView = _appendixView;
@synthesize switchButton = _switchButton;
@synthesize bg1View = _bg1View;
@synthesize bg2View = _bg2View;
@synthesize dot1View = _dot1View;
@synthesize dot2View = _dot2View;
@synthesize my1Timer = _my1Timer;
@synthesize my2Timer = _my2Timer;
@synthesize but1Button = _but1Button;
@synthesize but2Button = _but2Button;

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
    if ([self.my1Timer isValid]) {
        [self.my1Timer invalidate];
    }
    if ([self.my2Timer isValid]) {
        [self.my2Timer invalidate];
    }
}

- (void)startSlideAnimation
{
    self.my1Timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tick1:) userInfo:nil repeats:YES];
}

- (void)tick1:(NSTimer *)timer 
{
    if (_timer1Count >= 15)
    {
        [self.my1Timer invalidate];
        return;
    }    
    switch (_timer1Count)
    {
        case 0:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part11"]];
            break;
        case 1:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part12"]];
            break;
        case 2:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part13"]];
            break;
        case 3:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part14"]];
            break;
        case 4:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part15"]];
            break;
        case 5:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part16"]];
            break;
        case 6:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part17"]];
            break;
        case 7:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part18"]];
            break;
        case 8:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part19"]];
            break;
        case 9:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part110"]];
            break;
        case 10:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part111"]];
            break;
        case 11:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part112"]];
            break;
        case 12:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part113"]];
            break;
        case 13:
            [self.dot1View setImage:[UIImage imageNamed:@"S5S4Part114"]];
            break;
            
    }
    _timer1Count ++;
}

- (void)tick2:(NSTimer *)timer 
{
    if (_timer2Count >= 12)
    {
        [self.my2Timer invalidate];
        return;
    }    
    switch (_timer2Count)
    {
        case 0:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part21"]];
            break;
        case 1:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part22"]];
            break;
        case 2:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part23"]];
            break;
        case 3:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part24"]];
            break;
        case 4:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part25"]];
            break;
        case 5:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part26"]];
            break;
        case 6:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part27"]];
            break;
        case 7:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part28"]];
            break;
        case 8:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part29"]];
            break;
        case 9:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part210"]];
            break;
        case 10:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part211"]];
            break;
        case 11:
            [self.dot2View setImage:[UIImage imageNamed:@"S5S4Part212"]];
            break;
    }
    _timer2Count ++;
}

- (void)rezetSlideAnimation
{
    _timer1Count= 0;
    _timer2Count= 0;
    if ([self.my1Timer isValid])
        [self.my1Timer invalidate];
    if ([self.my2Timer isValid])
        [self.my2Timer invalidate];
    self.bg1View.hidden = NO;
    self.bg2View.hidden = YES;
    self.switchButton.selected = NO;
    self.appendixView.alpha = 0;
    [self.dot1View setImage:[UIImage imageNamed:nil]];
    [self.dot2View setImage:[UIImage imageNamed:nil]];
    [self.but1Button setSelected:YES];
}

- (IBAction)buttonPressed:(UICustomSwitch *)sender
{
    if (sender.selected)
        return;
    
    [self.dot1View setImage:[UIImage imageNamed:nil]];
    [self.dot2View setImage:[UIImage imageNamed:nil]];
    
    _timer1Count= 0;
    _timer2Count= 0;
    if ([self.my1Timer isValid])
        [self.my1Timer invalidate];
    if ([self.my2Timer isValid])
        [self.my2Timer invalidate];

    if (!sender.tag)
    {
        [self.but1Button setSelected:YES];
        [self.but2Button setSelected:NO];
        self.bg1View.hidden = NO;
        self.bg2View.hidden = YES;
        self.my1Timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tick1:) userInfo:nil repeats:YES];
    }
    else
    {
        [self.but1Button setSelected:NO];
        [self.but2Button setSelected:YES];
        self.bg1View.hidden = YES;
        self.bg2View.hidden = NO;
        self.my2Timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tick2:) userInfo:nil repeats:YES];
    }       

}

//- (IBAction)switchBg:(UIButton *)sender
//{
//    [self.dot1View setImage:[UIImage imageNamed:nil]];
//    [self.dot2View setImage:[UIImage imageNamed:nil]];
//    
//    _timer1Count= 0;
//    _timer2Count= 0;
//    if ([self.my1Timer isValid])
//        [self.my1Timer invalidate];
//    if ([self.my2Timer isValid])
//        [self.my2Timer invalidate];
//    
//    if(sender.selected)
//    {
//        self.bg1View.hidden = NO;
//        self.bg2View.hidden = YES;
//        self.my1Timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tick1:) userInfo:nil repeats:YES];
//    }
//    else
//    {
//        self.bg1View.hidden = YES;
//        self.bg2View.hidden = NO;
//        self.my2Timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tick2:) userInfo:nil repeats:YES];
//    }
//    sender.selected = !sender.selected;
//}

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
    self.appendixView = nil;
    self.bg1View = nil;
    self.bg2View = nil;
    self.switchButton = nil;
    self.dot1View = nil;
    self.dot2View = nil;
    self.but1Button = nil;
    self.but2Button = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
