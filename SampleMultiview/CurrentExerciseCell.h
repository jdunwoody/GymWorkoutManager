//
//  CurrentExerciseCell.h
//  GymApp
//
//  Created by James Dunwoody on 19/08/12.
//
//

#import <UIKit/UIKit.h>
#import "Exercise.h"

@interface CurrentExerciseCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *reps;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UILabel *rest;
@property (weak, nonatomic) IBOutlet UIButton *completeButton;

@property (strong, nonatomic) Set *set;

@end
