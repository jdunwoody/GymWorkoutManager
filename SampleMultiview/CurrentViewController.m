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
@synthesize repsView;
@synthesize timerStartButton;
@synthesize currentExerciseInTimer, currentWeightInTimer, currentRepsInTimer, currentTimeInTimer;
@synthesize backgroundColor, timerAlertColour, timerWarningColour, program;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.program = [[Program alloc] initWithProgramStatus:self];
    Exercise *exercise = [[Exercise alloc] init];
    exercise.category = @"Super set";
    exercise.name = @"Push up";
    exercise.rest = nil;
    exercise.reps = [NSNumber numberWithInt:10];
    exercise.weight = [NSNumber numberWithInt:20];
    exercise.exerciseWeightOrTimeMode = ExerciseWeightMode;
    //    exercise.intensity = ExerciseIntensityAnaerobicIntense;
    
    [self.program addExercise:exercise];
//    self.repsView.hidden = false;
    
    self.timerAlertColour = [UIColor redColor];
    self.timerWarningColour = [UIColor orangeColor];
    
    self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"carbon_fibre.png"]];
    self.title = @"Current View";
    
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
        
        self.currentWeightInTimer.text = self.program.currentExercise.weight.stringValue;
        self.currentRepsInTimer.text = self.program.currentExercise.reps.stringValue;
        
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

- (IBAction)pauseTimerPressed:(id)sender
{
    //    [timer pause];
    [programTimer pause];
    
    self.timerStartButton.enabled = false;
    self.timerStopButton.enabled = true;
    self.timerPauseButton.enabled = true;
}

- (IBAction)stopTimerPressed:(id)sender
{
    //    [timer stop];
    [programTimer stop];
    
    self.timerStartButton.enabled = true;
    self.timerStopButton.enabled = false;
    self.timerPauseButton.enabled = false;
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
