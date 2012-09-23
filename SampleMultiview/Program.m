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
@synthesize exercises = _exercises;

- (id) initWithName: (NSString *) name
{
    if (self = [super init]) {
        self.exercises = [[NSMutableArray alloc] init];
        self.name = name;
        current = nil;
    }
    return self;
}

- (BOOL) empty
{
    return [self.exercises count] == 0;
}

- (Exercise *)currentExercise
{
    if (current == nil) {
        if ([self.exercises count] == 0) {
            return nil;
        }
        current = [self.exercises objectAtIndex:0];
    } else {
        current = [self.exercises objectAtIndex:[self.exercises indexOfObject:current]];
    }
    
    return current;
}

- (void) next
{
    if (current == [self.exercises objectAtIndex:[self.exercises count] -1]) {
        current = nil;
    } else {
        current = [self.exercises objectAtIndex:[self.exercises indexOfObject:current] + 1];
    }
}

- (void) setCurrent: (Exercise *)withCurrent
{
    current = withCurrent;
}

- (void) setCurrentExerciseIsAtIndex: (int) index
{
    current = [self exerciseAtIndex:index];
}

- (int) exerciseCount
{
    return [self.exercises count];
}

- (Exercise *) exerciseAtIndex:(NSUInteger) theIndex
{
    return [self.exercises objectAtIndex:theIndex];
}

- (Item *) itemAtIndex: (NSIndexPath *)path
{
    int i = 0;
    for (int e = 0; e < [self.exercises count]; e++) {
        Exercise *exercise = [self.exercises objectAtIndex:e];
        
        int setSize = [exercise.sets count];
        
        if (path.row == i) {
            return exercise;
        }
        
        int setIndex = path.row - i - 1;
        
        if (path.row < i + setSize + 1) {
            return [exercise.sets objectAtIndex:setIndex];
        }
        
        i += setSize + 1;
    }
    return nil;
}

- (int) itemCount
{
    int i = 0;
    
    for (int e = 0; e < [self.exercises count]; e++) {
        Exercise *exercise = [self.exercises objectAtIndex:e];
        
        i += [exercise.sets count] + 1;
    }
    
    return i;
}

- (BOOL) isIndexOfCurrentExercise: (NSIndexPath *) index
{
    return [self.exercises indexOfObject:self.currentExercise] == index.row;
}

-(void) removeExerciseAtIndex:(NSUInteger)theIndex
{
    [self.exercises removeObjectAtIndex:theIndex];
}

- (void) addExercise
{
    Exercise *exercise = [[Exercise alloc] init];
    exercise.name = @"New";
    exercise.rest = @"30";
    
    [self.exercises addObject:exercise];
}

- (void) addExercise:(Exercise *)exercise
{
    [self.exercises addObject:exercise];
}

- (void) updateExerciseAtIndex:(NSUInteger)row withObject:(Exercise *)exercise
{
    [self.exercises replaceObjectAtIndex:row withObject:exercise];
}

- (void) currentExerciseIsCompleted
{
    [self next];
}

- (int) currentExercisePosition
{
    return [self.exercises indexOfObject:current];
}

@end
