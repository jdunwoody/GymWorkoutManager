//
//  ExerciseViewController.h
//  SampleMultiview
//
//  Created by James on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExerciseDataController.h"

@interface ExerciseViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIPickerView *exercisePicker;
    NSArray *exercises;
    NSMutableArray *reps;
    NSMutableArray *sets;
    NSMutableArray *weight;
    NSArray *bodyPart;
    NSArray *intensity;
    NSMutableArray *rest;
}


@property (strong, nonatomic) ExerciseDataController *dataController;

@end
