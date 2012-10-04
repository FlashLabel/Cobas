//
//  PresentationTableViewController.h
//  Cobas
//
//  Created by  on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
#import "ContentsViewController.h"
#import "ContactViewController.h"

@interface PresentationTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, ContentsViewDelegate, ContactViewDelegate>
{
    
    UIScrollView *_indexScrolView;
    UITableView *_presentationTable;
    MenuViewController *_menuView;
    NSArray *_sectionsArray;
    NSArray *_slidesArray;
    int _currentSection;
    int _currentSlide;
    BOOL _scrollState;
    ContentsViewController *_contentsView;
    ContactViewController *_contactView;
    
    NSTimer *_contentTimer;
}

@end
