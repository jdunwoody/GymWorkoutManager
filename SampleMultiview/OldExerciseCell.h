//
//  SummaryProgramViewCell.h
//  GymApp
//
//  Created by James Dunwoody on 12/08/12.
//
//

#import <UIKit/UIKit.h>
#import "Exercise.h"
#import "ExerciseView.h"

@interface ExerciseCell : UITableViewCell

@property (strong, nonatomic) Exercise *exercise;

@property (nonatomic, strong) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *currentExerciseIndicator;
@property (weak, nonatomic) IBOutlet ExerciseView *uiviewSet;

@end