//
//  LoadProgramViewController.h
//  GymApp
//
//  Created by James Dunwoody on 10/08/12.
//
//

#import <UIKit/UIKit.h>
//#import "LoadProgramTableDelegate.h"
//#import "LoadProgramTableDataSource.h"
#import "Program.h"
#import "LoadProgramInternalObserver.h"
#import "ProgramChangedObserver.h"
#import "ProgramDataSource.h"

@class LoadProgramTableDelegate;
@class LoadProgramTableDataSource;

@interface LoadProgramViewController : UIViewController <LoadProgramInternalObserver>

//- (IBAction)newProgramChosen:(id)sender;
- (void) programLoadedWithProgram:(Program *) withProgram;

//@property (strong, nonatomic) CurrentViewController *delegate;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id<ProgramChangeObserver> observer;

@property (strong, nonatomic) LoadProgramTableDelegate *tableDelegate;
@property (strong, nonatomic) LoadProgramTableDataSource *tableDataSource;

@property (strong, nonatomic) ProgramDataSource *programDataSource;
@property (strong, nonatomic) NSManagedObjectContext *context;
@end
