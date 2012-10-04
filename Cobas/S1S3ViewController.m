//
//  S1S3ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S1S3ViewController.h"

@interface S1S3ViewController ()

@property (assign, nonatomic) IBOutlet UIButton *switchButton;
@property (assign, nonatomic) IBOutlet UIImageView *mapView;
@property (assign, nonatomic) IBOutlet UIImageView *map2View;
@property (assign, nonatomic) IBOutlet UIImageView *animView;

- (IBAction)switchPressed:(UIButton *)sender;
- (IBAction)button1Pressed;
- (IBAction)button2Pressed;

@end

@implementation S1S3ViewController

@synthesize switchButton = _switchButton;
@synthesize mapView = _mapView;
@synthesize map2View = _map2View;
@synthesize animView = _animView;

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
    self.map2View.alpha = 0;
}

- (void)rezetSlideAnimation
{
    self.switchButton.tag = 0;
    self.mapView.alpha = 1;
    self.map2View.alpha = 0;
     [self.animView setImage:[UIImage imageNamed:@"S1S3Anim1"]];
}

- (IBAction)button1Pressed
{
    [UIView animateWithDuration:1 animations:^{self.mapView.alpha = 1;} completion:nil];
    [UIView animateWithDuration:1 animations:^{self.map2View.alpha = 0;} completion:nil];
    [self.animView setImage:[UIImage imageNamed:@"S1S3Anim1"]];
}

- (IBAction)button2Pressed
{

    [UIView animateWithDuration:1 animations:^{self.map2View.alpha = 1;} completion:nil];
    [UIView animateWithDuration:1 animations:^{self.mapView.alpha = 0;} completion:nil];
    [self.animView setImage:[UIImage imageNamed:@"S1S3Anim2"]];
}
-(IBAction)switchPressed:(UIButton *)sender
{
    if(sender.tag)
    {
        sender.tag = 0;
        [sender setBackgroundImage:[UIImage imageNamed:@"S1S3Scroll1"] forState:UIControlStateNormal];
        [UIView animateWithDuration:1 animations:^{self.mapView.alpha = 1;} completion:nil];
        [UIView animateWithDuration:1 animations:^{self.map2View.alpha = 0;} completion:nil];
    }
    else
    {
        sender.tag = 1;
        [sender setBackgroundImage:[UIImage imageNamed:@"S1S3Scroll2"] forState:UIControlStateNormal];
        [UIView animateWithDuration:1 animations:^{self.map2View.alpha = 1;} completion:nil];
        [UIView animateWithDuration:1 animations:^{self.mapView.alpha = 0;} completion:nil];
    }
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.mapView = nil;
    self.map2View = nil;
    self.switchButton = nil;
    self.animView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
