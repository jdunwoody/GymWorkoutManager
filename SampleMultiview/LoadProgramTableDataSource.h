//
//  LoadProgramTableDataSource.h
//  GymApp
//
//  Created by James Dunwoody on 5/09/12.
//
//

#import <Foundation/Foundation.h>
#import "LoadProgramTableDataSource.h"
#import "Program.h"

@class ProgramDataSource;

@interface LoadProgramTableDataSource : NSObject <UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *programs;
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) ProgramDataSource *programDataSource;

- (id) initWithManagedObjectContext: (NSManagedObjectContext *) context withProgramDataSource: (ProgramDataSource *) programDataSource;
- (int) numberOfPrograms;
- (Program *) programAtIndex: (int) index;
- (void) addNewProgram;

@end
