//
//  MenuViewController.h
//  Cobas
//
//  Created by  on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController
{
    UIView *_menuView;
    UIButton *_homeButton;
    UIButton *_indexButton;
    UIButton *_contentsButton;
    UIButton *_contactsButton;
    BOOL _state;
    NSTimer *_menuTimer;
}

@property (assign, nonatomic) IBOutlet UIButton *homeButton;
@property (assign, nonatomic) IBOutlet UIButton *indexButton;
@property (assign, nonatomic) IBOutlet UIButton *contentsButton;
@property (assign, nonatomic) IBOutlet UIButton *contactsButton;

- (void)showMenu:(BOOL)state;
- (void)switchTimer:(BOOL)state;

@end
