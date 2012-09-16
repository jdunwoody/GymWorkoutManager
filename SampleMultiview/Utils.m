//
//  Utils.m
//  GymApp
//
//  Created by James Dunwoody on 15/09/12.
//
//

#import "Utils.h"

@implementation Utils

+ (int) windowWidth
{
    return [Utils isLandscape] ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height;
}

+ (int) windowHeight
{
    return [Utils isLandscape] ? [[UIScreen mainScreen] bounds].size.height + [Utils statusBarHeight]: [[UIScreen mainScreen] bounds].size.width;
}

+ (BOOL) isLandscape
{
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
}

+ (int) statusBarHeight
{
    UIApplication *application = [UIApplication sharedApplication];
    return MIN(application.statusBarFrame.size.width, application.statusBarFrame.size.height);
}

@end
