//
//  TimerAlertDelegate.h
//  GymApp
//
//  Created by James on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TimerAlertDelegate <NSObject>
- (void) timerAlert;
- (void) timerWarning;

- (void) updateLabelWithText: (NSString *) text;
@end
