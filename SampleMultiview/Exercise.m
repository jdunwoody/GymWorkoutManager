//
//  Exercise.m
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

@synthesize name, rest, bodyPart, category, intensity, superSet, weight, reps;
@synthesize isAdd, isCompleted, isSingle;
@synthesize exerciseWeightOrTimeMode = _exerciseWeightOrTimeMode;

//- (id)initWithLabel: (NSString *)label 
//{
//    if (self = [super init]) {
////        [self set
//    }
//    return self;
//    
//}

- (NSString *) restAsDisplayValue
{
    return [NSString stringWithFormat:@"%@ min", [self rest]];        
}

@end
