//
//  ContentsViewController.m
//  Cobas
//
//  Created by  on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContentsViewController.h"
#import "ContentCell.h"

@interface ContentsViewController ()

@property (assign, nonatomic) IBOutlet UITableView *slideTable;
@property (assign, nonatomic) IBOutlet UILabel *sectionLabel;
@property (assign, nonatomic) IBOutlet UILabel *slideLabel;
@property (retain, nonatomic) NSArray *sectionsArray;
@property (retain, nonatomic) NSArray *slidesArray;
@property (retain, nonatomic) NSArray *sectionsNameArray;
@property (retain, nonatomic) NSArray *slidesNameArray;

@end

@implementation ContentsViewController

@synthesize slideTable = _slideTable;
@synthesize sectionLabel = _sectionLabel;
@synthesize slideLabel = _slideLabel;
@synthesize sectionsArray = _sectionsArray;
@synthesize slidesArray = _slidesArray;
@synthesize sectionsNameArray = _sectionsNameArray;
@synthesize slidesNameArray = _slidesNameArray;
@synthesize delegate = _delegate;


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
    self.sectionsNameArray = [NSArray arrayWithObjects:@"Index", @"Section 1: The Facts", @"Section 2: The Current Approach", @"Section 3: HPV Testing", @"Section 4: The Future", @"Section 5: Genotyping", @"Section 6: Athena. A Landmark Clinical Trial", @"Section 7:  How Does It Work?", @"Section 8:  Smarter Questions. Better Outlook", @"Section 9:  Patient Consultation Video Guides", @"Section 10:  Meet Roche", nil];
    self.slidesNameArray = [NSArray arrayWithObjects:@"",
                            @"The Facts", @"What's at stake?", @"We know that HPV is found in 99.7% of cervical cancer", @"HPV16 and HPV18 cause 70% of cervical cancers worldwide", @"How prevalent is each hrHPV strain in women with SCC or ADC?", @"What's the relative risk of developing the following conditions?",
                            
                            @"The Current Approach", @"How much cervical cancer and precancer does cytology pick up?", @"25% failure means", @"Subjective reporting leads to...", @"Subjectivity leads to uncertainty and wastes resources",
                            
                            @"HPV Testing", @"cobas® HPV Testing as Triage", @"cobas® HPV Testing as Triage", @"cobas® HPV Testing as Triage", @"cobas® HPV Testing as Triage", @"cobas® HPV Testing as Triage", @"cobas® HPV Test of Cure", @"cobas® HPV Testing as Test of Cure",
                            
                            @"The Future", @"Detection", @"Earlier identification", @"Peace of mind",
                            
                            @"Genotyping", @"HPV and Cervical Cancer", @"How prevalent is each hrHPV strain in women with SCC or ADC?", @"Same cytology. Different risk", @"What does uncertainty look like?", @"Absolute risk in the ASC-US population pooled hrHPV+ and NILM population HPV 16+", @"Absolute risk at Baseline for ≥CIN3 in ASC-US and NILM populations", @"cobas® HPV 16 and HPV18 genotyping results identifies women with negative cytology...",
                            
                            @"Athena. A Landmark Clinical Trial", @"A Landmark Clinical Trial  47,000 women tested", @"The cobas® HPV Test. The only CE IVD and FDA approved test  that:", @"In equivocal cytology, The cobas® HPV Test is equal to standard pooled hrHPV tests.", @"What's the relative risk of developing the following conditions?", @"The cobas® HPV Test identifies ≥CIN3 in women with negative cytology", @"Absolute risk at Baseline of ≥CIN3", @"Same cytology. Different risk", @"What happens next?",
                            
                            @"How Does It Work?", @"The right cut off point", @"3 in 1",
                            
                            @"Smarter Questions. Better Outlook", @"How it helps you",
                            
                            @"Patient Consultation Video Guides", @"Different approaches to patient consultations",
                            
                            @"Meet Roche", @"Map of Roche", @"How we connect disciplines to deliver", @"What do you get when you personalise healthcare?",
                            nil];

    self.sectionsArray = [NSArray arrayWithObjects:@"0", @"1", @"7", @"12", @"20", @"24", @"32", @"41", @"44", @"46", @"48", @"52",nil];

    self.slidesArray = [NSArray arrayWithObjects: @"section0S0",
                        @"section1S0", @"section1S1", @"section1S2", @"section1S3", @"section1S4", @"section1S5",
                        
                        @"section2S0", @"section2S1", @"section2S2", @"section2S3", @"section2S4",
                        
                        @"section3S0", @"section3S1", @"section3S2", @"section3S3", @"section3S4", @"section3S5", @"section3S6", @"section3S7",
                        
                        @"section4S0", @"section4S1", @"section4S2", @"section4S3",
                        
                        @"section5S0", @"section5S1", @"section5S2", @"section5S3", @"section5S4", @"section5S5", @"section5S6", @"section5S7",
                        
                        @"section6S0", @"section6S1", @"section6S2", @"section6S3", @"section6S4", @"section6S5", @"section6S6", @"section6S7", @"section6S8",
                        
                        @"section7S0", @"section7S1", @"section7S2",
                        
                        @"section8S0", @"section8S1",
                        
                        @"section9S0", @"section9S1",
                        
                        @"section10S0", @"section10S1", @"section10S2", @"section10S3",
                        nil];
    // TABLE
    self.slideTable.layer.transform = CATransform3DRotate(CATransform3DIdentity,-1.57079633,0,0,1);
    self.slideTable.frame = CGRectMake(0, 60, 1024, 138);
    
    _curSlide = -1;
    _curSection = 0;
    
    [self.sectionLabel setText:[self.sectionsNameArray objectAtIndex:0]];
    [self.slideLabel setText:[self.slidesNameArray objectAtIndex:0]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.sectionLabel = nil;
    self.slideLabel = nil;
    self.slideTable = nil;
}

- (void)dealloc
{
    _delegate = nil;
    [super dealloc];
    [_slidesArray release];
    [_sectionsArray release];
    [_slidesNameArray release];
    [_sectionsNameArray release];
}

#pragma mark - UIScrollBar

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
//{
//    
//    CGFloat unguidedOffsetY = targetContentOffset->y;
////    NSLog(@">>>>> %f", unguidedOffsetY);
//    CGFloat guidedOffsetY;
//    
//    if (unguidedOffsetY > 180/2) {
//        int remainder = lroundf(unguidedOffsetY) % lroundf(180);
////        NSLog(@"Remainder: %d", remainder);
//        if (remainder < (180/2)) {
//            guidedOffsetY = unguidedOffsetY - remainder;
//        }
//        else {
//            guidedOffsetY = unguidedOffsetY - remainder + 180;
//        }
//    }
//    else {
//        guidedOffsetY = 0;  
//    }
//    
//    targetContentOffset->y = guidedOffsetY;
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = floor(((scrollView.contentOffset.y + 512 - 420)) / 180) ;
    //NSLog(@"%d",page);
    _curSection = page;
    int curSection = 0;
    for (int i = 0; i < self.sectionsArray.count; ++i)
        if (page <= ([[self.sectionsArray objectAtIndex:i] intValue] - 1))
        {
            curSection = i - 1;
            break;
        }
    
//    _curSlide = page - 1;
    
    [self.sectionLabel setText:[self.sectionsNameArray objectAtIndex:curSection]];
    [self.slideLabel setText:[self.slidesNameArray objectAtIndex:_curSection]];

//    if([self.delegate respondsToSelector:@selector(slideCellSelected:)])
//        [self.delegate slideCellSelected:[NSIndexPath indexPathForRow:(_curSection - 1) inSection:0] ];
    
    [self.slideTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:_curSection + 1 inSection:0 ] animated:NO scrollPosition:UITableViewScrollPositionMiddle];

    [self.slideTable reloadData];
    
    if([self.delegate respondsToSelector:@selector(resetTimer)])
        [self.delegate resetTimer];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int page = floor(((scrollView.contentOffset.y + 512 - 420)) / 180) ;
    //NSLog(@"%d",page);
    _curSection = page;
    int curSection = 0;
    for (int i = 0; i < self.sectionsArray.count; ++i)
        if (page <= ([[self.sectionsArray objectAtIndex:i] intValue] - 1))
        {
            curSection = i - 1;
            break;
        }
    
    _curSlide = page - 1;
    
    [self.sectionLabel setText:[self.sectionsNameArray objectAtIndex:curSection]];
    [self.slideLabel setText:[self.slidesNameArray objectAtIndex:_curSection]];
    
    [self.slideTable reloadData];
    
    if([self.delegate respondsToSelector:@selector(resetTimer)])
        [self.delegate resetTimer];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.slidesArray count] + 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 53)
    {
        UITableViewCell *cellB = [tableView dequeueReusableCellWithIdentifier:@"blankCell"];
        if (cellB == nil)
            cellB = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"blankCell"] autorelease];
        
        cellB.layer.transform = CATransform3DRotate(CATransform3DIdentity, 1.57079633, 0, 0, 1);
        cellB.frame=CGRectMake(0, 0, 420, 138);
        [cellB setSelectionStyle:UITableViewCellSelectionStyleNone];
        //[cellB release];
        return cellB;
    }
    
    ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:[ContentCell identifier]];
    if (cell)
        [cell updateWithName:[self.slidesArray objectAtIndex:(indexPath.row - 1)] withSection:(_curSection != (indexPath.row - 1)) withSlide:(_curSlide != (indexPath.row - 2))];
    else
        cell = [ContentCell cellWithName:[self.slidesArray objectAtIndex:(indexPath.row - 1)] withSection:(_curSection != (indexPath.row - 1)) withSlide:(_curSlide != (indexPath.row - 2))];

    cell.layer.transform = CATransform3DRotate(CATransform3DIdentity, 1.57079633, 0, 0, 1);
    cell.frame=CGRectMake(0, 0, 180, 138);
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        case 53:
            return 420;
        default:
            return [ContentCell rowHeight];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 53)
        return;
    //if (indexPath.row == 1)
        //return;
    int row = _curSlide;
    _curSlide = -1;
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:row inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
    _curSlide = indexPath.row - 2;
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
    [tableView reloadData];
    
    if([self.delegate respondsToSelector:@selector(slideCellSelected:)])
        [self.delegate slideCellSelected:[NSIndexPath indexPathForRow:(indexPath.row - 2) inSection:0] ];
    
    if([self.delegate respondsToSelector:@selector(resetTimer)])
        [self.delegate resetTimer];
    
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];

}
- (void)setCurrentSlide:(int)slide
{
//    NSLog(@"+++ %i", slide);
    
    _curSlide = slide;
    _curSection = slide + 1;
    
    //NSLog(@"%d",page);
    //_curSection = slide;
    int curSection = 0;
    for (int i = 0; i < self.sectionsArray.count; ++i)
        if ((slide + 1) <= ([[self.sectionsArray objectAtIndex:i] intValue] - 1))
        {
            curSection = i - 1;
            break;
        }
//    NSLog(@">>> %i", curSection);
    [self.sectionLabel setText:[self.sectionsNameArray objectAtIndex:curSection]];
    [self.slideLabel setText:[self.slidesNameArray objectAtIndex:_curSection]];
    
    [self.slideTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:slide+2 inSection:0 ] animated:NO scrollPosition:UITableViewScrollPositionMiddle];

    [self.slideTable reloadData];
//    int currentSection = 0;
//    for (int i = 0; i < self.sectionsArray.count; ++i)
//        if (slide <= ([[self.sectionsArray objectAtIndex:i] intValue] - 2))
//        {
//            currentSection = i - 2;
//            break;
//        }
//    
//    int row = _curSlide;
//    _curSlide = -1;
//    [self.slideTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:row inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
//    _curSlide = slide;
//    [self.slideTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:_curSlide inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
//    
//    [self.sectionLabel setText:[self.sectionsNameArray objectAtIndex:currentSection]];
//    [self.slideLabel setText:[self.slidesNameArray objectAtIndex:slide]];

}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
