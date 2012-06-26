//
//  ExerciseTableDelegate.h
//  SampleMultiview
//
//  Created by James on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseDataController.h"

@protocol ExerciseMaintainable <NSObject>

-(void)addExerciseWithName: (NSString *)name withReps: (NSString *)reps withRest: (NSString *) selectedRest withWeight: (NSString *) selectedWeight withBodyPart: (NSString *)selectedBodyPart withIntensity: (NSString *)selectedIntensity withCategory: (NSString *)selectedCategory;

@end

@interface ExerciseTableDelegate : NSObject <UITableViewDelegate, UITableViewDataSource, ExerciseMaintainable> 

@property (strong, nonatomic) ExerciseDataController *dataController;

@end
