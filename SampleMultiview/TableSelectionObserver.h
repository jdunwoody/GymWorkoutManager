//
//  TableSelectionObserver.h
//  GymApp
//
//  Created by James Dunwoody on 22/09/12.
//
//

#import <Foundation/Foundation.h>
#import "Exercise.h"

@protocol TableSelectionObserver <NSObject>

- (void) selected: (Exercise *)exercise;
@end
