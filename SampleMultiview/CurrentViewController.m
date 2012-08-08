//
//  CurrentViewController.m
//  GymApp
//
//  Created by James Dunwoody on 7/08/12.
//
//

#import "CurrentViewController.h"

@implementation CurrentViewController
@synthesize currentView;
@synthesize programTime;
@synthesize timerStopButton;
@synthesize timerPauseButton;
@synthesize nextButton;
@synthesize nextExerciseLabel;
@synthesize repsView;
@synthesize timerStartButton;
@synthesize currentExerciseInTimer, currentWeightInTimer, currentRepsInTimer, currentTimeInTimer;
@synthesize backgroundColor, timerAlertColour, timerWarningColour, program;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.program = [[Program alloc] initWithProgramStatus:self];
    
    Exercise *exercise;
    
    exercise = [[Exercise alloc] init];
    exercise.category = @"Super set";
    exercise.name = @"Dumbell Flys";
    exercise.rest = nil;
    exercise.reps = [NSNumber numberWithInt:12];
    exercise.weight = [NSNumber numberWithInt:24];
    exercise.exerciseWeightOrTimeMode = ExerciseWeightMode;
    [self.program addExercise:exercise];
    
    exercise = [[Exercise alloc] init];
    exercise.category = @"Set";
    exercise.name = @"Bicep Curls";
    exercise.rest = @"1min";
    exercise.reps = [NSNumber numberWithInt:18];
    exercise.weight = [NSNumber numberWithInt:40];
    exercise.exerciseWeightOrTimeMode = ExerciseWeightMode;
    [self.program addExercise:exercise];
    
    
    //    self.repsView.hidden = false;
    
    self.timerAlertColour = [UIColor redColor];
    self.timerWarningColour = [UIColor orangeColor];
    
    self.title = @"Current View";
    self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"carbon_fibre.png"]];
    self.view.backgroundColor = self.backgroundColor;
    
    programTimer = [[ProgramTimer alloc] initWithElapsedTimeObserver:(id<ProgramTimerObserver>)self];
    
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"sound.aif" withExtension:nil];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) fileURL, &systemSoundID);
    
    [self updateCurrentExerciseView];
}

- (void)viewDidUnload
{
    [self setRepsView:nil];
    [self setCurrentTimeInTimer:nil];
    [self setCurrentExerciseInTimer:nil];
    [self setCurrentWeightInTimer:nil];
    [self setCurrentRepsInTimer:nil];
    [self setTimerStartButton:nil];
    [self setTimerStopButton:nil];
    [self setTimerPauseButton:nil];
    [self setProgramTime:nil];
    [self setCurrentView:nil];
    
    [self setNextButton:nil];
    [self setNextExerciseLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
}

- (void) playSound
{
    AudioServicesPlaySystemSound(systemSoundID);
}

- (void) updateCurrentExerciseView
{
    Exercise *currentExercise = self.program.currentExercise;
    
    if (currentExercise.exerciseWeightOrTimeMode == ExerciseWeightMode) {
        self.repsView.hidden = false;
        //        self.timeView.hidden = false;
        
        self.currentWeightInTimer.text = [NSString stringWithFormat:@"%@ kg", self.program.currentExercise.weight.stringValue];
        self.currentRepsInTimer.text = [NSString stringWithFormat:@"%@ reps", self.program.currentExercise.reps.stringValue];
        
        Exercise *nextExercise = self.program.nextExercise;
        if (nextExercise != nil) {
            self.nextExerciseLabel.text = [NSString stringWithFormat:@"Coming up... %@ %@kg %@ reps", nextExercise.name, nextExercise.weight, nextExercise.reps];
        } else {
            self.nextExerciseLabel.text = @"nothing next";
        }
        //        self.currentWeightInTimer.hidden = false;
        //        self.currentRepsInTimer.hidden = false;
        //
    } else {
        //        self.repsView.hidden = false;
        //        self.timeView.hidden = true;
        
        //        self.currentWeightInTimer.hidden = false;
        //        self.currentRepsInTimer.hidden = false;
    }
    
    
    self.currentExerciseInTimer.text = self.program.currentExercise.name;
    
    currentExercise = nil;
}

- (IBAction)startButtonPressed:(id)sender
{
    if (self.program.currentExercise != nil) {
        //        [timer start];
        [programTimer start];
        
        self.timerPauseButton.enabled = true;
        self.timerStopButton.enabled = true;
        self.timerStartButton.enabled = false;
        
        [self updateCurrentExerciseView];
    }
}

- (IBAction)pauseButtonPressed:(id)sender
{
    //    [timer pause];
    [programTimer pause];
    
    self.timerStartButton.enabled = false;
    self.timerStopButton.enabled = true;
    self.timerPauseButton.enabled = true;
}

- (IBAction)stopButtonPressed:(id)sender
{
    //    [timer stop];
    [programTimer stop];
    
    self.timerStartButton.enabled = true;
    self.timerStopButton.enabled = false;
    self.timerPauseButton.enabled = false;
}

- (IBAction)nextButtonPressed:(id)sender {
    [self.program next];
    [self updateCurrentExerciseView];
}

- (void) timerAlert
{
    [self playSound];
    self.currentTimeInTimer.textColor = self.timerAlertColour;
}

- (void) timerWarning
{
    self.currentTimeInTimer.textColor = self.timerWarningColour;
}

- (void) updateLabelWithText:(NSString *)text
{
    self.currentTimeInTimer.text = text;
}

- (void) programTimerUpdate: (NSString *)text
{
    self.programTime.text = text;
}

- (void) programNonEmpty
{
    [self updateCurrentExerciseView];
    self.timerStartButton.enabled= true;
}

@end
