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
#import "EditWeightController.h"
#import "EditNameViewController.h"
#import "RepititionViewController.h"
#import "RepititionView.h"
#import "EditRepViewController.h"

@interface ExerciseViewController ()

@end

@implementation ExerciseViewController

@synthesize weightLabel = _weightLabel;
@synthesize setContainer = _setContainer;
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
    
    self.weightLabel.text = [self.exercise currentSet].weight.stringValue;
    self.tableView.dataSource = self.programDatasource;
    self.tableView.delegate = self.programDelegate;
}

- (void)viewDidUnload
{
    [self setSetContainer:nil];
    [self setWeightLabel:nil];
    [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated
{
    if ([self.programDatasource.program exerciseCount] == 0) {
        [self performSegueWithIdentifier:@"loadProgram" sender:self];
    }
}

- (void) programChanged
{
    [self.tableView reloadData];
    [self reloadCurrentExercise];
}

- (void) reloadCurrentExercise
{
    self.name.text = self.programDatasource.program.currentExercise.name;
    self.weightLabel.text = [NSString stringWithFormat:@"%@kg", self.programDatasource.program.currentExercise.currentSet.weight];
    
    for (UIView *view in [self.setContainer subviews]) {
        [view removeFromSuperview];
    }
    
    for (Set *set in self.programDatasource.program.currentExercise.sets) {
        RepititionView *just = [[RepititionView alloc] initWithFrame:CGRectMake([self.setContainer.subviews count] * 105, 0, 105, 38)];
        
        just.delegate = self;
        just.reps.text = set.reps.stringValue;
        just.rest.text = [NSString stringWithFormat: @"%@ sec", set.rest];
        
        [self.setContainer addSubview: just];
    }
}

- (IBAction)addExercise:(id)sender
{
    [self.programDatasource.program addExercise];
    [self programChanged];
    NSUInteger indexes[2];
    indexes[0] = 0;
    indexes[1] = [self.tableView numberOfRowsInSection:0] - 1;
    
    [self.tableView scrollToRowAtIndexPath: [[NSIndexPath alloc] initWithIndexes: indexes length:2] atScrollPosition: UITableViewScrollPositionMiddle animated: YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (IBAction)addSet:(id)sender
{
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];
    //    RepititionViewController *repititionViewController = [storyboard instantiateViewControllerWithIdentifier: @"repititionViewController"];
    
    RepititionView *repitition = [[RepititionView alloc] initWithFrame:CGRectMake([self.setContainer.subviews count] * 92, 0, 92, 38)];
    Set *currentSet = [self.programDatasource.program.currentExercise currentSet];
    
    repitition.delegate = self;
    
    if (currentSet == NULL) {
        currentSet = [self.programDatasource.program.currentExercise currentSet];
    }
    
    repitition.reps.text = currentSet.reps.stringValue;
    repitition.rest.text = [NSString stringWithFormat: @"%@ sec", currentSet.rest];
    
    [self.setContainer addSubview: repitition];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"loadProgram"]) {
        LoadProgramViewController *destination = segue.destinationViewController;
        destination.programDataSource = self.programDatasource;
        destination.observer = self;
        
    } else if ([segue.identifier isEqualToString:@"editName"]) {
        EditNameViewController *destination = segue.destinationViewController;
        destination.programDataSource = self.programDatasource;
        
    } else if ([segue.identifier isEqualToString:@"editWeight"]) {
        EditWeightController *destination = segue.destinationViewController;
        destination.programDataSource = self.programDatasource;
        
    } else if ([segue.identifier isEqualToString:@"editRep"]) {
        EditRepViewController *destination = segue.destinationViewController;
        destination.programDataSource = self.programDatasource;
        
    }
}

- (void) showPopover
{
    [self performSegueWithIdentifier:@"editRep" sender:self];
//    UIView *aView = [UIView alloc];
//    
//    RepititionViewController *repViewController = [[RepititionViewController alloc] init];
//    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController: repViewController];
//    popover.popoverContentSize = CGSizeMake(320, 416);
//    [popover presentPopoverFromRect:CGRectMake(0,0, 200,200) inView: aView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];    
}


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
