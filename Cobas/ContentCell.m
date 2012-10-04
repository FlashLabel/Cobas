//
//  ContentCell.m
//  Cobas
//
//  Created by  on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContentCell.h"

@interface ContentCell()

@property (assign, nonatomic) IBOutlet UIImageView *slideView;
@property (assign, nonatomic) IBOutlet UIImageView *selectView;
@property (assign, nonatomic) IBOutlet UIImageView *sectionView;

@end

@implementation ContentCell

@synthesize slideView = _slideView;
@synthesize selectView = _selectView;
@synthesize sectionView = _sectionView;

- (void)updateWithName:(NSString *)name withSection:(BOOL)section withSlide:(BOOL)slide
{
    [self.slideView setImage:[UIImage imageNamed:name]];
    [self.selectView setHidden:section];
    [self.sectionView setHidden:YES];
    if(!section)
        return;
    [self.sectionView setHidden:slide];
}

+ (ContentCell *)cellWithName:(NSString *)name withSection:(BOOL)section withSlide:(BOOL)slide
{
    ContentCell *result = [[[NSBundle mainBundle] loadNibNamed:@"ContentCell" owner:nil options:nil] objectAtIndex:0];
    [result updateWithName:name withSection:section withSlide:slide];
    return result;
}

+ (CGFloat)rowHeight
{
    return 180;
}

+ (NSString *)identifier
{
    return @"ContentCell";
}

- (void)showSelect:(BOOL)select
{
    [self.selectView setHidden:NO];
}

@end
