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

@interface ExerciseViewController : UIViewController <ExercisePickerControllerProtocol, TimerAlertDelegate>
{
    UIPickerView *exercisePicker;
    
    ExerciseTimer *timer;
}

@property (strong, nonatomic) IBOutlet ExerciseTableDelegate *tableDelegate;
@property (strong, nonatomic) IBOutlet ExercisePickerDelegate *pickerDelegate;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIPickerView *exerciseComponentPicker;
@property (weak, nonatomic) IBOutlet UILabel *elapsedTimeLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *categoryButton;
- (IBAction)addNewBodyPart:(id)sender;
- (IBAction)addNewExerciseType:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *addNewExerciseType;
@property (weak, nonatomic) IBOutlet UITextField *addNewBodyPart;
@property (strong, nonatomic) UIColor *backgroundColor;
@property (strong, nonatomic) UIColor *timerAlertColour;
@property (strong, nonatomic) UIColor *timerWarningColour;

- (IBAction)hideKeyboard:(id)sender;
- (IBAction)startTimerPressed:(id)sender;
- (IBAction)pauseTimerPressed:(id)sender;
- (IBAction)stopTimerPressed:(id)sender;
- (IBAction)addExercise:(id)sender;
- (void)setEditing:(BOOL)editing animated:(BOOL)animated;
- (IBAction) randomiseBodyPart:(id)sender;
- (IBAction) randomiseExercise:(id)sender;

-(void) timerAlert;
-(void) timerWarning;

@end

//    NSArray *nameValues;
//    NSMutableArray *repValues;
//    NSMutableArray *setValues;
//    NSMutableArray *weightValues;
//    NSArray *bodyPartValues;
//    NSArray *intensityValues;
//    NSMutableArray *restValues;
//- (IBAction)randomiseBodyPart:(id)sender;
//- (IBAction)randomiseExercise:(id)sender;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *categoryButton;
//@property (weak, nonatomic) IBOutlet UIButton *addExerciseButton;
