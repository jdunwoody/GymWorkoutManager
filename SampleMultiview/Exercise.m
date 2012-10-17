//
//  Exercise.m
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

const int DEFAULT_REST = 10;
const int DEFAULT_REPS = 12;
const int DEFAULT_WEIGHT = 40;
const NSString *DEFAULT_EXERCISE = @"Fly";

@dynamic name;
@dynamic bodyPart;
@dynamic rest;
@dynamic comment;
@dynamic sets;
@dynamic program;

+ (NSArray *) nameValues
{
    NSMutableArray *values = [NSMutableArray arrayWithObjects: @"O/H", @"Fly", @"Press up", @"Sit up", @"Burpee", @"Star jump", @"Bicup curls", @"Squats", @"Other", nil];
    [values sortUsingSelector:@selector(compare:)];
    return values;
}

+ (NSArray *) restValues
{
    NSMutableArray *restValues = [[NSMutableArray alloc] init];
    
    for (int s = 0; s < 3; s++) {
        [restValues addObject: [NSNumber numberWithInt: 10 * (s+1)]];
    }
    return restValues;
}

+ (Exercise *) exerciseWithName:(NSString *)name withContext: (NSManagedObjectContext *)context
{
    Exercise *newExercise = [NSEntityDescription
                             insertNewObjectForEntityForName:@"Exercise"
                             inManagedObjectContext:context];
    newExercise.name = @"None";
    newExercise.sets = [NSMutableArray array];
    return newExercise;
}

//- (id)init
//{
//    if (self = [super init]) {
//        self.name = @"None";
//        self.sets = [[NSMutableArray alloc] init];
//    }
//    return self;
//}

- (NSString *) restAsDisplayValue
{
    return [NSString stringWithFormat:@"%@ min", [self rest]];
}

- (Set *) setAtIndex:(int) index
{
    return [self.sets objectAtIndex:index];
}

- (Set *) currentSet
{
    if (_currentSet == nil) {
        if ([self.sets count] == 0) {
            return nil;
        }
        _currentSet = [self.sets objectAtIndex:0];
    }
    
    return _currentSet;
}

- (int) setCount
{
    return [self.sets count];
}

- (void) currentSetIsCompleted
{
    int currentIndex = [self currentSetPosition];
    
    if (currentIndex + 1 < [self.sets count]) {
        _currentSet = [self.sets objectAtIndex:(currentIndex + 1)];
    } else {
        _currentSet = nil;
    }
}

- (int) currentSetPosition
{
    return [self.sets indexOfObject:_currentSet];
}

- (void) addSet: (Set *)set
{
    [self.sets addObject:set];
}

- (void) addSet
{
    Set *set = [Set setWithContext: self.managedObjectContext];
    
    if ([self.sets count] > 0) {
        Set *lastSet = [self.sets lastObject];
        
        set.reps = lastSet.reps;
        set.rest = lastSet.rest;
        set.weight = lastSet.weight;
    }
    
    set.exercise = self;
}

@end
