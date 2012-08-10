//
//  ExerciseDataController.m
//  Gym2000AndAwesome
//
//  Created by James on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExerciseDataController.h"
#import "Exercise.h"

@implementation ExerciseDataController

@synthesize program;

- (id)initWithProgram: (Program *) withProgram {
    if (self = [super init]) {
        program = withProgram;
    }
    return self;
}


- (NSUInteger)countOfList {
    return [self.program count];
}

- (Exercise *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.program exerciseAtIndex:theIndex];
}

@end


//- (void)initializeDefaultDataList {
//}

//    self.exercises = [[NSMutableArray alloc] init];

//    Exercise *exercise = [[Exercise alloc] init];
//    exercise.category = @"Individual";
//    exercise.name = @"Air Squat";
//    exercise.rest = @"10sec";
//    exercise.weights = [NSNumber numberWithInt:10];
//    exercise.intensity = ExerciseIntensityAnaerobicLight;
//    [self.exercises addObject:exercise];
//
//    exercise = [[Exercise alloc] init];
//    exercise.category = @"Super set";
//    exercise.name = @"Push up";
//    exercise.rest = nil;
//    exercise.weights = [NSNumber numberWithInt:20];
//    exercise.intensity = ExerciseIntensityAnaerobicIntense;
//    [self.exercises addObject:exercise];
//
//    exercise = [[Exercise alloc] init];
//    exercise.category = @"Super set";
//    exercise.name = @"Push up";
//    exercise.rest = @"30sec";
//    exercise.weights = [NSNumber numberWithInt:110];
//    exercise.intensity = ExerciseIntensityAerobicIntense;
//    [self.exercises addObject:exercise];
//
//    exercise = [[Exercise alloc] init];
//    exercise.category = @"Super set";
//    exercise.name = @"Push up";
//    exercise.rest = @"15sec";
//    exercise.weights = [NSNumber numberWithInt:1];
//    exercise.intensity = ExerciseIntensityAerobicLight;
//    [self.exercises addObject:exercise];

//    exercise = [[Exercise alloc] init];
//    exercise.category = @"None";
//    exercise.name = @"Add exercise";
//    exercise.isAdd = true;
//    exercise.weights = [NSNumber numberWithInt:12];
//    exercise.intensity = ExerciseIntensityAerobicMedium;
//    exercise.rest = @"10sec";
//    [self.exercises addObject:exercise];

//    NSMutableArray *exerciseList = [[NSMutableArray alloc] initWithObjects:@"Push up", @"Sit up", @"Burpee", @"Star jump", @"Bicup curls", @"Squats", @"Other", nil];
//    self.exercises = exerciseList;

//    NSMutableArray *exerciseList = [[NSMutableArray alloc] init];
//
//    [exerciseList addObject: [Exercise in
//    self.exercises = exerciseList;

//    [self.exercises addObject: @"Push up", @"Sit up", @"Burpee", @"Star jump", @"Bicup curls", @"Squats", @"Other"];


//- (void)setExercises:(NSMutableArray *)newList {
//    if(_exercises != newList) {
//        _exercises = [newList mutableCopy];
//    }
//}
