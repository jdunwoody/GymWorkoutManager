//
//  ExerciseViewController.h
//  SampleMultiview
//
//  Created by James on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExerciseDataController.h"
#import "ExerciseTableDelegate.h"
#import "ExerciseTimer.h"
#import "ExercisePickerDelegate.h"
#import "ExercisePickerControllerProtocol.h"
#import "TimerAlertDelegate.h"
#import "Program.h"
#import "ProgramStatusProtocol.h"
#import "ProgramTimer.h"
#import "ProgramChangedObserver.h"

@interface OldProgramViewController : UIViewController <ExercisePickerControllerProtocol>
{
    UIPickerView *exercisePicker;
}

@property (strong, nonatomic) IBOutlet ExerciseTableDelegate *tableDelegate;
@property (strong, nonatomic) IBOutlet ExercisePickerDelegate *pickerDelegate;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIPickerView *exerciseComponentPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *categoryButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *weightOrTime;
@property (weak, nonatomic) IBOutlet UITextField *addNewExerciseType;
@property (weak, nonatomic) IBOutlet UITextField *addNewBodyPart;

@property (strong, nonatomic) UIColor *backgroundColor;
@property (weak, nonatomic) IBOutlet UIView *programControlsView;
@property (weak, nonatomic) IBOutlet UIView *programView;
@property (strong, nonatomic) Program *program;
@property (strong, nonatomic) id<ProgramChangedObserver> programChangeObserver;

- (IBAction) addNewBodyPart:(id)sender;
- (IBAction) addNewExerciseType:(id)sender;
- (IBAction) hideKeyboard:(id)sender;
- (IBAction) addExercise:(id)sender;

- (IBAction) randomiseBodyPart:(id)sender;
- (IBAction) randomiseExercise:(id)sender;
- (IBAction) randomiseIntensity:(id)sender;
- (IBAction) randomiseWeight:(id)sender;
- (IBAction) randomiseRest:(id)sender;
- (IBAction) randomiseReps:(id)sender;
- (IBAction) randomiseSets:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *closeProgramModal;
- (IBAction)closeProgramModalPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *hideControlsButton;
@property (weak, nonatomic) IBOutlet UIButton *showControlsButton;

- (void) setEditing:(BOOL)editing animated:(BOOL)animated;

@end
