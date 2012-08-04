//
//  ExerciseTableDelegate.h
//  SampleMultiview
//
//  Created by James on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseDataController.h"
#import "ExerciseWeightOrTimeMode.h"
#import "Exercise.h"
#import "ProgramStatusProtocol.h"

@protocol ExerciseMaintainable <NSObject>

-(void) addExerciseWithExercise:(Exercise *)exercise;

//-(void)addExerciseWithName: (NSString *)name withReps: (NSString *)reps withRest: (NSString *) selectedRest withWeight: (NSString *) selectedWeight withBodyPart: (NSString *)selectedBodyPart withIntensity: (NSString *)selectedIntensity withCategory: (NSString *)selectedCategory;

@end

@interface ExerciseTableDelegate : NSObject <UITableViewDelegate, UITableViewDataSource, ExerciseMaintainable> 
- (id) initWithTimerViewDelegate: (id<ProgramStatusProtocol>)programStatus;

//-(id) initWithTableView
-(void) deleteWithIndexPaths: (NSArray *)indexPaths;
//-(id) initWithTableView:(UITableView *)tableView;
-(void) updateRowWithExercise: (Exercise *) exercise withRow: (NSInteger) row; 
-(void) addExerciseWithExercise:(Exercise *)exercise;
- (Exercise *)currentExercise;

@property (strong, nonatomic) id<ProgramStatusProtocol> programStatus;
@property (strong, nonatomic) ExerciseDataController *dataController;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIColor *backgroundColor;

@end
