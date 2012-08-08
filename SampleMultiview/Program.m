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

- (id) initWithProgramStatus: (id<ProgramStatusProtocol>)withProgramStatus
{
    if (self = [super init]) {
        exercises = [[NSMutableArray alloc] init];
        programStatus = withProgramStatus;
        current = nil;
    }
    return self;
}

- (Exercise *)currentExercise
{
    if (current == nil) {
        if ([exercises count] == 0) {
            return nil;
        }
        current = [exercises objectAtIndex:0];
    }
    
    return current;
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
