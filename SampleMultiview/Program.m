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

@dynamic name;
@dynamic exercises;

+ (Program *) programWithName:(NSString *)name withContext: (NSManagedObjectContext *)context
{
    Program *newProgram = [NSEntityDescription
                           insertNewObjectForEntityForName:@"Program"
                           inManagedObjectContext:context];
    newProgram.name = name;
    //    [newProgram addExercise];
    return newProgram;
}

//- (id) initWithName: (NSString *) name
//{
//    if (self = [super init]) {
//        self.exercises = [[NSMutableArray alloc] init];
//        self.name = name;
//        current = nil;
//    }
//    return self;
//}
//
//- (id) initWithDefaultAndName:(NSString *)name
//{
//    self = [self initWithName:name];
//
//    Exercise *exercise = [[Exercise alloc] init];
//    exercise.name = [Exercise.nameValues objectAtIndex:0];
//
//    [exercise.sets addObject:[[Set alloc] init]];
//
//    [self.exercises addObject:exercise];
//    return self;
//}

- (void) save
{
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
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

- (void) setCurrentExerciseToLast
{
    //    if ([self exerciseCount] > 0) {
    //        [self setCurrentExerciseIsAtIndex: [self.exercises count] -1];
    //    }
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
    
//    [self.exercises removeObjectAtIndex:theIndex];
}

- (void) addExercise
{
    Exercise *last = (Exercise *) self.exercises.lastObject;
    
    Exercise *exercise = [NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:[self managedObjectContext]];
    //    Exercise *exercise = [[Exercise alloc] init];
    
    if (last) {
        exercise.name = last.name;
    } else {
        exercise.name = @"Fly";
    }
    
    int numSets = last ? [last.sets count] : DEFAULT_NUM_SETS;
    
    for (int i=0; i<numSets; i++) {
        Set *set = [NSEntityDescription insertNewObjectForEntityForName:@"Set" inManagedObjectContext:[self managedObjectContext]];
        //        Set *set = [[Set alloc] init];
        
        if (last) {
            Set *lastSet = [last.sets objectAtIndex: i];
            set.reps = lastSet.reps;
            set.rest = lastSet.rest;
            set.weight = lastSet.weight;
        }
        set.exercise = exercise;
        //        [exercise addSet:set];
    }
    
    int sizeBefore = [self.exercises count];
    exercise.program = self;
    int sizeAfter = [[self exercises] count];
    //    [self.exercises addObject:exercise];
    [self save];
}

- (void) addExercise:(Exercise *)exercise
{
    exercise.program = self;
//    [self.exercises addObject:exercise];
}

- (void) updateExerciseAtIndex:(NSUInteger)row withObject:(Exercise *)exercise
{
//    [self.exercises replaceObjectAtIndex:row withObject:exercise];
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
