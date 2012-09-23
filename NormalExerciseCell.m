//
//  NormalExerciseCell.m
//  GymApp
//
//  Created by James Dunwoody on 21/09/12.
//
//

#import "NormalExerciseCell.h"

@implementation NormalExerciseCell

@synthesize exercise = _exercise;
@synthesize setsScrollView = _setsScrollView;

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
