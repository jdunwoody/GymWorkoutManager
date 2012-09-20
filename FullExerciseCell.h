//
//  FullExerciseCell.h
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import <UIKit/UIKit.h>
#import "Exercise.h"

@interface FullExerciseCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic)  Exercise *exercise;
@property (weak, nonatomic) IBOutlet UIView *setsScrollView;

@end
