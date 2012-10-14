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

@interface ExerciseViewController ()

@end

@implementation ExerciseViewController

@synthesize repContainer = _repContainer;
@synthesize exercise = _exercise;
@synthesize programDatasource = _programDatasource;
@synthesize programDelegate = _programDelegate;

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
    [self reloadCurrentExercise];
}

- (void) reloadCurrentExercise
{
    if (self.programDatasource.program.exerciseCount > 0) {
        self.name.text = self.programDatasource.program.currentExercise.name;
        
        for (UIView *view in [self.repContainer subviews]) {
            [view removeFromSuperview];
        }
        
        //        self.repContainer.pagingEnabled = YES;
        
        //        self.repContainer.contentSize = CGSizeMake(100 * self.programDatasource.program.exerciseCount, 98);
        self.repScrollView.contentSize = CGSizeMake(1024, 98);
        
        for (Set *set in self.programDatasource.program.currentExercise.sets) {
            RepititionView *repView = [[RepititionView alloc] initWithFrame:CGRectMake([self.repContainer.subviews count] * 119, 0, 119, 105) withNibName:@"Repitition"];
            //            repView.delegate = self;
            repView.viewController = self;
            repView.reps.text = [set.reps stringValue];
            repView.rest.text = [set.rest stringValue];
            repView.weight.text = [set.weight stringValue];
            repView.set = set;
            [self.repContainer addSubview: repView];
        }
    }
}

- (IBAction)addExercise:(id)sender
{
    [self.programDatasource.program addExercise];
    [self.programDatasource.program setCurrentExerciseToLast];
    
    [self programChanged];
    
    [self scrollToCurrent];
}

- (IBAction)loadProgram:(id)sender {
    [self performSegueWithIdentifier:@"loadProgram" sender:sender];
}

- (IBAction)addSet:(id)sender
{
    [self.programDatasource.program.currentExercise addSet];
    [self programChanged];
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

//        } else {
//            repView = [self.setContainer.subviews objectAtIndex:0];
//        }

//        [self.setContainer addSubview: [[[NSBundle mainBundle] loadNibNamed:@"Repitition" owner:self options:nil] objectAtIndex:0]];
//
//        self.reps.text = set.reps.stringValue;
//        self.rest.text = [NSString stringWithFormat: @"%@ sec", set.rest];

//        if ([self.setContainer.subviews count] == 0) {

//    RepititionView *repitition = [[RepititionView alloc] initWithFrame:CGRectMake([self.setContainer.subviews count] * 92, 0, 92, 38)];
//    repitition.delegate = self;


//    Set *currentSet = [self.programDatasource.program.currentExercise currentSet];
//    if (currentSet == NULL) {
//        currentSet = [self.programDatasource.program.currentExercise currentSet];
//    }

//    repitition.reps.text = newSet.reps.stringValue;
//    repitition.rest.text = [NSString stringWithFormat: @"%@ sec", newSet.rest];
//
//    [self.setContainer addSubview: repitition];
//}

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
        destination.exerciseViewController = self;
        
    } else if ([segue.identifier isEqualToString:@"editRep"]) {
        RepititionView *repitionView = (RepititionView *) sender;
        
        EditRepViewController *destination = segue.destinationViewController;
        destination.programDatasource = self.programDatasource;
        destination.exerciseViewController = self;
        destination.set = repitionView.set;
    }
}
- (void) showRestPopoverWithView: (UIView *) targetView withSet: (Set *) set
{
    editRestViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"editRestViewController"];
    
    [self showPopover:editRestViewController withView: targetView withSet: set];
}

- (void) showRepPopoverWithView: (UIView *) targetView withSet: (Set *) set
{
    editRepViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"editRepViewController"];
    
    [self showPopover: editRepViewController withView: targetView withSet: set];
}

- (void) showWeightPopoverWithView: (UIView *) targetView withSet: (Set *) set
{
    editWeightViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"editWeightViewController"];
    
    [self showPopover: editWeightViewController withView:targetView withSet: set];
}

- (void) showPopover: (id<EditExerciseComponentController>) viewController withView: (UIView *) targetView withSet: (Set *) set
{
    viewController.programDatasource = self.programDatasource;
    viewController.exerciseViewController = self;
    viewController.set = set;
    
    popoverViewController = [[UIPopoverController alloc] initWithContentViewController:((UIViewController *)viewController)];
    
    [popoverViewController presentPopoverFromRect:targetView.frame inView:targetView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
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


@end
