//
//  ExerciseDetailViewController.h
//  GymApp
//
//  Created by James Dunwoody on 27/10/12.
//
//

#import <UIKit/UIKit.h>
#import "ProgramChangedObserver.h"
#import "PopoverPresentable.h"

@class ProgramDataSource;
@class EditRepViewController;
@class EditWeightViewController;
@class EditRestViewController;


@interface ExerciseDetailViewController : UIViewController<ProgramChangeObserver, UIGestureRecognizerDelegate, PopoverPresentable>
{
    UIPopoverController *popoverViewController;
    
    UIPopoverController *editRepPopoverViewController;
    id<EditExerciseComponentController> editRepViewController;
    
    UIPopoverController *editWeightPopoverViewController;
    id<EditExerciseComponentController> editWeightViewController;
    
    UIPopoverController *editRestPopoverViewController;
    id<EditExerciseComponentController> editRestViewController;
}

@property (strong, nonatomic) ProgramDataSource *programDatasource;
@property (strong, nonatomic) IBOutlet UIScrollView *repScrollView;
@property (strong, nonatomic) IBOutlet UIView *repContainer;
@property (strong, nonatomic) IBOutlet UILabel *name;
- (IBAction)addSet:(id)sender;

- (void) reloadCurrentExercise;

- (IBAction)nextExercise:(id)sender;
- (IBAction)previousExercise:(id)sender;

@end
