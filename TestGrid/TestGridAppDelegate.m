//
//  TestGridAppDelegate.m
//  TestGrid
//
//  Created by Harry Groover on 11/7/11.
//  Copyright 2011 RIT. All rights reserved.
//

#import "TestGridAppDelegate.h"

@implementation TestGridAppDelegate

@synthesize window, transWindow;

int const NUMROWS = 3;
int const NUMCOLS = 3;
int const SPACEWIDTH = 70;
int const SPACEHEIGHT = 40;
int const SPACEPADDING = 9;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  self.transWindow = [[[TransparentWindow alloc] init] autorelease];
  [self.transWindow calculateSize:NUMROWS numCols:NUMCOLS spaceWidth:SPACEWIDTH spaceHeight:SPACEHEIGHT spacePadding:SPACEPADDING];
  [transWindow setCollectionBehavior: NSWindowCollectionBehaviorCanJoinAllSpaces];
  
  [self showGrid];
}

- (void)showGrid
{
  [self.transWindow resetFrame];  // the screen size may have changed if using ext monitors etc
  
  NotificationView *notificationView = [[[NotificationView alloc] initWithFrame:self.transWindow.frame] autorelease];
  notificationView.numRows = NUMROWS;
  notificationView.numCols = NUMCOLS;
  notificationView.spaceWidth = SPACEWIDTH;
  notificationView.spaceHeight = SPACEHEIGHT;
  notificationView.spacePadding = SPACEPADDING;
  notificationView.currentSpace = 4;
  notificationView.previousSpace = 3;
  
  [self.transWindow setContentView:notificationView];
  [self.transWindow display];  // make ready for display when the window is ordered front
  
  //[notificationView fade];
  
  [self.transWindow orderFront:self];
}

@end
