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

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  NSButton *myButton = [[NSButton alloc] initWithFrame:CGRectMake(50, 50, 100, 25)];
  [myButton setTitle:@"der"];
  [myButton setTarget:self];
  [myButton setAction:@selector(showGrid)];
  
  [[self.window contentView] addSubview:myButton];
  
  self.transWindow = [[[TransparentWindow alloc] init] autorelease];
  [transWindow setCollectionBehavior: NSWindowCollectionBehaviorCanJoinAllSpaces];
  
  [self showGrid];
}

- (void)showGrid
{
  [self.transWindow resetFrame];  // the screen size may have changed if using ext monitors etc
  
  NotificationView *notificationView = [[[NotificationView alloc] initWithFrame:self.transWindow.frame] autorelease];
  
  [self.transWindow setContentView:notificationView];
  [self.transWindow display];  // make ready for display when the window is ordered front
  
  //[notificationView fade];
  
  [self.transWindow orderFront:self];
}

@end
