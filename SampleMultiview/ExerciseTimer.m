//
//  ExerciseTimer.m
//  SampleMultiview
//
//  Created by James on 26/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExerciseTimer.h"
#import "TimerAlertDelegate.h"

@implementation ExerciseTimer

- (id) initWithTimerAlertDelegate: (id<TimerAlertDelegate>) newTimerAlertDelegate withDirection: (TimerDirection) newDirection withInitialSeconds: (int) newInitialSeconds {
    initialSeconds = newInitialSeconds;
    secondsCounted = 120;
    timer = nil;
    timerAlertDelegate = newTimerAlertDelegate;
    direction = newDirection;
    return self;
}

- (BOOL) isRunning {
    return [timer isValid];
}

- (IBAction)pauseTimerPressed:(id)sender {
    if (timer != nil && [timer isValid]) {
        [timer invalidate];
    } else {
        [self updateLabel];
        [self start];
    }
}

-(void) updateLabel {
    [timerAlertDelegate updateLabelWithText: [self text]];
//    label.text = [self text];
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
    secondsCounted = initialSeconds;
}

-(void) nextSecond {
    if (secondsCounted > 0) {
        secondsCounted--;
       
        if (secondsCounted < 10) {
            [timerAlertDelegate timerAlert];
        } else if (secondsCounted < 20) {
            [timerAlertDelegate timerWarning];
        }
        
        [self updateLabel];
    }
}

- (NSString *) text {
//    int hours = secondsElapsed / 3600;
    int minutes = (secondsCounted % 3600) / 60;
    int seconds = (secondsCounted %3600) % 60;
    
//    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];    
    return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];    
}

@end
