//
//  Rep.h
//  GymApp
//
//  Created by James Dunwoody on 15/08/12.
//
//

#import <Foundation/Foundation.h>

@class Exercise;

@interface Set : NSManagedObject

extern const int DEFAULT_NUM_SETS;

@property (retain, nonatomic) NSNumber *weight;
@property (retain, nonatomic) NSNumber *reps;
@property (retain, nonatomic) NSNumber *rest;

@property (retain, nonatomic) Exercise *exercise;

+ (Set *) setWithContext: (NSManagedObjectContext *)context;
- (NSString *) weightAsDisplayValue;
@end
