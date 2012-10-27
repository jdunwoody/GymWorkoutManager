//
//  Colours.h
//  GymApp
//
//  Created by James Dunwoody on 26/10/12.
//
//

#import <Foundation/Foundation.h>

@interface Colours

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;

+ (UIColor *) tableCellBackgroundColour;
+ (UIColor *) tableCellForegroundColour;
+ (UIColor *) tableCellCurrentBackgroundColour;
+ (UIColor *) tableCellCurrentForegroundColour;
+ (UIColor *) tableCellMinorColour;

@end