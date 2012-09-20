//
//  ProgramDetailNotifiable.h
//  GymApp
//
//  Created by James Dunwoody on 17/09/12.
//
//

#import <Foundation/Foundation.h>

@class Exercise;

@protocol ProgramDetailNotifiable <NSObject>

- (void) showProgramDetailWithExericise: (Exercise *)exercise;

@end
