//
//  TestGridAppDelegate.h
//  TestGrid
//
//  Created by Harry Groover on 11/7/11.
//  Copyright 2011 RIT. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NotificationView.h"
#import "TransparentWindow.h"

extern int const NUMROWS;
extern int const NUMCOLS;
extern int const SPACEWIDTH;
extern int const SPACEPADDING;

@interface TestGridAppDelegate : NSObject <NSApplicationDelegate> {
  NSWindow *window;
  TransparentWindow *transWindow;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) TransparentWindow *transWindow;

- (void)showGrid;

@end
