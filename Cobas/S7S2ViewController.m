//
//  S7S2ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S7S2ViewController.h"

@interface S7S2ViewController ()

@property (assign, nonatomic) IBOutlet UIView *part1View;
@property (assign, nonatomic) IBOutlet UIView *part2View;
@property (assign, nonatomic) IBOutlet UIView *part3View;
@property (assign, nonatomic) IBOutlet UIImageView *anim1View;
@property (assign, nonatomic) IBOutlet UIImageView *anim2View;
@property (assign, nonatomic) IBOutlet UIImageView *anim3View;
@property (assign, nonatomic) IBOutlet UIView *appendixView;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

@end

@implementation S7S2ViewController

@synthesize appendixView = _appendixView;
@synthesize part1View = _part1View;
@synthesize part2View = _part2View;
@synthesize part3View = _part3View;
@synthesize anim1View = _anim1View;
@synthesize anim2View = _anim2View;
@synthesize anim3View = _anim3View;

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
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationTransitionNone animations:^{self.part1View.frame = CGRectMake(169, 227, 472, 55); self.anim1View.alpha = 1;} completion:nil];
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationTransitionNone animations:^{self.part2View.frame = CGRectMake(169, 343, 379, 55); self.anim2View.alpha = 1;} completion:nil];
    [UIView animateWithDuration:1 delay:2 options:UIViewAnimationTransitionNone animations:^{self.part3View.frame = CGRectMake(169, 459, 83, 55); self.anim3View.alpha = 1;} completion:nil];

}

- (void)rezetSlideAnimation
{
    self.appendixView.alpha = 0;
    self.anim1View.alpha = 0;
    self.anim2View.alpha = 0;
    self.anim3View.alpha = 0;
    self.part1View.frame = CGRectMake(169, 227, 0, 55);
    self.part2View.frame = CGRectMake(169, 343, 0, 55);
    self.part3View.frame = CGRectMake(169, 459, 0, 55);
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
    self.appendixView = nil;
    self.part1View = nil;
    self.part2View = nil;
    self.part3View = nil;
    self.anim1View = nil;
    self.anim2View = nil;
    self.anim3View = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
