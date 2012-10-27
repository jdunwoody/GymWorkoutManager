//
//  ExerciseDetailViewController.h
//  GymApp
//
//  Created by James Dunwoody on 27/10/12.
//
//

#import <UIKit/UIKit.h>

@class ProgramDataSource;

@interface ExerciseDetailViewController : UIViewController

@property (strong, nonatomic) ProgramDataSource *programDatasource;
@property (strong, nonatomic) IBOutlet UIScrollView *repScrollView;
@property (strong, nonatomic) IBOutlet UIView *repContainer;
@property (strong, nonatomic) IBOutlet UILabel *name;

- (void) reloadCurrentExercise;

@end
