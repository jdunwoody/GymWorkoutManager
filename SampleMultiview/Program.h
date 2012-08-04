//
//  Program.h
//  GymApp
//
//  Created by James Dunwoody on 3/08/12.
//
//

#import <Foundation/Foundation.h>
#import "Exercise.h"
#import "ProgramStatusProtocol.h"

@interface Program : NSObject
{
    Exercise *current;
    NSMutableArray *exercises;
    id<ProgramStatusProtocol> programStatus;
}

- (id) initWithProgramStatus: (id<ProgramStatusProtocol>)withProgramStatus;
- (Exercise *) currentExercise;
- (int) count;
- (Exercise *) exerciseAtIndex:(NSUInteger)theIndex;
- (void) removeExerciseAtIndex:(NSUInteger)theIndex;
- (void) addExercise:(Exercise *)exercise;
- (void) updateExerciseAtIndex:(NSUInteger)row withObject:(Exercise *)exercise;

@end
