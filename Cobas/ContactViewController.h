//
//  ContactViewController.h
//  Cobas
//
//  Created by  on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@protocol ContactViewDelegate

@optional
- (void)closeContactView;

@end

@interface ContactViewController : UIViewController <MFMailComposeViewControllerDelegate>
{
        id <ContactViewDelegate> _delegate;
}

@property (nonatomic, assign) id delegate;

@end
 