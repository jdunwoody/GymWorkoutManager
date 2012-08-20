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
@synthesize name = _name;

- (id) initWithName: (NSString *) name
{
    if (self = [super init]) {
        exercises = [[NSMutableArray alloc] init];
        self.name = name;
        current = nil;
      }
    return self;

}

- (BOOL) empty
{
    return [exercises count] == 0;
}

//- (id) initWithProgramStatus: (id<ProgramStatusProtocol>)withProgramStatus
//{
//    if (self = [super init]) {
//        exercises = [[NSMutableArray alloc] init];
//        programStatus = withProgramStatus;
//        current = nil;
//        currentExerciseIndex = 0;
//    }
//    return self;
//}

- (Exercise *)currentExercise
{
    if (current == nil) {
        if ([exercises count] == 0) {
            return nil;
        }
        current = [exercises objectAtIndex:0];
    } else if (current == [exercises objectAtIndex:[exercises count] -1]) {
        current = nil;
    } else {
        current = [exercises objectAtIndex:[exercises indexOfObject:current]];
    }
    
    return current;
}

- (void) next
{
    current = [exercises objectAtIndex:[exercises indexOfObject:current]];
}

- (Exercise *)nextExercise
{
    if (current == [exercises objectAtIndex:[exercises count] -1]) {
        current = nil;
    } else {
        current = [exercises objectAtIndex:[exercises indexOfObject:current] + 1];
    }
    
    return nil;
}

- (int) count
{
    return [exercises count];
}

- (Exercise *) exerciseAtIndex:(NSUInteger)theIndex
{
    return [exercises objectAtIndex:theIndex];
}

- (BOOL) isIndexOfCurrentExercise: (NSIndexPath *) index
{
    return [exercises indexOfObject:self.currentExercise] == index.row;
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

- (void) currentExerciseIsCompleted
{
    [self nextExercise];
}

@end
