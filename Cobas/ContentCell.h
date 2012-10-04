//
//  ContentCell.h
//  Cobas
//
//  Created by  on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UITableViewCell
{
    UIImageView *_slideView;
    UIImageView *_selectView;
    UIImageView *_sectionView;
}

+ (CGFloat)rowHeight;
+ (NSString *)identifier;
+ (ContentCell *)cellWithName:(NSString *)name withSection:(BOOL)section withSlide:(BOOL)slide;
- (void)updateWithName:(NSString *)name withSection:(BOOL)section withSlide:(BOOL)slide;
- (void)showSelect:(BOOL)select;

@end
