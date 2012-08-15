//
//  SummaryProgramViewCell.m
//  GymApp
//
//  Created by James Dunwoody on 12/08/12.
//
//

#import "SummaryParentCell.h"

@implementation SummaryParentCell
@synthesize exercise = _exercise;

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
