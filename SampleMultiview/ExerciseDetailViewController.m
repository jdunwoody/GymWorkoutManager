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

@implementation ExerciseDetailViewController

@synthesize name = _name;
@synthesize repScrollView = _repScrollView;
@synthesize repContainer = _repContainer;

- (void) reloadCurrentExercise
{
    if (self.programDatasource.program.exerciseCount > 0) {
        //        self.currentExerciseContainer;
        
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

@end
