//
//  PopoverPresentable.h
//  GymApp
//
//  Created by James Dunwoody on 26/09/12.
//
//

#import <Foundation/Foundation.h>

@class RepititionView;

@protocol PopoverPresentable <NSObject>
- (void) showPopoverWithView: (RepititionView *)view;

@end
