//
//  ExerciseTimer.h
//  SampleMultiview
//
//  Created by James on 26/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExerciseTimer : NSObject
- (id) initWithLabel: (UILabel *) label;
- (BOOL) isRunning;
- (void) pause;
- (void) stop;
- (void) start;
@end

int secondsElapsed;
NSTimer *timer;
UILabel *label;
