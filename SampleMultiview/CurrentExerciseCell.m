//
//  CurrentExerciseCell.m
//  GymApp
//
//  Created by James Dunwoody on 19/08/12.
//
//

#import "CurrentExerciseCell.h"

@implementation CurrentExerciseCell

@synthesize reps = _reps;
@synthesize weight = _weight;
@synthesize rest = _rest;
@synthesize completeButton = _completeButton;
@synthesize set = _set;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
