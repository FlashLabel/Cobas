//
//  CMovieViewController.m
//  Cobas
//
//  Created by Maria Huseva on 19.07.12.
//  Copyright (c) 2012 MSLU. All rights reserved.
//

#import "CMovieViewController.h"

@implementation CMovieViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    ///return NO;
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        return NO;
    return YES;
}

@end