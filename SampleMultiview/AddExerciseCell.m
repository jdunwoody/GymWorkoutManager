//
//  ExerciseCell.m
//  Gym2000AndAwesome
//
//  Created by James on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddExerciseCell.h"

@implementation AddExerciseCell

@synthesize exerciseLabel = _exerciseLabel;
@synthesize exercisePicker = _exercisePicker;
//@synthesize repsPicker = _repsPicker;
//@synthesize bodyPartPicker = _bodyPartPicker;

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