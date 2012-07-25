//
//  WeightExercise.m
//  GymApp
//
//  Created by James on 25/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeightExercise.h"


@implementation WeightExercise
@synthesize weight = _weight;
@synthesize sets = _sets;
@synthesize reps = _reps;

- (id)init 
{
    if (self = [super init]) {
        self.exerciseWeightOrTimeMode = ExerciseWeightMode;    
    }
    return self;
}

- (NSString *) repsAsDisplayValue
{
    return [NSString stringWithFormat:@"%@ reps", [_reps stringValue]]; 
    //  myString = [NSString stringWithFormat:@"%d", [myPowerOnOrNot stringValue]];
    
}


- (NSString *) weightAsDisplayValue
{
    return [NSString stringWithFormat:@"%@ kg", [self.weight stringValue]];    
}

@end
