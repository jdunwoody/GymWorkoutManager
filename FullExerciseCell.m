//
//  FullExerciseCell.m
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import "FullExerciseCell.h"

@implementation FullExerciseCell

@synthesize name = _name;
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
}

@end
