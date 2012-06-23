//
//  ExerciseDataController.h
//  Gym2000AndAwesome
//
//  Created by James on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exercise.h"

@interface ExerciseDataController : NSObject

@property (nonatomic, copy) NSMutableArray *exercises;

-(NSUInteger) countOfList;

-(Exercise *) objectInListAtIndex:(NSUInteger)theIndex;
-(void) makeSuperSetForRow: (NSInteger)row;

@end
