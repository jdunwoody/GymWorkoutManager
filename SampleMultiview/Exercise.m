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

@synthesize name = _name;
@synthesize bodyPart = _bodyPart;
@synthesize rest = _rest;
@synthesize comment = _comment;

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

- (id)init
{
    if (self = [super init]) {
        self.name = @"None";
        self.sets = [[NSMutableArray alloc] init];
    }
    return self;
}

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

@end
