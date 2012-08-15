//
//  Exercise.h
//  Gym2000AndAwesome
//
//  Created by James on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseWeightOrTimeMode.h"

@interface Exercise : NSObject

@property NSString *name;
@property NSString *bodyPart;
@property NSString *rest;
@property BOOL completed;

- (NSString *) restAsDisplayValue;

@end
