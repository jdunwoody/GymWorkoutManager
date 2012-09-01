//
//  SampleAppDelegate.h
//  SampleMultiview
//
//  Created by James on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OldProgramViewController.h"

@interface GymAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ExerciseTableDelegate *tableDelegate;
@property (strong, nonatomic) ExerciseDataController *dataController;
@property (strong, nonatomic) ExercisePickerDelegate *pickerDelegate;

@end
