//
//  ProgramDataSource.m
//  GymApp
//
//  Created by James Dunwoody on 10/09/12.
//
//

#import "ProgramDataSource.h"
#import "ProgramLoadObserver.h"

@implementation ProgramDataSource
@synthesize program = _program;

- (id) initWithObservers: (id<ProgramLoadObserver>) firstArg, ...
{
    if (self = [super init]) {
        observers = [[NSMutableArray alloc] init];
        va_list args;
        va_start(args, firstArg);
        
        for (id<ProgramLoadObserver> arg = firstArg; arg != nil; arg = va_arg(args, id<ProgramLoadObserver>)) {
            [observers addObject:arg];
        }
        va_end(args);
    }
    return self;
}

- (void) notifyNewProgramObservers
{
    for (id<ProgramLoadObserver> observer in observers) {
        [observer programLoaded];
    }
}

@end
