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
@synthesize context = _context;

- (id) initWithManagedObjectContext: (NSManagedObjectContext *) context
{
    self = [super init];
    if (self) {
        self.context = context;
        
        NSArray *programs = [self loadPrograms];
        
        Program *newProgram = [Program programWithName:[self currentDateString] withContext:context];
        newProgram.name = [self currentDateString];
        
        self.programs = [[NSMutableArray alloc] initWithObjects:
                         newProgram,
                         nil];
        [self.programs addObjectsFromArray: programs];
        
        for (Program *program in self.programs) {
            NSLog(@"Loaded program %@", program.name);
        }
        NSError *error;
        if (self.context != nil) {
            if ([self.context hasChanges] && ![self.context save:&error]) {
                NSLog(@"Failed to log");
                // Handle the error.
            }
        }
        
        //        [self.context save:nil];
        //                         [self makeExampleProgramWithName:@"Last weeks"],
        //                         [self makeExampleProgramWithName:@"High intensity"],
        //                         [self makeExampleProgramWithName:@"Low intensity"],
        //                         [self makeExampleProgramWithName:@"1/1/2012"],
        //                         [self makeExampleProgramWithName:@"2/1/2012"],
        //                         //                         [self makeExampleProgramWithName:@"Monday morning program"],
        //                         //                         [self makeExampleProgramWithName:@"Low intensity"],
        //                         //                         [self makeExampleProgramWithName:@"Recovery"],
        //                         //                         [self makeExampleProgramWithName:@"High intensity aerobic"],
        //                         //                         [self makeExampleProgramWithName:@"Very difficult"],
        //                         //                         [self makeExampleProgramWithName:@"Friday program"],
        //                         nil];
    }
    return self;
}

- (NSArray *) loadPrograms
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Program" inManagedObjectContext: self.context];
	[request setEntity:entity];
	
    //	// Order the events by creation date, most recent first.
    //	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:NO];
    //	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    //	[request setSortDescriptors:sortDescriptors];
    //	[sortDescriptor release];
    //	[sortDescriptors release];
    //
	// Execute the fetch -- create a mutable copy of the result.
	NSError *error = nil;
	NSMutableArray *mutableFetchResults = [[self.context executeFetchRequest:request error:&error] mutableCopy];
	if (mutableFetchResults == nil) {
		// Handle the error.
	}
    return mutableFetchResults;
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

//- (Program *) makeExampleProgramWithName: (NSString *) name
//{
//    Program *program = [[Program alloc] initWithName: name];
//
//    int numExercises = 5;
//    NSArray *exerciseNames = Exercise.nameValues;
//
//    for (int e=0; e< numExercises; e++) {
//        Exercise *exercise = [[Exercise alloc] init];
//        exercise.name = [exerciseNames objectAtIndex: (arc4random() % [exerciseNames count])];
//        exercise.rest = [NSString stringWithFormat:@"%is", e * 20];
//
//        int numSets = DEFAULT_NUM_SETS;
//
//        for (int s = 0; s < numSets; s++) {
//            [exercise.sets addObject:[[Set alloc] init]];
//        }
//        [program addExercise:exercise];
//    }
//    exerciseNames = nil;
//    return program;
//}

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
