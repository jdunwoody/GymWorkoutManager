//
//  ExerciseDetailViewController.m
//  GymApp
//
//  Created by James Dunwoody on 27/10/12.
//
//

#import "ExerciseDetailViewController.h"
#import "ProgramDataSource.h"
#import "RepititionView.h"
#import "EditNameViewController.h"
#import "EditRepViewController.h"

@implementation ExerciseDetailViewController

@synthesize name = _name;
@synthesize repScrollView = _repScrollView;
@synthesize repContainer = _repContainer;

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

- (IBAction)nextExercise:(id)sender
{
    [self.programDatasource.program next];
    [self.programDatasource notifyProgramChangeObservers];
}

- (IBAction)previousExercise:(id)sender
{
    [self.programDatasource.program previous];
    [self.programDatasource notifyProgramChangeObservers];
}

- (void) programChanged
{
    [self reloadCurrentExercise];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editName"]) {
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

- (IBAction)addSet:(id)sender
{
    [self.programDatasource.program.currentExercise addSet];
    [self.programDatasource notifyProgramChangeObservers];
}

@end
