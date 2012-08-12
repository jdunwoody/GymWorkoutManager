//
//  CurrentViewController.m
//  GymApp
//
//  Created by James Dunwoody on 7/08/12.
//
//

#import "CurrentViewController.h"
#import "GymAppDelegate.h"
#import "LoadProgramViewController.h"

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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self performSegueWithIdentifier: @"chooseProgram" sender: self];
    //    [self showProgramChooser:self];
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

- (void)showProgramChooser:(id)sender
{
    // Create the root view controller for the navigation controller
    // The new view controller configures a Cancel and Done button for the
    // navigation bar.
    LoadProgramViewController *addController = [[LoadProgramViewController alloc] init];
    
    // Configure the RecipeAddViewController. In this case, it reports any
    // changes to a custom delegate object.
    //    addController.delegate = self;
    
    //    // Create the navigation controller and present it.
    //    UINavigationController *navigationController = [[UINavigationController alloc]
    //                                                    initWithRootViewController:addController];
    [self presentViewController:addController animated:YES completion: nil];
}

- (void) programLoadedWithProgram: (Program *)withProgram
{
    if (withProgram) {
        //        int recipeCount = [recipesController countOfRecipes];
        //        UITableView *tableView = [self tableView];
        self.program = program;
        
        [self updateCurrentExerciseView];
        //        [tableView reloadData];
    }
    
    [self dismissViewControllerAnimated:YES completion: nil];
    
    if ([self.program empty]) {
        [self performSegueWithIdentifier: @"showProgram" sender: self];
        
//        ProgramViewController *programViewController = [[ProgramViewController alloc] init];
        
//        [self presentViewController:programViewController animated:YES completion: nil];        
    }
}

- (void) programChanged
{
    [self dismissViewControllerAnimated:YES completion: nil];    
}

- (void) playSound
{
    AudioServicesPlaySystemSound(systemSoundID);
}

- (void) updateCurrentExerciseView
{
    Exercise *currentExercise = self.program.currentExercise;
    
    if (currentExercise == nil) {
        return;
    }
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showProgram"]) {
        
        ProgramViewController *destination = segue.destinationViewController;
        destination.program = self.program;
        
        destination.programChangeObserver = self;
        
        //        GymAppDelegate *appDelegate = (GymAppDelegate *)[[UIApplication sharedApplication] delegate];
        //        ExerciseTableDelegate *tableDelegate = [[ExerciseTableDelegate alloc] init];
        //        destination.tableDelegate = tableDelegate;
        //
        //        ExerciseDataController *dataController = [[ExerciseDataController alloc] initWithProgram: program];
        //        tableDelegate.dataController = dataController;
        //
        //        ExercisePickerDelegate *pickerDelegate = [[ExercisePickerDelegate alloc] initWithWithController: destination];
        //        destination.pickerDelegate = pickerDelegate;
        //
    } else if([segue.identifier isEqualToString:@"chooseProgram"]) {
        LoadProgramViewController *loadProgramViewController = (LoadProgramViewController *) segue.destinationViewController;
        loadProgramViewController.delegate = self;
        
    }
}

@end
