//
//  Exercise.h
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseWeightOrTimeMode.h"

typedef enum {
    ExerciseIntensityAerobicLight, 
    ExerciseIntensityAerobicMedium, 
    ExerciseIntensityAerobicIntense, 
    ExerciseIntensityAnaerobicLight, 
    ExerciseIntensityAnaerobicMedium, 
    ExerciseIntensityAnaerobicIntense
} IntensityTypes;

@interface Exercise : NSObject 
    @property NSString *name;
    @property NSNumber *reps;
//    @property NSNumber *sets;
    @property NSNumber *weight;
    @property BOOL isSingle;
    @property NSString *bodyPart;
    @property NSString *category;
    @property NSString *rest;
    @property BOOL isCompleted;
    @property NSString *intensity;
    @property BOOL superSet;
    @property BOOL isAdd;
    @property ExerciseWeightOrTimeMode exerciseWeightOrTimeMode;

- (NSString *) restAsDisplayValue;

//    - (id)initWithLabel: (NSString *)label;

@end
