//
//  CurrentExerciseCell.m
//  GymApp
//
//  Created by James Dunwoody on 19/08/12.
//
//

#import "SetCell.h"

@implementation SetCell

@synthesize reps = _reps;
@synthesize weight = _weight;
@synthesize rest = _rest;
@synthesize completeButton = _completeButton;
@synthesize set = _set;
@synthesize position = _position;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    
    }
    
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
