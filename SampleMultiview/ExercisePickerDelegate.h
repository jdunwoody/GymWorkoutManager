//
//  ExercisePickerDelegate.h
//  SampleMultiview
//
//  Created by James on 1/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"
#import "ExercisePickerControllerProtocol.h"

typedef enum  {
    WEIGHT = 6,
    INTENSITY = 5,
    REST = 4,
    SETS = 3,
    BODYPART = 2,
    REPS = 1,
    NAME = 0
} ExercisePickerComponents;

//@class ExerciseViewControllerProtocol;

@interface ExercisePickerDelegate : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *nameValues;
    NSMutableArray *repValues;
    NSMutableArray *setValues;
    NSMutableArray *weightValues;
    NSArray *bodyPartValues;
    NSArray *intensityValues;
    NSMutableArray *restValues;
    
    id<ExercisePickerControllerProtocol> controller;

}
-(id) initWithWithController:(id<ExercisePickerControllerProtocol>) controller;
-(Exercise *) selectedPickerExercise;
-(NSString *) selectedPickerValueForExercise;
-(CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
-(void) randomiseBodyPart:(id)sender;
-(void) randomiseExercise:(id)sender;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

@property (weak, nonatomic) IBOutlet UIPickerView *exerciseComponentPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *categoryButton;

@end

