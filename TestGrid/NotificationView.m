//
//  NotificationView.m
//  TestGrid
//
//  Created by Harry Groover on 11/7/11.
//  Copyright 2011 RIT. All rights reserved.
//

#import "NotificationView.h"

@implementation NotificationView

@synthesize numRows, numCols, spaceWidth, spaceHeight, spacePadding;

- (id)initWithFrame:(NSRect)frame
{
  self = [super initWithFrame:frame];
  return self;
}

- (void) drawRect:(CGRect)rect
{
  [[NSGraphicsContext currentContext] saveGraphicsState];
  NSRect bounds = [self bounds];
  
  NSBezierPath* clipShape = [NSBezierPath bezierPath];
  [clipShape appendBezierPathWithRoundedRect:bounds xRadius:8 yRadius:8];
  [clipShape setWindingRule:NSEvenOddWindingRule];
  
  NSBezierPath* spacesPath = [NSBezierPath bezierPath];
  
  int k = 0;
  for (k=0; k < numRows; k++) {
    int i = 0;
    for (i=0; i < numCols; i++) {
      NSBezierPath* oneGrid = [NSBezierPath bezierPath];
      int xPos = (spacePadding*(i+1))+(spaceWidth*i);
      int yPos = (spacePadding*(k+1))+(spaceHeight*k);
      [oneGrid appendBezierPathWithRoundedRect:NSMakeRect(xPos, yPos, spaceWidth, spaceHeight) xRadius:4 yRadius:4];
      [spacesPath appendBezierPath:oneGrid];
    }
  }
  [clipShape appendBezierPath: spacesPath];
  [clipShape addClip];
  
  
  NSGradient* aGradient = [[[NSGradient alloc]
                            initWithColorsAndLocations:[NSColor colorWithCalibratedRed:143/255.0 green:153/255.0 blue:155/255.0 alpha:1.0f], (CGFloat)0.0,
                            [NSColor colorWithCalibratedRed:143/255.0 green:153/255.0 blue:155/255.0 alpha:1.0f], (CGFloat)2.0,
                            [NSColor colorWithCalibratedRed:30/255.0 green:40/255.0 blue:39/255.0 alpha:1.0f], (CGFloat)0.55,
                            [NSColor colorWithCalibratedRed:19/255.0 green:31/255.0 blue:29/255.0 alpha:1.0f], (CGFloat)0.58,
                            [NSColor colorWithCalibratedRed:21/255.0 green:35/255.0 blue:46/255.0 alpha:1.0f], (CGFloat)1.0,
                            nil] autorelease];
  
  
  [aGradient drawInBezierPath:clipShape angle:-90.0];

  [clipShape setLineWidth:2];
  [clipShape stroke];
  [[NSGraphicsContext currentContext] restoreGraphicsState];
  
  //[[NSGraphicsContext currentContext] setCompositingOperation:NSCompositeSourceOver];
  [[[NSColor blackColor] colorWithAlphaComponent:0.15] setFill];
  [spacesPath fill];
  [[[NSColor blackColor] colorWithAlphaComponent:0.3] setStroke];
  [spacesPath stroke];
  
}


- (void)fade
{
  [self setAlphaValue:1.0];
    
  [[NSAnimationContext currentContext] setDuration:0.5];
  [[self animator] setAlphaValue:0.0];  
}

@end
