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

@interface Exercise : Item
{
    Set *_currentSet;
}

@property NSString *name;
@property NSString *bodyPart;
@property NSString *rest;
@property NSMutableArray *sets;
@property NSString *comment;

- (NSString *) restAsDisplayValue;
- (Set *) setAtIndex: (int) index;
- (Set *) currentSet;
- (int) setCount;
- (void) currentSetIsCompleted;
- (int) currentSetPosition;
- (void) addSet: (Set *)set;

@end
