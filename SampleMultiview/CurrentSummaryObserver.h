//
//  CurrentSummaryObserver.h
//  GymApp
//
//  Created by James Dunwoody on 15/09/12.
//
//

#import <Foundation/Foundation.h>

@protocol CurrentSummaryObserver <NSObject>

- (void) currentSummaryChanged: (NSString *)value;

@end
