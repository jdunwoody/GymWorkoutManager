//
//  SummaryProgramViewCell.h
//  GymApp
//
//  Created by James Dunwoody on 12/08/12.
//
//

#import <UIKit/UIKit.h>
#import "Exercise.h"

@interface CurrentExerciseCell : UITableViewCell

@property (strong, nonatomic) Exercise *exercise;
@property (weak, nonatomic) IBOutlet UIImageView *currentExerciseIndicator;
@property (strong, nonatomic) IBOutlet UILabel *position;

@property (nonatomic, strong) IBOutlet UILabel *name;
@property (nonatomic, strong) IBOutlet UILabel *reps;

@property (nonatomic, strong) IBOutlet UILabel *rest;
@property (nonatomic, strong) IBOutlet UILabel *weight;

@property (nonatomic, strong) IBOutlet UILabel *sets;

@end