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

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ExerciseViewController : UIViewController <ExercisePickerControllerProtocol, TimerAlertDelegate, ProgramStatusProtocol>
{
    UIPickerView *exercisePicker;
    ExerciseTimer *timer;
    SystemSoundID systemSoundID;
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
@property (strong, nonatomic) UIColor *timerAlertColour;
@property (strong, nonatomic) UIColor *timerWarningColour;

- (IBAction)addNewBodyPart:(id)sender;
- (IBAction)addNewExerciseType:(id)sender;
- (IBAction)hideKeyboard:(id)sender;
- (IBAction)startTimerPressed:(id)sender;
- (IBAction)pauseTimerPressed:(id)sender;
- (IBAction)stopTimerPressed:(id)sender;
- (IBAction)addExercise:(id)sender;

- (IBAction) randomiseBodyPart:(id)sender;
- (IBAction) randomiseExercise:(id)sender;
- (IBAction) randomiseIntensity:(id)sender;
- (IBAction) randomiseWeight:(id)sender;
- (IBAction) randomiseRest:(id)sender;
- (IBAction) randomiseReps:(id)sender;
- (IBAction) randomiseSets:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *timeView;
@property (weak, nonatomic) IBOutlet UIView *repsView;

@property (weak, nonatomic) IBOutlet UIButton *timerStartButton;
@property (weak, nonatomic) IBOutlet UIButton *timerStopButton;
@property (weak, nonatomic) IBOutlet UIButton *timerPauseButton;

@property (weak, nonatomic) IBOutlet UILabel *currentTimeInTimer;
@property (weak, nonatomic) IBOutlet UILabel *currentExerciseInTimer;
@property (weak, nonatomic) IBOutlet UILabel *currentIntensityInTimer;
@property (weak, nonatomic) IBOutlet UILabel *currentBodyPartInTimer;
@property (weak, nonatomic) IBOutlet UILabel *currentWeightInTimer;
@property (weak, nonatomic) IBOutlet UILabel *currentRepsInTimer;

- (void)setEditing:(BOOL)editing animated:(BOOL)animated;
- (void) timerAlert;
- (void) timerWarning;

@end


//@property (nonatomic, retain) IBOutlet AVAudioPlayer *player;
//- (IBAction) playSound: (id) sender;

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
