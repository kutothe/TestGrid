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
  self.transWindow = [[[TransparentWindow alloc] init] autorelease];
  [transWindow setCollectionBehavior: NSWindowCollectionBehaviorCanJoinAllSpaces];
  

  NSRect screen = [[NSScreen mainScreen] frame];
  NotificationView *notificationView = [[[NotificationView alloc] initWithFrame:CGRectMake(screen.size.width / 2, screen.size.height / 2, 50, 50)] autorelease];
  
  [self.transWindow resetFrame];  // the screen size may have changed if using ext monitors etc
  
  [self.transWindow setContentView:notificationView];
  
  [self.transWindow display];  // make ready for display when the window is ordered front
  
  //[notificationView fade];
  
  [self.transWindow orderFront:self];

}

@end
