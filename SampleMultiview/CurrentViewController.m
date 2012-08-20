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
#import "CurrentSetCell.h"
#import "WeightExercise.h"
#import "CurrentExerciseCell.h"
#import "CurrentExerciseTableDelegate.h"
#import "OtherExerciseCell.h"

@implementation CurrentViewController
@synthesize programTableView;
@synthesize currentView = _currentView;
@synthesize programTime = _programTime;
@synthesize timerStopButton;
@synthesize timerPauseButton;
@synthesize nextButton;
@synthesize nextExerciseLabel;
@synthesize repsView;
@synthesize timerStartButton;
@synthesize currentExerciseInTimer = _currentExerciseInTimer;
@synthesize currentWeightInTimer = _currentWeightInTimer;
@synthesize currentRepsInTimer = _currentRepsInTimer;
@synthesize currentTimeInTimer = _currentTimeInTimer;
@synthesize backgroundColor, timerAlertColour, timerWarningColour;
@synthesize program = _program;
@synthesize currentExerciseTableDelegate = _currentExerciseTableDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentExerciseTableDelegate = [[CurrentExerciseTableDelegate alloc] initWithTableView:self.currentExerciseTableView];
    self.currentExerciseTableView.dataSource = self.currentExerciseTableDelegate;
    self.currentExerciseTableView.delegate = self.currentExerciseTableDelegate;
    
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
    
    LoadProgramViewController *loadProgramViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoadProgramViewController"];
    [self presentViewController:loadProgramViewController animated:YES completion:nil];
    
    loadProgramViewController = nil;
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
    [self setProgramTableView:nil];
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

- (void) programLoadedWithProgram: (Program *) withProgram
{
    self.program = withProgram;
    self.currentExerciseTableDelegate.program = withProgram;
    
    [self updateCurrentExerciseView];
    
    [self dismissModalViewControllerAnimated:YES];
}

//    [self dismissViewControllerAnimated:YES completion: nil];
//    if ([self.program empty]) {
//        [self performSegueWithIdentifier: @"showProgram" sender: self];
//        ProgramViewController *programViewController = [[ProgramViewController alloc] init]
//        [self presentViewController:programViewController animated:YES completion: nil];
//    }

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
    
    if ([currentExercise isKindOfClass:[WeightExercise class]]) {
        self.currentExerciseInTimer.text = self.program.currentExercise.name;
        
        //        self.currentWeightInTimer.text = [NSString stringWithFormat:@"%@ kg", self.program.currentExercise.weight.stringValue];
        //        self.currentRepsInTimer.text = [NSString stringWithFormat:@"%@ reps", self.program.currentExercise.reps.stringValue];
        //
        //        Exercise *nextExercise = self.program.nextExercise;
        //        if (nextExercise != nil) {
        //            self.nextExerciseLabel.text = [NSString stringWithFormat:@"Coming up... %@ %@kg %@ reps", nextExercise.name, nextExercise.weight, nextExercise.reps];
        //        } else {
        //            self.nextExerciseLabel.text = @"nothing next";
        //        }
    }
    [self.programTableView reloadData];
    [self.currentExerciseTableView reloadData];
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

- (IBAction)exerciseCompletedPressed:(id)sender {
    [self.program currentExerciseIsCompleted];
    
    [self.programTableView reloadData];
    [self.programTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.program.currentExercise currentSetPosition] inSection:0]
                                 atScrollPosition:UITableViewScrollPositionMiddle animated:YES];

    [self.currentExerciseTableView reloadData];
    [self.currentExerciseTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.program.currentExercise currentSetPosition] inSection:0]
                                         atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (IBAction)setCompletedPressed:(id)sender {
    [self.program.currentExercise currentSetIsCompleted];
    
    [self.currentExerciseTableView reloadData];
    [self.currentExerciseTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self.program.currentExercise currentSetPosition] inSection:0]
                                         atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
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

- (NSUInteger)countOfList {
    NSLog(@"count of list %i", [self.program count]);
    return [self.program count];
}

- (Exercise *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.program exerciseAtIndex:theIndex];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self countOfList];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"title for header in section";
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Exercise *exercise = [self.program exerciseAtIndex:indexPath.row];
    
    if (exercise == self.program.currentExercise) {
        NSString *cellIdentifier = @"CurrentExerciseCell";
        
        CurrentExerciseCell *currentExerciseCell = (CurrentExerciseCell *)[self.programTableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (currentExerciseCell == nil) {
            currentExerciseCell = [[CurrentExerciseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        [currentExerciseCell.position setText: [NSString stringWithFormat:@"%i", indexPath.row +1]];
        [currentExerciseCell.name setText: [NSString stringWithFormat:@"%@", exercise.name]];
        [currentExerciseCell.sets setText: [NSString stringWithFormat:@"%i sets", [exercise.sets count]]];
        
        return currentExerciseCell;
        
    } else {
        NSString *cellIdentifier = @"OtherExerciseCell";
        
        OtherExerciseCell *otherExerciseCell = (OtherExerciseCell *)[self.programTableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (otherExerciseCell == nil) {
            otherExerciseCell = [[OtherExerciseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        //        otherExerciseCell.backgroundColor = [UIColor grayColor];
        
        [otherExerciseCell.name setText: [NSString stringWithFormat:@"%@", exercise.name]];
          
        return otherExerciseCell;
    }
    
    //    [[cell reps] setText: exercise.reps.stringValue];
    //    [[cell weight] setText: [NSString stringWithFormat:@"%@kg", set.weight.stringValue]];
    //    [[cell rest] setText: [NSString stringWithFormat:@"%@s",set.rest.stringValue]];
    
    //    if (exercise.exerciseWeightOrTimeMode == ExerciseWeightMode) {
    //        WeightExercise *weightExercise = (WeightExercise *) exercise;
    //        [[cell reps] setText: [weightExercise repsAsDisplayValue]];
    //        [[cell weight] setText: [weightExercise weightAsDisplayValue]];
    //        cell.weightImage.hidden = false;
    //        cell.repsImage.hidden = true;
    //    } else {
    //        TimeExercise *timeExercise = (TimeExercise *) exercise;
    //        [[cell time] setText: [timeExercise timeAsDisplayValue]];
    //        cell.weightImage.hidden = true;
    //        cell.repsImage.hidden = false;
    //    }
    //    exercise = nil;
    //    cellIdentifier = nil;
    //    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    Exercise *exercise = [self objectInListAtIndex:indexPath.row];
    
    //    cell.backgroundColor = self.backgroundColor;
    cell.textLabel.textColor = [UIColor whiteColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.program isIndexOfCurrentExercise: indexPath]) {
        return 170;
    } else {
        return tableView.rowHeight;
    }
}

//        UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
//        gesture.direction = UISwipeGestureRecognizerDirectionRight;
//        [cell.contentView addGestureRecognizer:gesture];

//    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
////    [gesture setDirection: (UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight)];
//    gesture.direction = UISwipeGestureRecognizerDirectionRight;
//    [tableView addGestureRecognizer:gesture];
//

//-(void)didSwipe:(UISwipeGestureRecognizer *)recognizer {
//
//    //    if (recognizer.state == UIGestureRecognizerStateEnded) {
//    //        CGPoint swipeLocation = [recognizer locationInView:self.tableView];
//    //        NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
//    //
//    //        //        ExerciseCell *cell = (ExerciseCell *)[self.tableView cellForRowAtIndexPath:swipedIndexPath];
//    //
//    //        Exercise *exercise = [self.dataController objectInListAtIndex:swipedIndexPath.row];
//    //        exercise.superSet = YES;
//    //    }
//
//    CGPoint swipeLocation = [recognizer locationInView:self.tableView];
//    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
//
//    Exercise *exercise = [self.dataController objectInListAtIndex:swipedIndexPath.row];
//    ExerciseCell *cell = (ExerciseCell *)[self.tableView cellForRowAtIndexPath:swipedIndexPath];
//
//    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
//        [self makeSuperSetWithCell: cell withExercise: exercise];
//    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
//        [self makeNormalSetWithCell: cell withExercise: exercise];
//    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
//        NSLog(@"unknown direction down");
//    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
//        NSLog(@"unknown direction up");
//    } else {
//        NSLog(@"unknown direction");
//    }
//}

//- (void) makeSuperSetWithCell: (ExerciseCell *)cell withExercise: (Exercise *)exercise
//{
//    cell.backgroundColor = [UIColor purpleColor];
//    exercise.superSet = YES;
//}
//
//- (void) makeNormalSetWithCell: (ExerciseCell *)cell withExercise: (Exercise *)exercise
//{
//    cell.backgroundColor = [UIColor whiteColor];
//    exercise.superSet = NO;
//}

//        [[cell sets] setText: [NSString stringWithFormat:@"%d", exercise.sets]];
//    [[cell category] setText: exercise.isSingle ? @"Single" : @"Super"];
//        cell.indentationLevel = 50;
//        cell.indentationWidth = 50;


//    if (exercise.isAdd) {
//        static NSString *CellIdentifier = @"AddExerciseCell";
//        AddExerciseCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//
//        [[cell exercisePicker] setDelegate:self];
//        [[cell exercisePicker] setDataSource:self];
//
//        //        NSString *valueAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
//        //        [[cell category] setText: @"exercise category"];
//        //        [[cell exerciseLabel] setText:@"exercise label"];
//
//        return cell;
//
//    } else {
//        @property NSString *type;
//        Exercise *exercise = [self.dataController objectInListAtIndex:indexPath.row];
//        [[cell reps] setText: [NSString stringWithFormat:@"%d" exercise.reps]];
//        [[cell bodyPart] setText: exercise.bodyPart];
//        [cell sizeToFit];
//        cell.backgroundColor = [UIColor redColor];
//        cell.backgroundColor = [UIColor colorWithRed:172.0/255.0 green:173.0/255.0 blue:175.0/255.0 alpha:1.0];
//        [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop]
//    NSIndexPath *selectedIndex = [tableView indexPathForSelectedRow];
//    }
//}

//
//-(void) addExerciseWithName:(NSString *)name withReps: (NSString *)reps withRest: (NSString *)rest withWeight: (NSString *)weight withBodyPart: (NSString *)selectedBodyPart withIntensity:(NSString *)selectedIntensity withCategory:(NSString *)selectedCategory
//{
//    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
//
//    Exercise *exercise = [[Exercise alloc] init];
//    exercise.name = name;
//    exercise.reps = [numberFormatter numberFromString: reps];
//    exercise.rest = rest;
//    exercise.weight = [numberFormatter numberFromString:weight];
//    exercise.bodyPart = selectedBodyPart;
//    exercise.intensity = selectedIntensity;
//
//    exercise.category = selectedCategory;
//    [self.dataController.exercises addObject:exercise];
//}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleInsert) {
//
//
//    } else if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.program removeExerciseAtIndex:indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [self.tableView reloadData];
//
//        //        NSLog(@"%d", [self.dataController.exercises count]);
//        //        NSLog(@"%d", [self.tableView numberOfRowsInSection:0]);
//        //        [self.tableView setEditing:FALSE animated:YES];
//
//        //        [self.tableView deleteRowsAtIndexPaths:indexPath withRowAnimation:YES];
//        //        int row = indexPath.row;
//        //        SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[UIApplication sharedApplication] delegate];
//        //        [controller removeObjectFromListAtIndex:indexPath.row];
//        //        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void) addExerciseWithExercise:(Exercise *)exercise
{
    [self.program addExercise:exercise];
}

-(void) deleteWithIndexPaths: (NSArray *)indexPaths
{
    for (NSIndexPath *path in indexPaths) {
        [self.program removeExerciseAtIndex:path.row];
    }
}

//-(void) updateRowWithExercise: (Exercise *) exercise withRow: (NSInteger) row
//{
//    [self.program updateExerciseAtIndex:row withObject:exercise];
//    [self.tableView reloadData];
//}

//-(void) updateRowWithRow: (NSInteger)row withComponent: (NSInteger)component
//{
//    [self.tableView
//}

//- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
//{
//    NSLog(@"Insert rows");
//}
//
//- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
//{
//    NSLog(@"Delete rows");
//}
//
//- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath
//{
//    NSLog(@"Move rows");
//}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    return UITableViewCellEditingStyleInsert;
    return UITableViewCellEditingStyleDelete;
}

@end
