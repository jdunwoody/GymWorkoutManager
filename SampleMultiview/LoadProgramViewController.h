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
#import "LoadProgramObserver.h"

@class LoadProgramTableDelegate;
@class LoadProgramTableDataSource;

@interface LoadProgramViewController : UIViewController <LoadProgramObserver>

//- (IBAction)newProgramChosen:(id)sender;
- (void) programLoadedWithProgram:(Program *) withProgram;

//@property (strong, nonatomic) CurrentViewController *delegate;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id<LoadProgramObserver> observer;

@property (strong, nonatomic) LoadProgramTableDelegate *tableDelegate;
@property (strong, nonatomic) LoadProgramTableDataSource *tableDataSource;

@end
