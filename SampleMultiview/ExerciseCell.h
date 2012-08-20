//
//  SummaryProgramViewCell.h
//  GymApp
//
//  Created by James Dunwoody on 12/08/12.
//
//

#import <UIKit/UIKit.h>
#import "Exercise.h"

@interface ExerciseCell : UITableViewCell

@property (strong, nonatomic) Exercise *exercise;

@property (nonatomic, strong) IBOutlet UILabel *name;

@end