//
//  NotificationView.m
//  TestGrid
//
//  Created by Harry Groover on 11/7/11.
//  Copyright 2011 RIT. All rights reserved.
//

#import "NotificationView.h"

@implementation NotificationView


int const GRIDCOLUMNS = 3;
int const GRIDROWS = 3;

- (id)initWithFrame:(NSRect)frame
{
  self = [super initWithFrame:frame];
  int width = frame.size.width;
  NSLog(@"frame width: %d", width);
  return self;
}

- (void) drawRect:(CGRect)rect
{
  NSRect bounds = [self bounds];
  
  NSBezierPath* clipShape = [NSBezierPath bezierPath];
  [clipShape appendBezierPathWithRoundedRect:bounds xRadius:8 yRadius:8];
  
  NSBezierPath* oneGrid = [NSBezierPath bezierPath];
  [oneGrid appendBezierPathWithRoundedRect:NSMakeRect(25, 25, 50, 50) xRadius:4 yRadius:4];
  
  
  [clipShape setWindingRule:NSEvenOddWindingRule];
  [clipShape appendBezierPath: oneGrid];
  [clipShape addClip];
  
  NSGradient* aGradient = [[[NSGradient alloc]
                            initWithColorsAndLocations:[NSColor colorWithCalibratedRed:143/255.0 green:153/255.0 blue:155/255.0 alpha:1.0f], (CGFloat)0.0,
                            [NSColor colorWithCalibratedRed:30/255.0 green:40/255.0 blue:39/255.0 alpha:1.0f], (CGFloat)0.30,
                            [NSColor colorWithCalibratedRed:19/255.0 green:31/255.0 blue:29/255.0 alpha:1.0f], (CGFloat)0.33,
                            [NSColor colorWithCalibratedRed:21/255.0 green:35/255.0 blue:46/255.0 alpha:1.0f], (CGFloat)1.0,
                            nil] autorelease];
  
  
  [aGradient drawInBezierPath:clipShape angle:-90.0];
  
  [clipShape stroke];
  /*
	// Drawing code here.
  int width = rect.size.width;
  int height = rect.size.height;
  
  NSLog(@"Width: %d", width);
  
  int i = 0;
  
  // Set the color in the current graphics context for future draw operations
  [[NSColor lightGrayColor] setStroke];
  
  // Create our drawing path
  
  NSBezierPath* drawingPath = [NSBezierPath bezierPath];
  
  // Draw a grid
  // first the vertical lines
  for( i = 0 ; i <= width ; i=i+(width/GRIDCOLUMNS)) {
    [drawingPath moveToPoint:NSMakePoint(i, 0)]; [drawingPath lineToPoint:NSMakePoint(i, height)];
  }
  // then the horizontal lines
  for( i = 0 ; i <= height ; i=i+(height/GRIDROWS) ) {
    [drawingPath moveToPoint:NSMakePoint(0,i)]; [drawingPath lineToPoint:NSMakePoint(width, i)];
  }
  // actually draw the grid
  [drawingPath stroke];
   */
}


- (void)fade
{
  [self setAlphaValue:1.0];
    
  [[NSAnimationContext currentContext] setDuration:0.5];
  [[self animator] setAlphaValue:0.0];  
}

@end
