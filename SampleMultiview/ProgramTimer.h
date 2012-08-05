//
//  ProgramTimer.h
//  GymApp
//
//  Created by James Dunwoody on 5/08/12.
//
//

#import <Foundation/Foundation.h>
#import "ProgramTimerObserver.h"

@interface ProgramTimer : NSObject
- (id) initWithElapsedTimeObserver: (id<ProgramTimerObserver>) withElapsedTimeObserver;
- (BOOL) isRunning;
- (void) pause;
- (void) stop;
- (void) start;
@end

id<ProgramTimerObserver> programTimeObserver;
int secondsCounted;
NSTimer *timer;
UILabel *label;
