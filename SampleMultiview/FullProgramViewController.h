//
//  FullProgramViewController.h
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import <UIKit/UIKit.h>
#import "ProgramDelegate.h"
#import "ProgramDataSource.h"
#import "ProgramChangedObserver.h"
#import "ProgramDetailNotifiable.h"

@interface FullProgramViewController : UIViewController<ProgramChangeObserver, ProgramDetailNotifiable>

@property (strong, nonatomic) ProgramDelegate *programDelegate;
@property (strong, nonatomic) ProgramDataSource *programDatasource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)addExercise:(id)sender;
- (IBAction)addSet:(id)sender;

@end
