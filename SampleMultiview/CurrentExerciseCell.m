//
//  SummaryProgramViewCell.m
//  GymApp
//
//  Created by James Dunwoody on 12/08/12.
//
//

#import "CurrentExerciseCell.h"

@implementation CurrentExerciseCell
@synthesize exercise = _exercise;
@synthesize position = _position;
@synthesize name = _name;
@synthesize reps = _reps;
@synthesize rest = _rest;
@synthesize weight = _weight;
@synthesize sets = _sets;

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
