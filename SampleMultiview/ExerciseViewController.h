//
//  ExerciseViewController.h
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import <UIKit/UIKit.h>
#import "ProgramDataSource.h"
#import "ProgramDelegate.h"
#import "PopoverPresentable.h"
#import "EditExerciseComponentController.h"

@class WeightExercise;
@class Exercise;
@class EditRepViewController;
@class EditWeightUIPickerViewController;
@class EditRestUIPickerViewController;
@class EditRepUIPickerViewController;
@class ExerciseDetailViewController;

@interface ExerciseViewController : UIViewController<ProgramChangeObserver, UIGestureRecognizerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *programName;
@property (weak, nonatomic) IBOutlet UIView *currentExerciseContainer;
@property (weak, nonatomic) IBOutlet UIView *mainPanel;

@property (strong, nonatomic) ProgramDataSource *programDatasource;
@property (strong, nonatomic) ProgramDelegate *programDelegate;
@property (strong, nonatomic) Exercise *exercise;
@property (strong, nonatomic) ExerciseDetailViewController *currentExerciseDetailViewController;
@property (strong, nonatomic) NSManagedObjectContext *context;

- (IBAction)addExercise:(id)sender;
- (IBAction)loadProgram:(id)sender;
- (IBAction)nextExercise:(id)sender;
- (IBAction)previousExercise:(id)sender;

@end