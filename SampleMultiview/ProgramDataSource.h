//
//  ProgramDataSource.h
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import <Foundation/Foundation.h>
#import "Program.h"
#import "ProgramChangedObserver.h"

@interface ProgramDataSource : NSObject<UITableViewDataSource>
{
    NSMutableArray *observers;
}

@property (strong, nonatomic) Program *program;

- (id) initWithObservers: (id<ProgramChangeObserver>) withObservers, ...;
- (void) notifyNewProgramObservers;

@end