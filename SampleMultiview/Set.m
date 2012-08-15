//
//  Rep.m
//  GymApp
//
//  Created by James Dunwoody on 15/08/12.
//
//

#import "Set.h"

@implementation Set
@synthesize weight = _weight;
@synthesize reps = _reps;
@synthesize rest = _rest;

- (id) initWithReps: (NSNumber *) withReps
{
    if (self = [super init])
    {
        self.reps = withReps;
    }
    return self;
}

- (NSString *) weightAsDisplayValue
{
    return [NSString stringWithFormat:@"%@ kg", [self.weight stringValue]];
}

@end
