//
//  ExerciseTimer.m
//  SampleMultiview
//
//  Created by James on 26/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExerciseTimer.h"

@implementation ExerciseTimer

- (id) initWithLabel: (UILabel *) newLabel {
    secondsElapsed = 0;
    timer = nil;
    label = newLabel;
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
    label.text = [self text];
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
    timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats: YES];        
}

-(void) reset {
    secondsElapsed = 0;
}

-(void) updateCountdown {
    secondsElapsed++;
    [self updateLabel];
}

- (NSString *) text {
    int hours = secondsElapsed / 3600;
    int minutes = (secondsElapsed % 3600) / 60;
    int seconds = (secondsElapsed %3600) % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];    
}

@end
