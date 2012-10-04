//
//  ContentsViewController.h
//  Cobas
//
//  Created by  on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContentsViewDelegate 

@optional 
- (void)slideCellSelected:(NSIndexPath *)indexPath; 
- (void)resetTimer;

@end 

@interface ContentsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
{
    id <ContentsViewDelegate> _delegate;
    UITableView *_slideTable;
    UILabel *_sectionLabel;
    UILabel *_slideLabel;
    NSArray *_sectionsArray;
    NSArray *_slidesArray;
    NSArray *_sectionsNameArray;
    NSArray *_slidesNameArray;
    int _curSlide;
    int _curSection;
}

@property (nonatomic, assign) id delegate;
- (void)setCurrentSlide:(int)slide;

@end
