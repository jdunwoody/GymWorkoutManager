//
//  Exercise.h
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ExerciseIntensityAerobicLight, 
    ExerciseIntensityAerobicMedium, 
    ExerciseIntensityAerobicIntense, 
    ExerciseIntensityAnaerobicLight, 
    ExerciseIntensityAnaerobicMedium, 
    ExerciseIntensityAnaerobicIntense
} Intensity;

@interface Exercise : NSObject 
    @property NSString *name;
    @property NSNumber *reps;
    @property NSNumber *sets;
    @property NSNumber *weights;
    @property BOOL isSingle;
    @property NSString *category;
    @property NSString *rest;
    @property BOOL isCompleted;
    @property Intensity intensity;
    @property BOOL superSet;
    @property BOOL isAdd;

//    - (id)initWithLabel: (NSString *)label;

@end
