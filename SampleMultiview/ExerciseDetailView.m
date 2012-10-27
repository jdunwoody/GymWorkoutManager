//
//  ExerciseDetailView.m
//  GymApp
//
//  Created by James Dunwoody on 27/10/12.
//
//

#import "ExerciseDetailView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ExerciseDetailView

- (id)initWithFrame:(CGRect)frame withNibName: (NSString *) nibName
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview: [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] objectAtIndex:0]];
        
        [self.layer setCornerRadius:5.0];
        [self.layer setBorderWidth:2.0];
        [self.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];   //Adding Border color.
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
