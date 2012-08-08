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

@interface CurrentViewController : UIViewController<TimerAlertDelegate, ProgramTimerObserver, ProgramStatusProtocol>
{
    ExerciseTimer *timer;
    ProgramTimer *programTimer;
    SystemSoundID systemSoundID;
}

@property (strong, nonatomic) Program *program;

@property (strong, nonatomic) UIColor *timerAlertColour;
@property (strong, nonatomic) UIColor *timerWarningColour;
@property (strong, nonatomic) UIColor *backgroundColor;

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

- (IBAction)startButtonPressed:(id)sender;
- (IBAction)pauseTimerPressed:(id)sender;
- (IBAction)stopTimerPressed:(id)sender;

- (void) timerAlert;
- (void) timerWarning;

@end
