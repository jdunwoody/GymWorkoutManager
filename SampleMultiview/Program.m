//
//  Program.m
//  GymApp
//
//  Created by James Dunwoody on 3/08/12.
//
//

#import "Program.h"
#import "Exercise.h"

@implementation Program
@synthesize exercises;

- (id) init
{
    if (self = [super init]) {
        exercises = [[NSMutableArray alloc] init];
        current = nil;
    }
    return self;
}

- (Exercise *)currentExercise
{
    if (current == nil) {
        current = [exercises objectAtIndex:0];
    }
    
    return current;
}

-(void) makeSuperSetForRow: (NSInteger)row
{
    Exercise *exercise = [self.exercises objectAtIndex:row];
    exercise.superSet = true;
}

@end
