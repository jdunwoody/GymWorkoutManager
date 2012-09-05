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

@interface LoadProgramTableDataSource : NSObject <UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *programs;

- (int) numberOfPrograms;
- (Program *) programAtIndex: (int) index;

@end
