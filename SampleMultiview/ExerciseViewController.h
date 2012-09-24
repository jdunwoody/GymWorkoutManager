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

@class WeightExercise;
@class Exercise;

@interface ExerciseViewController : UIViewController<ProgramChangeObserver>

@property (strong, nonatomic) IBOutlet UIView *setContainer;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) ProgramDataSource *programDatasource;
@property (strong, nonatomic) ProgramDelegate *programDelegate;
@property (strong, nonatomic) Exercise *exercise;

@property (weak, nonatomic) IBOutlet UIPickerView *weightPicker;

- (IBAction)addSet:(id)sender;
- (IBAction)addExercise:(id)sender;

@end
