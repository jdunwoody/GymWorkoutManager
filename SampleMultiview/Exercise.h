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

- (NSString *) restAsDisplayValue;
- (Set *) setAtIndex: (int) index;
- (Set *) currentSet;
- (int) count;
- (void) currentSetIsCompleted;
- (int) currentSetPosition;

@end
