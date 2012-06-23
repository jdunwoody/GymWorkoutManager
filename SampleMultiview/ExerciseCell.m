//
//  InactiveExercise.m
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExerciseCell.h"

@implementation ExerciseCell

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

@synthesize name = name;
@synthesize reps = _reps;
@synthesize bodyPart = _bodyPart;
@synthesize rest = _rest;
@synthesize weights = _weights;
@synthesize type = _type;
@synthesize intensity = _intensity;

@end
