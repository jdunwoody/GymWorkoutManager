//
//  Rep.h
//  GymApp
//
//  Created by James Dunwoody on 15/08/12.
//
//

#import <Foundation/Foundation.h>

@interface Set : NSObject

extern const int DEFAULT_NUM_SETS;

@property NSNumber *weight;
@property NSNumber *reps;
@property NSNumber *rest;

- (NSString *) weightAsDisplayValue;
@end
