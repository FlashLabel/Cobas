//
//  S3S6ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S3S6ViewController.h"

@interface S3S6ViewController ()

@property (assign, nonatomic) IBOutlet UIView *appendix1View;
@property (assign, nonatomic) IBOutlet UIView *appendix2View;
@property (assign, nonatomic) IBOutlet UIView *appendix4View;

@property (assign, nonatomic) IBOutlet UIImageView *anim1View;
@property (assign, nonatomic) IBOutlet UIImageView *anim2View;
@property (assign, nonatomic) IBOutlet UIImageView *anim3View;
@property (assign, nonatomic) IBOutlet UIImageView *anim4View;
@property (assign, nonatomic) IBOutlet UIButton *hideButton;

@property (assign, nonatomic) IBOutlet UIButton *anim1Button;
@property (assign, nonatomic) IBOutlet UIButton *anim2Button;
@property (assign, nonatomic) IBOutlet UIButton *anim3Button;
@property (assign, nonatomic) IBOutlet UIButton *anim4Button;

- (IBAction)showAppendix;
- (IBAction)hideAppendix;

- (IBAction)switchAniation:(UIButton *)sender;

@end

@implementation S3S6ViewController

@synthesize appendix1View = _appendix1View;
@synthesize appendix2View = _appendix2View;
@synthesize appendix4View = _appendix4View;
@synthesize anim1View = _anim1View;
@synthesize anim2View = _anim2View;
@synthesize anim3View = _anim3View;
@synthesize anim4View = _anim4View;
@synthesize hideButton = _hideButton;
@synthesize anim1Button = _anim1Button;
@synthesize anim2Button = _anim2Button;
@synthesize anim3Button = _anim3Button;
@synthesize anim4Button = _anim4Button;

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
    self.anim1Button.alpha = 0.5;
    self.anim2Button.alpha = 0.5;
    self.anim3Button.alpha = 0.5;
    self.anim4Button.alpha = 0.5;
    [UIView animateWithDuration:0.5 delay:0 options:(UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat) animations:^{self.anim1Button.alpha = 0;} completion:nil];
    [UIView animateWithDuration:0.5 delay:0 options:(UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat) animations:^{self.anim2Button.alpha = 0;} completion:nil];
    [UIView animateWithDuration:0.5 delay:0 options:(UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat) animations:^{self.anim3Button.alpha = 0;} completion:nil];
    [UIView animateWithDuration:0.5 delay:0 options:(UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat) animations:^{self.anim4Button.alpha = 0;} completion:nil];
}

- (void)rezetSlideAnimation
{
    self.appendix1View.alpha = 0;
    self.appendix2View.alpha = 0;
    self.appendix4View.alpha = 0;
    
    self.anim1View.alpha = 1;
    self.anim2View.alpha = 0;
    self.anim3View.alpha = 0;
    self.anim4View.alpha = 0;
    
    _currentNum = 0;
    self.hideButton.alpha = 1;
}

- (IBAction)switchAniation:(UIButton *)sender
{
    if (_currentNum == sender.tag)
        return;
    self.appendix1View.alpha = 0;
    self.appendix2View.alpha = 0;
    self.appendix4View.alpha = 0;
    switch (sender.tag) {
        case 0:
            [UIView animateWithDuration:0.5 animations:^{ self.anim1View.alpha = 1;}];
            break;
        case 1:
            [UIView animateWithDuration:0.5 animations:^{ self.anim2View.alpha = 1;}];
            break;
        case 2:
            [UIView animateWithDuration:0.5 animations:^{ self.anim3View.alpha = 1;}];
            break;
        case 3:
            [UIView animateWithDuration:0.5 animations:^{ self.anim4View.alpha = 1;}];
            break;
        default:
            break;
    }
    switch (_currentNum) {
        case 0:
            [UIView animateWithDuration:0.5 animations:^{ self.anim1View.alpha = 0;}];
            break;
        case 1:
            [UIView animateWithDuration:0.5 animations:^{ self.anim2View.alpha = 0;}];
            break;
        case 2:
            [UIView animateWithDuration:0.5 animations:^{ self.anim3View.alpha = 0;}];
            break;
        case 3:
            [UIView animateWithDuration:0.5 animations:^{ self.anim4View.alpha = 0;}];
            break;
        default:
            break;
    }
    if (sender.tag == 2) 
        self.hideButton.alpha = 0;
    else 
        self.hideButton.alpha = 1;
    _currentNum = sender.tag;
}

- (IBAction)showAppendix
{
    switch (_currentNum) {
        case 0:
                [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix1View.alpha = 1;} completion:nil];
            break;
        case 1:
                [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix2View.alpha = 1;} completion:nil];
            break;
        case 3:
                [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix4View.alpha = 1;} completion:nil];
            break;
        default:
            break;
    }

}

- (IBAction)hideAppendix
{
    switch (_currentNum) {
        case 0:
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix1View.alpha = 0;} completion:nil];
            break;
        case 1:
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix2View.alpha = 0;} completion:nil];
            break;
        case 3:
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix4View.alpha = 0;} completion:nil];
            break;
        default:
            break;
    }

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.appendix1View = nil;
    self.appendix2View = nil;
    self.appendix4View = nil;
    self.anim1View = nil;
    self.anim2View = nil;
    self.anim3View = nil;
    self.anim4View = nil;
    self.hideButton = nil;
    self.anim1Button = nil;
    self.anim2Button = nil;
    self.anim3Button = nil;
    self.anim4Button = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
