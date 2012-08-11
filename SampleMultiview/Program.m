//
//  Program.m
//  GymApp
//
//  Created by James Dunwoody on 3/08/12.
//
//

#import "Program.h"
#import "Exercise.h"
#import "ProgramStatusProtocol.h"

@implementation Program
@synthesize name;

- (id) initWithProgramStatus: (id<ProgramStatusProtocol>)withProgramStatus
{
    if (self = [super init]) {
        exercises = [[NSMutableArray alloc] init];
        programStatus = withProgramStatus;
        current = nil;
        currentExerciseIndex = 0;
    }
    return self;
}

- (Exercise *)currentExercise
{
    if (current == nil) {
        if ([exercises count] == 0) {
            return nil;
        }
        currentExerciseIndex = 0;
    }
    
    if (currentExerciseIndex >= [exercises count]) {
        current = nil;
    } else {
        current = [exercises objectAtIndex:currentExerciseIndex];
    }
    
    return current;
}

- (void) next
{
    currentExerciseIndex++;
}

- (Exercise *)nextExercise
{
    if (currentExerciseIndex < [exercises count] - 1) {
        return [exercises objectAtIndex:currentExerciseIndex + 1];
    }
    return nil;
}

-(void) makeSuperSetForRow: (NSInteger)row
{
    Exercise *exercise = [exercises objectAtIndex:row];
    exercise.superSet = true;
}

- (int) count
{
    return [exercises count];
}

- (Exercise *) exerciseAtIndex:(NSUInteger)theIndex
{
    return [exercises objectAtIndex:theIndex];
}

-(void) removeExerciseAtIndex:(NSUInteger)theIndex
{
    [exercises removeObjectAtIndex:theIndex];
}

- (void) addExercise:(Exercise *)exercise
{
    [exercises addObject:exercise];
    [programStatus programNonEmpty];
}

- (void) updateExerciseAtIndex:(NSUInteger)row withObject:(Exercise *)exercise
{
    [exercises replaceObjectAtIndex:row withObject:exercise];
}


@end
