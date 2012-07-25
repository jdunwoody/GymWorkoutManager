//
//  TimeExercise.m
//  GymApp
//
//  Created by James on 25/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimeExercise.h"

@implementation TimeExercise

@synthesize time = _time;

- (id)init 
{
    if (self = [super init]) {
        self.exerciseWeightOrTimeMode = ExerciseTimeMode;    
    }
    return self;
}

- (NSString *) timeAsDisplayValue 
{ 
    return [NSString stringWithFormat:@"%@ mins", [_time stringValue]]; 
}

@end
