//
//  Program.h
//  GymApp
//
//  Created by James Dunwoody on 3/08/12.
//
//

#import <Foundation/Foundation.h>
#import "Exercise.h"

@interface Program : NSObject
{
    Exercise *current;
}

- (Exercise *)currentExercise;

@property (strong, nonatomic) NSMutableArray *exercises;

@end
