//
//  PopoverPresentable.h
//  GymApp
//
//  Created by James Dunwoody on 26/09/12.
//
//

#import <Foundation/Foundation.h>
#import "Set.h"
#import "EditExerciseComponentController.h"

@protocol PopoverPresentable <NSObject>

- (void) showRestPopoverWithView: (UIView *)view withSet: (Set *) set;
- (void) showRepPopoverWithView: (UIView *)view withSet: (Set *) set;
- (void) showWeightPopoverWithView: (UIView *)view withSet: (Set *) set;
- (void) showPopover: (id<EditExerciseComponentController>) viewController withView: (UIView *) targetView withSet: (Set *) set;

@end
