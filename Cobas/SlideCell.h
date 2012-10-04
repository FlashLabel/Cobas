//
//  SlideCell.h
//  Cobas
//
//  Created by  on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideCell : UITableViewCell
{
    id _slideController;
}

+ (CGFloat)rowHeight;
+ (NSString *)identifier;
+ (SlideCell *)cellWithView:(UIViewController *)view;
- (void)updateWithView:(UIViewController *)view;

- (void)startAnimation;

- (void)startSlideAnimation;

@end
