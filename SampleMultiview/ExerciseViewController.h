//
//  ExerciseViewController.h
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import <UIKit/UIKit.h>

@class WeightExercise;
@class Exercise;

@interface ExerciseViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *setContainer;
- (IBAction)addSet:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;

@property (strong, nonatomic) Exercise *exercise;

@end
