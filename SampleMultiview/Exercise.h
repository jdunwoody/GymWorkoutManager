//
//  Exercise.h
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseWeightOrTimeMode.h"
#import "Set.h"
#import "Item.h"

@class Program;

@interface Exercise : NSManagedObject
{
    Set *_currentSet;
}
extern const int DEFAULT_REST;
extern const int DEFAULT_REPS;
extern const int DEFAULT_WEIGHT;
extern const NSString *DEFAULT_EXERCISE;

@property (retain, nonatomic) Program *program;
@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSString *bodyPart;
@property (retain, nonatomic) NSString *rest;
@property (retain, nonatomic) NSOrderedSet *sets;
@property (retain, nonatomic) NSString *comment;

+ (Exercise *) exerciseWithName:(NSString *)name withContext: (NSManagedObjectContext *)context;

- (NSString *) restAsDisplayValue;
- (Set *) setAtIndex: (int) index;
- (Set *) currentSet;
- (int) setCount;
- (void) currentSetIsCompleted;
- (int) currentSetPosition;

- (void) addSet: (Set *)set;
- (void) addSet;

+ (NSArray *) nameValues;
+ (NSArray *) restValues;
@end
