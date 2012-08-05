//
//  ElapsedTimeObserver.h
//  GymApp
//
//  Created by James Dunwoody on 5/08/12.
//
//

#import <Foundation/Foundation.h>

@protocol ProgramTimerObserver <NSObject>

- (void) programTimerUpdate: (NSString *) text;

@end
