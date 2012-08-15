//
//  Exercise.m
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

@synthesize name = _name;
@synthesize bodyPart = _bodyPart;
@synthesize rest = _rest;
@synthesize completed = _completed;

- (NSString *) restAsDisplayValue
{
    return [NSString stringWithFormat:@"%@ min", [self rest]];
}

@end
