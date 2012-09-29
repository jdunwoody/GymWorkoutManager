//
//  Rep.m
//  GymApp
//
//  Created by James Dunwoody on 15/08/12.
//
//

#import "Set.h"
#import "Exercise.h"

@implementation Set

const int DEFAULT_NUM_SETS = 3;

@synthesize weight = _weight;
@synthesize reps = _reps;
@synthesize rest = _rest;

- (id) init
{
    if (self = [super init])
    {
        self.weight = [NSNumber numberWithInt:DEFAULT_WEIGHT];
        self.reps =   [NSNumber numberWithInt:DEFAULT_REPS];
        self.rest =   [NSNumber numberWithInt:DEFAULT_REST];
   }
    return self;
}

- (NSString *) weightAsDisplayValue
{
    return [NSString stringWithFormat:@"%@ kg", [self.weight stringValue]];
}

@end
