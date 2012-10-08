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

@interface ExerciseViewController : UIViewController<ProgramChangeObserver, UIGestureRecognizerDelegate, UITextFieldDelegate, PopoverPresentable>
{
    UIPopoverController *popoverViewController;
    
    UIPopoverController *editRepPopoverViewController;
    id<EditExerciseComponentController> editRepViewController;

    UIPopoverController *editWeightPopoverViewController;
    id<EditExerciseComponentController> editWeightViewController;

    UIPopoverController *editRestPopoverViewController;
    id<EditExerciseComponentController> editRestViewController;
}

@property (strong, nonatomic) IBOutlet UIScrollView *repScrollView;
@property (weak, nonatomic) IBOutlet UIView *repContainer;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *programName;

@property (strong, nonatomic) ProgramDataSource *programDatasource;
@property (strong, nonatomic) ProgramDelegate *programDelegate;
@property (strong, nonatomic) Exercise *exercise;

//@property (weak, nonatomic) IBOutlet UIPickerView *weightPicker;

- (IBAction)addSet:(id)sender;
- (IBAction)addExercise:(id)sender;
- (IBAction)loadProgram:(id)sender;

//@property (weak, nonatomic) IBOutlet UILabel *rest;
//@property (weak, nonatomic) IBOutlet UILabel *reps;
//@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *repTapGesture;

@end
