//
//  ExerciseViewController.m
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import "ExerciseViewController.h"
#import "Set.h"
#import "Exercise.h"
#import "ProgramDelegate.h"
#import "LoadProgramViewController.h"
#import "EditNameViewController.h"
#import "RepititionViewController.h"
#import "RepititionView.h"
#import "EditRepViewController.h"
#import "EditWeightUIPickerViewController.h"
#import "EditExerciseComponentController.h"
#import "ExerciseDetailViewController.h"

@interface ExerciseViewController ()

@end

@implementation ExerciseViewController

//@synthesize repContainer = _repContainer;
@synthesize exercise = _exercise;
@synthesize programDatasource = _programDatasource;
@synthesize programDelegate = _programDelegate;
@synthesize currentExerciseContainer = _currentExerciseContainer;
@synthesize currentExerciseDetailViewController = _currentExerciseDetailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self.programDatasource;
    self.tableView.delegate = self.programDelegate;
    
    [self addChildViewController: self.currentExerciseDetailViewController];
    [self.mainPanel addSubview: self.currentExerciseDetailViewController.view];
    //    self.currentExerciseDetailViewController.view.frame = CGRectMake(0, 0, 400, 400);
    [self.currentExerciseDetailViewController didMoveToParentViewController: self];
    
    [self.currentExerciseDetailViewController reloadCurrentExercise];
    //    [self addChildViewController: self.nextExerciseDetailViewController];
    //    [self.mainPanel addSubview: self.nextExerciseDetailViewController.view];
    //    self.nextExerciseDetailViewController.view.frame = CGRectMake(0, 0, 400, 400);
    //    [self.nextExerciseDetailViewController didMoveToParentViewController: self];
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(keyboardWasShown:)
    //                                                 name:UIKeyboardWillShowNotification
    //                                               object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(keyboardWasHidden:)
    //                                                 name:UIKeyboardWillHideNotification
    //                                               object:nil];
}

//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    self.programDatasource.program.name = self.programName.text;
    [self.programDatasource save];
    return NO;
}

- (void)viewDidAppear:(BOOL)animated
{
    if ([self.programDatasource.program exerciseCount] == 0) {
        [self loadProgram:self];
    }
}

- (void) programChanged
{
    [self.tableView reloadData];
    self.programName.text = self.programDatasource.program.name;
    [self.currentExerciseDetailViewController reloadCurrentExercise];
}

- (IBAction)addExercise:(id)sender
{
    [self.programDatasource.program addExercise];
    //    [self.programDatasource.program setCurrentExerciseToLast];
    
    //    [self programChanged];
    
    [self.programDatasource notifyProgramChangeObservers];
    
    [self scrollToCurrent];
}

- (IBAction)loadProgram:(id)sender {
    [self performSegueWithIdentifier:@"loadProgram" sender:sender];
}

- (IBAction)addSet:(id)sender
{
    [self.programDatasource.program.currentExercise addSet];
    //    [self programChanged];
    [self.programDatasource notifyProgramChangeObservers];
}

- (void) scrollToLast
{
    [self scrollToIndex:[self.tableView numberOfRowsInSection:0] - 1];
}

- (void) scrollToCurrent
{
    [self scrollToIndex:self.programDatasource.program.currentExercisePosition];
}

- (void) scrollToIndex: (int) index
{
    NSUInteger indexes[2];
    indexes[0] = 0;
    indexes[1] = index;
    
    [self.tableView scrollToRowAtIndexPath: [[NSIndexPath alloc] initWithIndexes: indexes length:2] atScrollPosition: UITableViewScrollPositionMiddle animated: YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"loadProgram"]) {
        LoadProgramViewController *destination = segue.destinationViewController;
        destination.programDataSource = self.programDatasource;
        destination.observer = self;
        destination.context = self.context;
        
    } else if ([segue.identifier isEqualToString:@"editName"]) {
        EditNameViewController *destination = segue.destinationViewController;
        destination.programDataSource = self.programDatasource;
        destination.exerciseViewController = self.currentExerciseDetailViewController;
        
    } else if ([segue.identifier isEqualToString:@"editRep"]) {
        RepititionView *repitionView = (RepititionView *) sender;
        
        EditRepViewController *destination = segue.destinationViewController;
        destination.programDatasource = self.programDatasource;
        destination.exerciseViewController = self;
        destination.set = repitionView.set;
    }
}

//    if (!editWeightViewController)
//    {
//    }
//    editWeightViewController = set;
//    editWeightViewController.programDatasource = self.programDatasource;


//    if (!editWeightPopoverViewController) {
//    }
//    editRepViewController.pickerView = editRepPopoverViewController.contentViewController.view;


//    [self performSegueWithIdentifier:@"editRep" sender:targetView];
//    UIView *aView = [UIView alloc];
//
//    RepititionViewController *repViewController = [[RepititionViewController alloc] init];
//    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController: repViewController];
//    popover.popoverContentSize = CGSizeMake(320, 416);
//    [popover presentPopoverFromRect:CGRectMake(0,0, 200,200) inView: aView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];


//
//- (IBAction)repTapped:(id)sender {
//    NSLog(@"Rep tapped");
//
//    //    UIView *aView = [[UIView alloc] init];
//    [self showPopover];
//}




//- (IBAction)weightTapGesture:(id)sender
//{
//    self.weightPicker.hidden = NO;
//
//    //    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(self.weightLabel.frame.origin.y,
//    //                                                                              self.weightLabel.frame.origin.x,
//    //                                                                              200,
//    //                                                                              40)];
//    //    pickerView.delegate = self.weightPickerDelegate;
//    //    pickerView.dataSource = self.weightPickerDelegate;
//    //    pickerView.showsSelectionIndicator = YES;
//    //    [self.view addSubview:pickerView];
//}

//    SetElement *setElement = [[SetElement alloc] initWithFrame:CGRectMake([self.setContainer.subviews count]*40, 0, 40, 40)];
//    [self.setContainer addSubview: setElement];
//    setElement.backgroundColor = [UIColor redColor];

//    NSLog(@"Number of child elements %i", [self.setContainer.subviews count]);

//    setElement.set = [[Set alloc] initWithReps:[NSNumber numberWithInt:1]];
//    setElement.frame = CGRectMake([self.setContainer.subviews count]*40, 0, 40, 40);
//    setElement.reps.text = [self.exercise currentSet].reps.stringValue;
//    setElement.rest.text = [self.exercise currentSet].rest.stringValue;
//    setElement.backgroundColor = [UIColor redColor];

//    [self.setContainer addSubview: setElement];

//    for(SetElement *view in self.setContainer.subviews) {
//        NSLog(@"dimensions %f %f %f %f %@ %@",
//              view.frame.origin.x,
//              view.frame.origin.y,
//              view.frame.size.width,
//              view.frame.size.height,
//              view.reps.text,
//              view.rest.text);
//    }

//- (IBAction)addSet:(id)sender
//{
//    NSLog(@"Number of child elements %i", [self.setContainer.subviews count]);
//
//    SetElement *setElement = [[SetElement alloc] init];
//
//    [[[NSBundle mainBundle] loadNibNamed:@"repititionView" owner:setElement options:nil] objectAtIndex:0];
//
//    //    setElement.set = [[Set alloc] initWithReps:[NSNumber numberWithInt:1]];
//    setElement.frame = CGRectMake([self.setContainer.subviews count]*40, 0, 40, 40);
//    setElement.reps.text = [self.exercise currentSet].reps.stringValue;
//    setElement.rest.text = [self.exercise currentSet].rest.stringValue;
//    setElement.backgroundColor = [UIColor redColor];
//
//    [self.setContainer addSubview: setElement];
//
//    for(SetElement *view in self.setContainer.subviews) {
//        NSLog(@"dimensions %f %f %f %f %@ %@",
//              view.frame.origin.x,
//              view.frame.origin.y,
//              view.frame.size.width,
//              view.frame.size.height,
//              view.reps.text,
//              view.rest.text);
//    }
//}


//- (IBAction)addSet:(id)sender
//{
//    NSLog(@"Number of child elements %i", [self.setContainer.subviews count]);
//
//    SetElement *setElement = [[SetElement alloc] init];
//
//    setElement.set = [[Set alloc] initWithReps:[NSNumber numberWithInt:1]];
//    setElement.frame = CGRectMake([self.setContainer.subviews count]*40, 0, 40, 40);
//    setElement.reps.text = [self.exercise currentSet].reps.stringValue;
//    setElement.rest.text = [self.exercise currentSet].rest.stringValue;
//    setElement.backgroundColor = [UIColor redColor];
//
//    [self.setContainer addSubview: setElement];
//
//    for(SetElement *view in self.setContainer.subviews) {
//        NSLog(@"dimensions %f %f %f %f %@ %@",
//              view.frame.origin.x,
//              view.frame.origin.y,
//              view.frame.size.width,
//              view.frame.size.height,
//              view.reps.text,
//              view.rest.text);
//    }
//}


//    self.setContainer.frame = CGRectMake(self.setContainer.frame.origin.x, self.setContainer.frame.origin.y, 400, 400);
//    NSLog(@"Adding %f %f %f %f",
//          setElement.frame.origin.x,
//          setElement.frame.origin.y,
//          setElement.frame.size.width,
//          setElement.frame.size.height);
//
//    NSLog(@"to %f %f %f %f",
//          self.setContainer.frame.origin.x,
//          self.setContainer.frame.origin.y,
//          self.setContainer.frame.size.width,
//          self.setContainer.frame.size.height);
//
//    for (UIView *subview in [self.setContainer subviews]) {
//        NSLog(@"Adding %f %f %f %f",
//              subview.frame.origin.x,
//              subview.frame.origin.y,
//              subview.frame.size.width,
//              subview.frame.size.height);
//    }


- (void)viewDidUnload {
    [self setCurrentExerciseContainer:nil];
    [self setMainPanel:nil];
    [super viewDidUnload];
}
@end
