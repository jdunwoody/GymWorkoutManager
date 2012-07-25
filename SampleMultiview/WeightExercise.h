//
//  WeightExercise.h
//  GymApp
//
//  Created by James on 25/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Exercise.h"

@interface WeightExercise : Exercise

@property NSNumber *reps;
@property NSNumber *sets;
@property NSNumber *weight;

- (NSString *) repsAsDisplayValue;
- (NSString *) weightAsDisplayValue;
@end
