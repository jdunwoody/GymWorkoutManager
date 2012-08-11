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
    int currentExerciseIndex;
    NSMutableArray *exercises;
    id<ProgramStatusProtocol> programStatus;
}

@property (strong, nonatomic) NSString *name;

- (id) initWithProgramStatus: (id<ProgramStatusProtocol>)withProgramStatus;

- (int) count;
- (Exercise *) currentExercise;
- (Exercise *) exerciseAtIndex:(NSUInteger)theIndex;
- (void) next;
- (Exercise *)nextExercise;

- (void) addExercise:(Exercise *)exercise;
- (void) removeExerciseAtIndex:(NSUInteger)theIndex;
- (void) updateExerciseAtIndex:(NSUInteger)row withObject:(Exercise *)exercise;

@end
