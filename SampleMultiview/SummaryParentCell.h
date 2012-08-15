//
//  SummaryProgramViewCell.h
//  GymApp
//
//  Created by James Dunwoody on 12/08/12.
//
//

#import <UIKit/UIKit.h>
#import "Exercise.h"

@interface SummaryParentCell : UITableViewCell

@property (strong, nonatomic) Exercise *exercise;
@property (weak, nonatomic) IBOutlet UIImageView *currentExerciseIndicator;

@property (nonatomic, strong) IBOutlet UILabel *name;
@property (nonatomic, strong) IBOutlet UILabel *reps;

@property (nonatomic, strong) IBOutlet UILabel *rest;
@property (nonatomic, strong) IBOutlet UILabel *weight;
@property (nonatomic, strong) IBOutlet UILabel *time;

@property (nonatomic, strong) IBOutlet UILabel *sets;

@end