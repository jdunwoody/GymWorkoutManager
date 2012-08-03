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
#import "ExerciseWeightOrTimeMode.h"

typedef enum  {
    NAME = 0,
    BODYPART = 1,
    INTENSITY = 2,
    REST = 3,
    SETS = 4,
    REPS = 5,
    WEIGHT = 6,
    TIME = 4
    
} ExercisePickerComponents;

//@class ExerciseViewControllerProtocol;

@interface ExercisePickerDelegate : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *nameValues;
    NSMutableArray *repValues;
    NSMutableArray *setValues;
    NSMutableArray *weightValues;
    NSMutableArray *bodyPartValues;
    NSMutableArray *intensityValues;
    NSMutableArray *restValues;
    NSMutableArray *timeValues;
    
    id<ExercisePickerControllerProtocol> controller;
}

-(id) initWithWithController:(id<ExercisePickerControllerProtocol>) controller;
-(Exercise *) selectedPickerExercise;
-(NSString *) selectedPickerValueForExercise;
-(CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (void) addNameWithName: (NSString *)newName;
- (void) addBodyPartWithBodyPart: (NSString *)newBodyPart;
- (void) weightOrTimeChosen: (ExerciseWeightOrTimeMode) exerciseWeightOrTimeMode;

- (void) randomiseBodyPart:(id)sender;
- (void) randomiseExercise:(id)sender;
- (void) randomiseIntensity:(id)sender;
- (void) randomiseRest:(id)sender;
- (void) randomiseWeight:(id)sender;
- (void) randomiseReps:(id)sender;
- (void) randomiseSets:(id)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *exerciseComponentPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *categoryButton;
@property (nonatomic) ExerciseWeightOrTimeMode exerciseWeightOrTimeMode;

@end

