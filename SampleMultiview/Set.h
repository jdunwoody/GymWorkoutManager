//
//  Rep.h
//  GymApp
//
//  Created by James Dunwoody on 15/08/12.
//
//

#import <Foundation/Foundation.h>

@interface Set : NSObject

@property NSNumber *weight;
@property NSNumber *reps;
@property NSNumber *rest;

- (id) initWithReps: (NSNumber *) withReps;

- (int) position;
- (NSString *) weightAsDisplayValue;
@end
