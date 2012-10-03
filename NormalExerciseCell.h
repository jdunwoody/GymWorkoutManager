//
//  NormalExerciseCell.h
//  GymApp
//
//  Created by James Dunwoody on 21/09/12.
//
//

#import <UIKit/UIKit.h>
@class Exercise;

@interface NormalExerciseCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIView *setsScrollView;
@property (weak, nonatomic) IBOutlet UIView *container;

@property (strong, nonatomic) Exercise *exercise;

@end
