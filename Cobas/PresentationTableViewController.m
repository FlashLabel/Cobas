//
//  PresentationTableViewController.m
//  Cobas
//
//  Created by  on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PresentationTableViewController.h"
#import "SlideCell.h"
#import "GANTracker.h"

#define slideWidth 1024
#define slideHeight 768
#define timerTime 5.0

static const NSInteger kGANDispatchPeriodSec = 30;
static NSString *const kAnalyticsAccountId = @"UA-30372406-1";

@interface PresentationTableViewController ()

@property (assign, nonatomic) IBOutlet UIScrollView *indexScrollView;
@property (assign, nonatomic) IBOutlet UITableView *presentationTable;
@property (retain, nonatomic) MenuViewController *menuView;
@property (retain, nonatomic) ContentsViewController *contentsView;
@property (retain, nonatomic) ContactViewController *contactView;
@property (retain, nonatomic) NSArray *sectionsArray;
@property (retain, nonatomic) NSArray *slidesArray;
@property (retain, nonatomic) NSTimer *contentTimer;

- (void)homeButtonPressed;
- (void)indexButtonPressed;
- (void)contentsButtonPressed;
- (void)contactsButtonPressed;

- (IBAction)sectionSelected:(UIButton *)sender;

@end

@implementation PresentationTableViewController

@synthesize indexScrollView = _indexScrolView;
@synthesize presentationTable = _presentationTable;
@synthesize sectionsArray = _sectionsArray;
@synthesize slidesArray = _slidesArray;
@synthesize menuView = _menuView;
@synthesize contentsView = _contentsView;
@synthesize contactView = _contactView;
@synthesize contentTimer = _contentTimer;

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
    
    [[GANTracker sharedTracker] startTrackerWithAccountID:kAnalyticsAccountId dispatchPeriod:kGANDispatchPeriodSec delegate:nil];
    NSError *error;
    if (![[GANTracker sharedTracker] setCustomVariableAtIndex:1
                                                         name:@"iOS1"
                                                        value:@"index"
                                                    withError:&error]) {
        NSLog(@"error in setCustomVariableAtIndex");
    }
    
    if (![[GANTracker sharedTracker] trackEvent:@"Application iOS"
                                         action:@"Launch iOS"
                                          label:@"Example iOS"
                                          value:99
                                      withError:&error]) {
        NSLog(@"error in trackEvent");
    }
    
    if (![[GANTracker sharedTracker] trackPageview:@"/app_entry_point"
                                         withError:&error]) {
        NSLog(@"error in trackPageview");
    }

    
    ///
    _currentSection = 0;
    _currentSlide = 0;
    _scrollState = NO;
    
    self.sectionsArray = [NSArray arrayWithObjects:@"0", @"6", @"11", @"19", @"23", @"31", @"40", @"43", @"45", @"47", nil];
//    self.sectionsArray = [NSArray arrayWithObjects:@"0", @"1", @"7", @"12", @"20", @"24", @"32", @"41", @"44", @"46", @"48", @"52",nil];
    
    self.slidesArray = [NSArray arrayWithObjects:
                        @"S1S1ViewController", @"S1S2ViewController", @"S1S3ViewController", @"S1S4ViewController", @"S1S5ViewController", @"S1S6ViewController",
                        
                        @"S2S1ViewController", @"S2S2ViewController", @"S2S3ViewController", @"S2S4ViewController", @"S2S5ViewController",
                        
                        @"S3S1ViewController", @"S3S2ViewController", @"S3S3ViewController", @"S3S4ViewController", @"S3S5ViewController", @"S3S6ViewController", @"S3S7ViewController", @"S3S8ViewController",
                        
                        @"S4S1ViewController", @"S4S2ViewController", @"S4S3ViewController", @"S4S4ViewController",
                        
                        @"S5S1ViewController", @"S5S2ViewController", @"S5S3ViewController", @"S5S4ViewController", @"S5S5ViewController", @"S5S6ViewController", @"S5S7ViewController", @"S5S8ViewController",
                        
                        @"S6S1ViewController", @"S6S2ViewController", @"S6S3ViewController", @"S6S4ViewController", @"S6S5ViewController", @"S6S6ViewController", @"S6S7ViewController", @"S6S8ViewController", @"S6S9ViewController",
                        
                        @"S7S1ViewController", @"S7S2ViewController", @"S7S3ViewController",
                        
                        @"S8S1ViewController", @"S8S2ViewController",
                        
                        @"S9S1ViewController", @"S9S2ViewController",
                        
                        @"S10S1ViewController", @"S10S2ViewController", @"S10S3ViewController", @"S10S4ViewController",
                        nil];
    // CONTACT
    self.contactView = [[[ContactViewController alloc] init] autorelease];
    self.contactView.view.frame = CGRectMake(0, 768, 1024, 768);
    self.contactView.delegate = self;
    [self.view addSubview:self.contactView.view];
    
    // CONTENTS
    self.contentsView = [[[ContentsViewController alloc] init] autorelease];
    self.contentsView.view.frame = CGRectMake(0, 768, 1024, 268);
    self.contentsView.delegate = self;
    [self.view addSubview:self.contentsView.view];
    
    // MENU
    self.menuView = [[[MenuViewController alloc] init] autorelease];
    CGRect menuRect = self.menuView.view.frame;
    menuRect.origin.y = slideHeight - menuRect.size.height;
    self.menuView.view.frame = menuRect;
    [self.view addSubview:self.menuView.view];
    [self.menuView.homeButton addTarget:self action:@selector(homeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView.indexButton addTarget:self action:@selector(indexButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView.contentsButton addTarget:self action:@selector(contentsButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView.contactsButton addTarget:self action:@selector(contactsButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView.indexButton setEnabled:NO];
    
    // TABLE
    self.presentationTable.layer.transform = CATransform3DRotate(CATransform3DIdentity, -1.57079633, 0, 0, 1);
    self.presentationTable.frame = CGRectMake(0, 0, 1024, 768);
    
    // TAP
    UISwipeGestureRecognizer *swipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)] autorelease];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)] autorelease];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
    
    UITapGestureRecognizer *singleTap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)] autorelease];
    singleTap.enabled = YES;
    singleTap.cancelsTouchesInView = NO;
    
    [self.presentationTable addGestureRecognizer:singleTap];
}

- (void)viewDidAppear:(BOOL)animated{
    [self.menuView showMenu:YES];
    [self.menuView.indexButton setEnabled:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.indexScrollView = nil;
    self.presentationTable = nil;
    self.menuView = nil;
    self.contentTimer = nil;
}

- (void)dealloc
{
    [[GANTracker sharedTracker] stopTracker];
    [_slidesArray release];
    [_sectionsArray release];
    [_contentTimer release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft || interfaceOrientation==UIInterfaceOrientationLandscapeRight)
        return YES;
    return NO;
}

#pragma mark - UIScrollBar

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(_scrollState)
        return;
    id cell = [self.presentationTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_currentSlide inSection:0]];
    [cell startAnimation];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _scrollState = YES;
    
    if (self.menuView.contentsButton.selected)
        [UIView animateWithDuration:0.5 animations:^{self.contentsView.view.frame = CGRectMake(0, 768, 1024, 268);}];
    else
        return;
    [self.menuView switchTimer:!self.menuView.contentsButton.selected];
    [self.menuView.contentsButton setSelected:!self.menuView.contentsButton.selected];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _scrollState = NO;
    int page = floor((self.presentationTable.contentOffset.y - 1024 / 2) / 1024) + 1;
    if (page == _currentSlide)
        return;
    for (int i = 0; i < self.sectionsArray.count; ++i)
        if (page <= ([[self.sectionsArray objectAtIndex:i] intValue]-1))
        {
            _currentSection = i - 1;
            break;
        }
    //[self revertAnimation];
    _currentSlide = page;
    id cell = [self.presentationTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_currentSlide inSection:0]];
    [cell startAnimation];
    [self.contentsView setCurrentSlide:_currentSlide];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.slidesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class theClass = NSClassFromString([self.slidesArray objectAtIndex:indexPath.row]);
    id slideObject = [[theClass alloc] init];
    
    SlideCell *cell = [tableView dequeueReusableCellWithIdentifier:[SlideCell identifier]];
    if (cell)
        [cell updateWithView:slideObject];
    else
        cell = [SlideCell cellWithView:slideObject];
    [slideObject release];
    cell.layer.transform = CATransform3DRotate(CATransform3DIdentity,1.57079633,0,0,1);
    cell.frame=CGRectMake(0,0,1024,768);
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SlideCell rowHeight];
}

#pragma mark - ContentsViewDelegate

- (void)slideCellSelected:(NSIndexPath *)indexPath
{
    if (indexPath.row == -1){
        [self indexButtonPressed];
        return;
    }
    [self.menuView.indexButton setEnabled:YES];
    _currentSlide = indexPath.row;
    [self.indexScrollView setContentOffset:CGPointMake(slideWidth, 0) animated:YES];
    [self.presentationTable scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (void)resetTimer
{
    if(self.contentTimer)
    {
        [self.contentTimer invalidate];
        self.contentTimer = nil;
        self.contentTimer = [NSTimer scheduledTimerWithTimeInterval:timerTime target:self selector:@selector(timerTicked:) userInfo:nil repeats:NO];
    }
}

#pragma mark - ContactViewDelegate

- (void)closeContactView
{
    [UIView animateWithDuration:0.5 animations:^{self.contactView.view.frame = CGRectMake(0, 768, 1024, 768);}];
    [self.menuView.contactsButton setEnabled:YES];
}

#pragma mark - Swipe

- (void)handleTap:(UISwipeGestureRecognizer*)tap
{
    if (self.menuView.contentsButton.selected)
        [UIView animateWithDuration:0.5 animations:^{self.contentsView.view.frame = CGRectMake(0, 768, 1024, 268);}];
    else
        return;
    [self.menuView switchTimer:!self.menuView.contentsButton.selected];
    [self.menuView.contentsButton setSelected:!self.menuView.contentsButton.selected];
}

- (void)didSwipe:(UISwipeGestureRecognizer*)swipe
{
//    if (swipe.direction == UISwipeGestureRecognizerDirectionUp) 
//    {
//        if (_currentSection + 1 < self.sectionsArray.count)
//        {
//            _currentSection++;
//            [self.presentationTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[[self.sectionsArray objectAtIndex:_currentSection] intValue] inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
//            _currentSlide = [[self.sectionsArray objectAtIndex:_currentSection] intValue];
//        }
//    } 
//    else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) 
//    {
//        if (_currentSection - 1 >= 0 )
//        {
//            _currentSection--;
//            [self.presentationTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[[self.sectionsArray objectAtIndex:_currentSection] intValue] inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
//            _currentSlide = [[self.sectionsArray objectAtIndex:_currentSection] intValue];
//        }
//    }
}

#pragma mark - Actions

- (void)sectionSelected:(UIButton *)sender
{
    [self.menuView.indexButton setEnabled:YES];
    [self.indexScrollView setContentOffset:CGPointMake(slideWidth, 0) animated:YES];
    [self.presentationTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[[self.sectionsArray objectAtIndex:sender.tag] intValue] inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
//    [self.presentScrollView setContentOffset:CGPointMake([[self.sectionsArray objectAtIndex:sender.tag] intValue] * slideWidth, 0) animated:NO];
    _currentSection = sender.tag;
    [self.contentsView setCurrentSlide:[[self.sectionsArray objectAtIndex:_currentSection] intValue]];
}

- (void)homeButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)indexButtonPressed
{
//    [self revertAnimation];
    _currentSlide = -1;
    [self.indexScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    [UIView animateWithDuration:0.5 animations:^{self.contactView.view.frame = CGRectMake(0, 768, 1024, 768);}];
    [self.menuView.indexButton setEnabled:NO];
    [self.menuView.contactsButton setEnabled:YES];
    [self.contentsView setCurrentSlide:-1];
}

- (void)contentsButtonPressed
{
    if(self.contentTimer)
    {
        [self.contentTimer invalidate];
        self.contentTimer = nil;
    }
    
    if (self.menuView.contentsButton.selected)
    {
        [UIView animateWithDuration:0.5 animations:^{self.contentsView.view.frame = CGRectMake(0, 768, 1024, 268);}];

    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{self.contentsView.view.frame = CGRectMake(0, 768 - 268, 1024, 268);}];
        self.contentTimer = [NSTimer scheduledTimerWithTimeInterval:timerTime target:self selector:@selector(timerTicked:) userInfo:nil repeats:NO];
    }
    [self.menuView switchTimer:!self.menuView.contentsButton.selected];
    [self.menuView.contentsButton setSelected:!self.menuView.contentsButton.selected];
}

- (void)timerTicked:(NSTimer*)timer
{
//    [self showMenu:NO];
//    self.state = YES;
    self.contentTimer = nil;
    [self.menuView switchTimer:!self.menuView.contentsButton.selected];
    [self.menuView.contentsButton setSelected:!self.menuView.contentsButton.selected];
    [UIView animateWithDuration:0.5 animations:^{self.contentsView.view.frame = CGRectMake(0, 768, 1024, 268);}];
}

- (void)contactsButtonPressed
{
    if (self.menuView.contactsButton.enabled)
        [UIView animateWithDuration:0.5 animations:^{self.contactView.view.frame = CGRectMake(0, 0, 1024, 768);}];
    else
        [UIView animateWithDuration:0.5 animations:^{self.contactView.view.frame = CGRectMake(0, 768, 1024, 768);}];
    [self.menuView.indexButton setEnabled:YES];
    [self.menuView.contactsButton setEnabled:NO];
}

@end
