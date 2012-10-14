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
#import "Item.h"

@interface Program : NSManagedObject
{
    Exercise *current;
//    NSMutableArray *exercises;
//    id<ProgramStatusProtocol> programStatus;
}

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray * exercises;

//- (id) initWithName: (NSString *) name;
//- (id) initWithDefaultAndName: (NSString *) name;

- (BOOL) empty;
- (int) exerciseCount;

- (Exercise *) exerciseAtIndex:(NSUInteger)theIndex;
- (Item *) itemAtIndex: (NSIndexPath *)path;

- (int) itemCount;
- (BOOL) isIndexOfCurrentExercise: (NSIndexPath *)path;

- (void) next;
- (void) addExercise;
- (void) addExercise:(Exercise *)exercise;
- (void) removeExerciseAtIndex:(NSUInteger)theIndex;
- (void) updateExerciseAtIndex:(NSUInteger)row withObject:(Exercise *)exercise;

- (Exercise *) currentExercise;
- (int) currentExercisePosition;
- (void) currentExerciseIsCompleted;
- (void) setCurrent: (Exercise *)current;

- (void) setCurrentExerciseIsAtIndex: (int) index;
- (void) setCurrentExerciseToLast;

@end
