//
//  NotificationView.h
//  TestGrid
//
//  Created by Harry Groover on 11/7/11.
//  Copyright 2011 RIT. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NotificationView : NSView
{
  int numCols;
  int numRows;
  int spaceWidth;
  int spaceHeight;
  int spacePadding;
  int currentSpace;
  int previousSpace;
}

@property (assign) int numCols;
@property (assign) int numRows;
@property (assign) int spaceWidth;
@property (assign) int spaceHeight;
@property (assign) int spacePadding;
@property (assign) int currentSpace;
@property (assign) int previousSpace;


- (void) fade;

@end
