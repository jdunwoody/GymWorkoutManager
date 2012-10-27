//
//  Utils.h
//  GymApp
//
//  Created by James Dunwoody on 15/09/12.
//
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (int) windowWidth;
+ (int) windowHeight;
+ (BOOL) isLandscape;
+ (int) statusBarHeight;
+ (NSString *) currentDateString;

@end
