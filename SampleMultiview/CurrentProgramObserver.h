//
//  CurrentProgramObserver.h
//  GymApp
//
//  Created by James Dunwoody on 8/09/12.
//
//

#import <Foundation/Foundation.h>

@class Exercise;

@protocol CurrentProgramObserver <NSObject>

- (void)exerciseIsSelected: (Exercise *)withExercise;

@end
