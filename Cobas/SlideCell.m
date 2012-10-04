//
//  SlideCell.m
//  Cobas
//
//  Created by  on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SlideCell.h"

@interface SlideCell()

@property (nonatomic, retain) id slideController;

@end

@implementation SlideCell

@synthesize slideController = _slideController;

- (void)startSlideAnimation
{
    
}

- (void)updateWithView:(UIViewController *)view
{
    while ([self.subviews count] > 0)
        [[self.subviews objectAtIndex:0] removeFromSuperview];
    self.slideController = view;
    [self addSubview:[self.slideController view]];
}

+ (SlideCell *)cellWithView:(UIViewController *)view
{
    SlideCell *result = [[[NSBundle mainBundle] loadNibNamed:@"SlideCell" owner:nil options:nil] objectAtIndex:0];
    [result updateWithView:view];
    return result;
}

+ (CGFloat)rowHeight
{
    return 1024;
}

+ (NSString *)identifier
{
    return @"SlideCell";
}

- (void)startAnimation
{
    if ([self.slideController respondsToSelector:@selector(startSlideAnimation)])
        [self.slideController startSlideAnimation]; 
}
- (void)dealloc
{
    [_slideController release];
    [super dealloc];
}

@end
