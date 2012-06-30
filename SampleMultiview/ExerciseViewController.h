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

typedef enum  {
    WEIGHT = 6,
    INTENSITY = 5,
    REST = 4,
    SETS = 3,
    BODYPART = 2,
    REPS = 1,
    NAME = 0
} ExercisePickerComponents;

@interface ExerciseViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIPickerView *exercisePicker;
    
    NSArray *nameValues;
    NSMutableArray *repValues;
    NSMutableArray *setValues;
    NSMutableArray *weightValues;
    NSArray *bodyPartValues;
    NSArray *intensityValues;
    NSMutableArray *restValues;
    ExerciseTimer *timer;
}

@property (strong, nonatomic) IBOutlet ExerciseTableDelegate *tableDelegate;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIPickerView *exerciseComponentPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *categoryButton;
@property (weak, nonatomic) IBOutlet UILabel *elapsedTimeLabel;

- (IBAction)randomiseExercise:(id)sender;
- (IBAction)startTimerPressed:(id)sender;
- (IBAction)pauseTimerPressed:(id)sender;
- (IBAction)stopTimerPressed:(id)sender;

- (IBAction)addExercise:(id)sender;

//@property (weak, nonatomic) IBOutlet UIButton *addExerciseButton;

@end
