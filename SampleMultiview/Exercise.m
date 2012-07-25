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
@synthesize rest = _rest;
@synthesize bodyPart = _bodyPart;
@synthesize category = _category;
@synthesize isAdd = _isAdd;
@synthesize isCompleted = _isCompleted;
@synthesize isSingle = _isSingle;
@synthesize intensity = _intensity;
@synthesize superSet = _superSet;
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
