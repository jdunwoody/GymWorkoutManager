//
//  SummaryChildCell.m
//  GymApp
//
//  Created by James Dunwoody on 12/08/12.
//
//

#import "OtherExerciseCell.h"

@implementation OtherExerciseCell
@synthesize name = _name;

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
