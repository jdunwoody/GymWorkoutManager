//
//  ExerciseDataController.h
//  Gym2000AndAwesome
//
//  Created by James on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exercise.h"
#import "Program.h"

@interface ExerciseDataController : NSObject

//@property (nonatomic, copy) NSMutableArray *exercises;
@property (nonatomic, copy) Program *program;

- (id)initWithProgram: (Program *) withProgram;

-(NSUInteger) countOfList;

-(Exercise *) objectInListAtIndex:(NSUInteger)theIndex;

@end
