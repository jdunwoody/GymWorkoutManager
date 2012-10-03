//
//  LoadProgramTableDataSource.m
//  GymApp
//
//  Created by James Dunwoody on 5/09/12.
//
//

#import "LoadProgramTableDataSource.h"
#import "Program.h"

@implementation LoadProgramTableDataSource
@synthesize programs = _programs;

- (id) init
{
    self = [super init];
    if (self) {
        self.programs = [[NSMutableArray alloc] initWithObjects:
                         [[Program alloc] initWithDefaultAndName: @"New"],
                         [self makeExampleProgramWithName:@"Last weeks"],
                         [self makeExampleProgramWithName:@"High intensity"],
                         [self makeExampleProgramWithName:@"Low intensity"],
                         [self makeExampleProgramWithName:@"1/1/2012"],
                         [self makeExampleProgramWithName:@"2/1/2012"],
                         //                         [self makeExampleProgramWithName:@"Monday morning program"],
                         //                         [self makeExampleProgramWithName:@"Low intensity"],
                         //                         [self makeExampleProgramWithName:@"Recovery"],
                         //                         [self makeExampleProgramWithName:@"High intensity aerobic"],
                         //                         [self makeExampleProgramWithName:@"Very difficult"],
                         //                         [self makeExampleProgramWithName:@"Friday program"],
                         nil];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.programs count];
}

- (int) numberOfPrograms
{
    return [self.programs count];
}

- (Program *) programAtIndex: (int) index
{
    return [self.programs objectAtIndex:index];
}

- (Program *) makeExampleProgramWithName: (NSString *) name
{
    Program *program = [[Program alloc] initWithName: name];
    
    int numExercises = 5;
    NSArray *exerciseNames = Exercise.nameValues;
    
    for (int e=0; e< numExercises; e++) {
        Exercise *exercise = [[Exercise alloc] init];
        exercise.name = [exerciseNames objectAtIndex: (arc4random() % [exerciseNames count])];
        exercise.rest = [NSString stringWithFormat:@"%is", e * 20];
        
        int numSets = DEFAULT_NUM_SETS;
        
        for (int s = 0; s < numSets; s++) {
            [exercise.sets addObject:[[Set alloc] init]];
        }
        [program addExercise:exercise];
    }
    exerciseNames = nil;
    return program;
}

- (NSString *) currentDateString
{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Australia/Melbourne"]];
    return [formatter stringFromDate:now];
}

@end
