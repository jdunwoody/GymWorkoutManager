//
//  ProgramDataSource.h
//  GymApp
//
//  Created by James Dunwoody on 10/09/12.
//
//

#import <Foundation/Foundation.h>
#import "ProgramLoadObserver.h"

@class Program;

@interface ProgramDataSource : NSObject
{
    NSMutableArray *observers;
}

@property (strong, nonatomic) Program *program;

- (id) initWithObservers: (id<ProgramLoadObserver>) withObservers, ...;
- (void) notifyNewProgramObservers;

@end
