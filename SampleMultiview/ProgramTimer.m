//
//  ProgramTimer.m
//  GymApp
//
//  Created by James Dunwoody on 5/08/12.
//
//

#import "ProgramTimer.h"

@implementation ProgramTimer

- (id) initWithElapsedTimeObserver: (id<ProgramTimerObserver>) withElapsedTimeObserver
{
    //    self = [super init];
    //    if (self) {
    programTimeObserver = withElapsedTimeObserver;
    secondsCounted = 0;
    timer = nil;
    //    }
    return self;
}

- (BOOL) isRunning {
    return [timer isValid];
}

- (void) stop {
    [timer invalidate];
    timer = nil;
    [self reset];
    [self updateLabel];
}

- (void) start {
    if (![self isRunning]) {
        [self reset];
        [self resume];
    }
}

- (void) pause {
    if (timer != nil) {
        if ([self isRunning]) {
            [timer invalidate];
        } else {
            [self updateLabel];
            [self resume];
        }
    }
}

-(void) resume {
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(nextSecond) userInfo:nil repeats: YES];
}

-(void) reset {
    secondsCounted = 0;
}

-(void) updateLabel {
    [programTimeObserver programTimerUpdate: [self displayText]];
    //    label.text = [self text];
}

- (NSString *) displayText {
    int hours = (secondsCounted) / 3600;
    int minutes = (secondsCounted % 3600) / 60;
    int seconds = (secondsCounted %3600) % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
    //    return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
}

-(void) nextSecond {
    secondsCounted++;
    
    [self updateLabel];
}


@end
