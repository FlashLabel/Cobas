//
//  S5S2ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S5S2ViewController.h"

@interface S5S2ViewController ()
@property (assign, nonatomic) IBOutlet UIImageView *part1View;
@property (assign, nonatomic) IBOutlet UIImageView *part2View;
@property (assign, nonatomic) IBOutlet UIImageView *part3View;
@property (assign, nonatomic) IBOutlet UIImageView *part4View;
@property (assign, nonatomic) IBOutlet UIButton *part1Button;
@property (assign, nonatomic) IBOutlet UIButton *part2Button;
@property (assign, nonatomic) IBOutlet UIButton *part3Button;
@property (assign, nonatomic) IBOutlet UIButton *part4Button;
@property (assign, nonatomic) IBOutlet UIView *appendixView;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;
- (IBAction)showPart:(UIButton *)sender;

@end

@implementation S5S2ViewController

@synthesize part1View = _part1View;
@synthesize part2View = _part2View;
@synthesize part3View = _part3View;
@synthesize part4View = _part4View;
@synthesize part1Button = _part1Button;
@synthesize part2Button = _part2Button;
@synthesize part3Button = _part3Button;
@synthesize part4Button = _part4Button;
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

- (void)rezetSlideAnimation
{
    self.appendixView.alpha = 0;
    [self.part1View setHidden:YES];
    [self.part2View setHidden:YES];
    [self.part3View setHidden:YES];
    [self.part4View setHidden:YES];
    [self.part1Button setSelected:NO];
    [self.part2Button setSelected:NO];
    [self.part3Button setSelected:NO];
    [self.part4Button setSelected:NO];
}

- (IBAction)showPart:(UIButton *)sender
{
    BOOL flag = YES;
    if ([sender isSelected])
        flag = NO;
    [sender setSelected:flag];
    switch (sender.tag) {
        case 0:
            [self.part1View setHidden:!flag];
            break;
        case 1:
            [self.part2View setHidden:!flag];
            break;
        case 2:
            [self.part3View setHidden:!flag];
            break;
        case 3:
            [self.part4View setHidden:!flag];
            break;
        default:
            break;
    }
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
    self.part1View = nil;
    self.part2View = nil;
    self.part3View = nil;
    self.part4View = nil;
    self.part1Button = nil;
    self.part2Button = nil;
    self.part3Button = nil;
    self.part4Button = nil;
    self.appendixView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
