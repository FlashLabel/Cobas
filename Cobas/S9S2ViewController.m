//
//  S9S2ViewController.m
//  Cobas
//
//  Created by  on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "S9S2ViewController.h"


@interface S9S2ViewController ()

@property (assign, nonatomic) IBOutlet UIView *appendix1View;
@property (assign, nonatomic) IBOutlet UIView *appendix2View;
@property (assign, nonatomic) IBOutlet UIView *appendix3View;

@property (retain, nonatomic) CMovieViewController *player;

- (IBAction)play1video;
- (IBAction)play2video;
- (IBAction)play3video;
- (void)playVideo:(NSString *)name;

- (IBAction)show1Appendix;
- (IBAction)hideAppendix;
- (IBAction)show2Appendix;
- (IBAction)show3Appendix;


@end

@implementation S9S2ViewController

@synthesize appendix1View = _appendix1View;
@synthesize appendix2View = _appendix2View;
@synthesize appendix3View = _appendix3View;
@synthesize player = _player;

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

- (void)dealloc
{
    [_player release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.player = nil;
    self.appendix1View = nil;
    self.appendix2View = nil;
    self.appendix3View = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        return YES;
    return NO;
}

- (IBAction)show1Appendix
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix1View.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix2View.alpha = 0;} completion:nil];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix3View.alpha = 0;} completion:nil];
}

- (IBAction)show2Appendix
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix2View.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix1View.alpha = 0;} completion:nil];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix3View.alpha = 0;} completion:nil];
}

- (IBAction)show3Appendix
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix3View.alpha = 1;} completion:nil];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix1View.alpha = 0;} completion:nil];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix2View.alpha = 0;} completion:nil];
}

- (IBAction)hideAppendix
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix1View.alpha = 0;} completion:nil];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix2View.alpha = 0;} completion:nil];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{ self.appendix3View.alpha = 0;} completion:nil];
}

- (void)playVideo:(NSString *)name
{
    self.player = [[[CMovieViewController alloc] initWithContentURL:[NSURL fileURLWithPath:name]] autorelease];
    if (self.player) 
    {
        [self.player setWantsFullScreenLayout:YES];
        [self.player.moviePlayer setFullscreen:YES animated:YES];
        [self.player.moviePlayer setControlStyle:MPMovieControlStyleFullscreen];
        
        self.player.view.frame = CGRectMake(0, 0, 1024, 768);
        [self.view addSubview:self.player.view];
        self.player.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(movieFinishedCallback:) 
                                                     name:MPMoviePlayerWillExitFullscreenNotification 
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(movieFinishedCallback:) 
                                                     name:MPMoviePlayerPlaybackDidFinishNotification 
                                                   object:nil];
        
        [self.player.moviePlayer play];
    } 
}

- (IBAction)play1video
{ 
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Patient01ReCut-ipad3-ipad" ofType:@"m4v"];
    [self playVideo:path];
}

- (IBAction)play2video
{ 
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Patient02ReCut-ipad3-ipad" ofType:@"m4v"];
    [self playVideo:path];
}

- (IBAction)play3video
{ 
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Patient03RevisedFINAL-ipad" ofType:@"m4v"];
    [self playVideo:path];
}

- (void)movieFinishedCallback:(NSNotification *)notification 
{
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerWillExitFullscreenNotification object:nil];
    [player.view removeFromSuperview];
}

- (void)rezetSlideAnimation
{
    self.appendix1View.alpha = 0;
    self.appendix2View.alpha = 0;
    self.appendix3View.alpha = 0;
}

@end


