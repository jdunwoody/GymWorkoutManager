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

@class WeightExercise;
@class Exercise;
@class EditRepViewController;

@interface ExerciseViewController : UIViewController<ProgramChangeObserver, PopoverPresentable, UIGestureRecognizerDelegate, UITextFieldDelegate>
{
    UIPopoverController *editRepPopoverViewController;
    EditRepViewController *editRepViewController;
}

@property (strong, nonatomic) IBOutlet UIView *setContainer;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *programName;

@property (strong, nonatomic) ProgramDataSource *programDatasource;
@property (strong, nonatomic) ProgramDelegate *programDelegate;
@property (strong, nonatomic) Exercise *exercise;

//@property (weak, nonatomic) IBOutlet UIPickerView *weightPicker;

- (IBAction)addSet:(id)sender;
- (IBAction)addExercise:(id)sender;




//@property (weak, nonatomic) IBOutlet UILabel *rest;
//@property (weak, nonatomic) IBOutlet UILabel *reps;
//@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *repTapGesture;

@end
