//
//  CurrentViewController.h
//  GymApp
//
//  Created by James Dunwoody on 7/08/12.
//
//

#import <UIKit/UIKit.h>
#import "ExerciseTimer.h"
#import "ProgramTimer.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "ProgramTimer.h"
#import "Program.h"
#import "LoadProgramObserver.h"
#import "ProgramChangedObserver.h"

@interface CurrentViewController : UIViewController<TimerAlertDelegate, ProgramTimerObserver, ProgramStatusProtocol, LoadProgramObserver, ProgramChangedObserver, UITableViewDataSource, UITableViewDelegate>
{
    ExerciseTimer *timer;
    ProgramTimer *programTimer;
    SystemSoundID systemSoundID;
}

@property (strong, nonatomic) Program *program;

@property (strong, nonatomic) UIColor *timerAlertColour;
@property (strong, nonatomic) UIColor *timerWarningColour;
@property (strong, nonatomic) UIColor *backgroundColor;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *currentView;
//@property (weak, nonatomic) IBOutlet UIView *timeView;
@property (weak, nonatomic) IBOutlet UIView *repsView;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeInTimer;
@property (weak, nonatomic) IBOutlet UILabel *currentExerciseInTimer;
@property (weak, nonatomic) IBOutlet UILabel *currentWeightInTimer;
@property (weak, nonatomic) IBOutlet UILabel *currentRepsInTimer;
@property (weak, nonatomic) IBOutlet UILabel *programTime;

@property (weak, nonatomic) IBOutlet UIButton *timerStartButton;
@property (weak, nonatomic) IBOutlet UIButton *timerStopButton;
@property (weak, nonatomic) IBOutlet UIButton *timerPauseButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UILabel *nextExerciseLabel;

- (IBAction)startButtonPressed:(id)sender;
- (IBAction)pauseButtonPressed:(id)sender;
- (IBAction)stopButtonPressed:(id)sender;
- (IBAction)nextButtonPressed:(id)sender;

- (IBAction)setCompletedPressed:(id)sender;
- (void) programNonEmpty;
- (void) timerAlert;
- (void) timerWarning;

- (void) programLoadedWithProgram: (Program *)withProgram;
- (void) programChanged;

@end
