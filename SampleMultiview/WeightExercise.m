//
//  WeightExercise.m
//  GymApp
//
//  Created by James on 25/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeightExercise.h"


@implementation WeightExercise
@synthesize sets = _sets;

- (id)init 
{
    if (self = [super init]) {
        self.sets = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
