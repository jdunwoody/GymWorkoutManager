//
//  SetElement.m
//  GymApp
//
//  Created by James Dunwoody on 18/09/12.
//
//

#import "SetElement.h"

@implementation SetElement
//@synthesize set = _set;
//@synthesize reps = _reps;
//@synthesize rest = _rest;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview: [[[NSBundle mainBundle] loadNibNamed:@"SetView" owner:self options:nil] objectAtIndex:0]];
    }
    return self;
}

//-(id)initWithCoder:(NSCoder *)aDecoder{
//    if ((self = [super initWithCoder:aDecoder])){
//        
//        [[[NSBundle mainBundle] loadNibNamed:@"repititionView" owner:self options:nil] objectAtIndex:0];
//        
//    }
//    return self;
//}

//-(id) init
//{
//    if(self = [super init]) {
//        [[[NSBundle mainBundle] loadNibNamed:@"repititionView" owner:self options:nil] objectAtIndex:0];
//        
////        [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"repititionView" owner:self options:nil] objectAtIndex:0]];
//    }
//    return self;
//}


@end
