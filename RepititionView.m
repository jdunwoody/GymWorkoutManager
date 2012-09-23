//
//  JustAnIconView.m
//  GymApp
//
//  Created by James Dunwoody on 21/09/12.
//
//

#import "RepititionView.h"

@implementation RepititionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview: [[[NSBundle mainBundle] loadNibNamed:@"Repitition" owner:self options:nil] objectAtIndex:0]];
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
