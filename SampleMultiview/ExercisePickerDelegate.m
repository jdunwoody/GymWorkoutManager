//
//  ExercisePickerDelegate.m
//  SampleMultiview
//
//  Created by James on 1/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExercisePickerDelegate.h"
#import "Exercise.h"
#import "ProgramViewController.h"
#import "WeightExercise.h"

@implementation ExercisePickerDelegate
@synthesize categoryButton = _categoryButton;
@synthesize exerciseComponentPicker = _exerciseComponentPicker;
@synthesize exerciseWeightOrTimeMode = _exerciseWeightOrTimeMode;

-(id) initWithWithController:(id<ExercisePickerControllerProtocol>) newController
{
    if (self = [super init]) {
        controller = newController;
        
        nameValues = [[NSMutableArray alloc] initWithObjects:@"O/H", @"Fly", @"Press up", @"Sit up", @"Burpee", @"Star jump", @"Bicup curls", @"Squats", @"Other", nil];
        [nameValues sortUsingSelector:@selector(compare:)];
        
        bodyPartValues = [[NSMutableArray alloc] initWithObjects:@"Full body",@"Legs",@"Arms",@"Core",@"Bicep", @"Tricep", @"Shoulder", @"Abs", @"Thigh", @"Hamstring", @"Calf", nil];
        [bodyPartValues sortUsingSelector:@selector(compare:)];
        
        intensityValues = [[NSMutableArray alloc] initWithObjects:@"Aerobic Light", @"Aerobic Medium", @"Aerobic Intense", @"Anaerobic Light", @"Anaerobic Medium", @"Anaerobic Intense", nil];
        
        setValues = [[NSMutableArray alloc] init];
        for (NSUInteger i = 1; i < 20; i++) {
            [setValues addObject:[NSString stringWithFormat:@"%d", i]];
        }
        
        repValues = [[NSMutableArray alloc] init];
        for (NSUInteger i = 1; i < 20; i++) {
            [repValues addObject:[NSString stringWithFormat:@"%d", i]];
        }
        for (NSUInteger i = 25; i <= 50; i+=5) {
            [repValues addObject:[NSString stringWithFormat:@"%d", i]];
        }
        
        restValues = [NSMutableArray arrayWithObjects:@"10", @"20", @"30", nil];
        for (NSUInteger i = 1; i <= 20; i++) {
            [restValues addObject:[NSString stringWithFormat:@"%d", i]];
        }
        
        weightValues = [[NSMutableArray alloc]init ];
        for (NSUInteger i = 1; i <= 20; i++) {
            [weightValues addObject:[NSString stringWithFormat:@"%d", i]];
        }
        for (NSUInteger i = 25; i < 50; i+=5) {
            [weightValues addObject:[NSString stringWithFormat:@"%d", i]];
        }
        for (NSUInteger i = 50; i <= 150; i+=10) {
            [weightValues addObject:[NSString stringWithFormat:@"%d", i]];
        }
        
        timeValues = [[NSMutableArray alloc] init];
        for (NSUInteger i = 1; i <= 20; i++) {
            [timeValues addObject: [NSString stringWithFormat:@"%d", i]];
        }
    }
    return self;
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.exerciseWeightOrTimeMode ==  ExerciseWeightMode ? 7 : 5;
}

-(Exercise *) selectedPickerExercise
{
    //    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    NSString *selectedName = [self selectedPickerValueForExercise];
    NSString *selectedBodyPart = [bodyPartValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:BODYPART]];
    NSString *selectedRest = [restValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:REST]];
    //    NSString *selectedIntensity = [intensityValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:INTENSITY]];
    //    NSString *selectedCategory = [self.categoryButton titleForSegmentAtIndex:[self.categoryButton selectedSegmentIndex]];
    
    NSString *selectedReps = nil;
    NSString *selectedWeight = nil;
    NSString *selectedTime = nil;
    
    if (self.exerciseWeightOrTimeMode == ExerciseWeightMode) {
        selectedReps = [repValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:REPS]];
        selectedWeight = [weightValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:WEIGHT]];
        
    } else {
        selectedTime = [timeValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:TIME]];
    }
    
    Exercise *exercise =nil;
    if (self.exerciseWeightOrTimeMode == ExerciseWeightMode) {
        exercise = [[WeightExercise alloc] init];
        //        WeightExercise *weightExercise = (WeightExercise *) exercise;
        
        //        weightExercise.reps = [numberFormatter numberFromString: selectedReps];
        //        weightExercise.weight = [numberFormatter numberFromString:selectedWeight];
    } else {
        //        exercise = [[TimeExercise alloc] init];
        //        TimeExercise *timeExercise = (TimeExercise *) exercise;
        //        timeExercise.time = [numberFormatter numberFromString: selectedTime];
    }
    exercise.name = selectedName;
    exercise.rest = selectedRest;
    exercise.bodyPart = selectedBodyPart;
    //    exercise.intensity = selectedIntensity;
    
    //    exercise.category = selectedCategory;
    
    return exercise;
}

-(NSString *) selectedPickerValueForExercise
{
    return [nameValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:NAME]];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    switch(component) {
        case NAME: return 120.0f;
        case BODYPART: return 130.0f;
        case INTENSITY: return 160.0f;
        case REST: return 88.0f;
    }
    if (self.exerciseWeightOrTimeMode == ExerciseWeightMode) {
        switch(component) {
            case SETS: return 80.0f;
            case REPS: return 80.0f;
            case WEIGHT: return 88.0f;
        }
    } else {
        switch(component) {
            case TIME: return 88.0f;
        }
    }
    return (NSInteger)0;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case NAME:
            return nameValues.count;
        case BODYPART:
            return bodyPartValues.count;
        case INTENSITY:
            return intensityValues.count;
        case REST:
            return restValues.count;
    }
    
    if (self.exerciseWeightOrTimeMode == ExerciseWeightMode) {
        switch (component) {
            case SETS:
                return setValues.count;
            case REPS:
                return repValues.count;
            case WEIGHT:
                return weightValues.count;
        }
        
    } else {
        switch (component) {
            case TIME:
                return timeValues.count;
        }
    }
    return (NSInteger)0;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self textForRow:row forComponent: component];
}

- (NSString *)textForRow: (NSInteger) row forComponent:(NSInteger) component
{
    switch (component) {
        case NAME:
            return [nameValues objectAtIndex:row];
        case BODYPART:
            return [bodyPartValues objectAtIndex:row];
        case INTENSITY:
            return [intensityValues objectAtIndex:row];
        case REST:
            return [NSString stringWithFormat:@"%@ min", [restValues objectAtIndex:row]];
    }
    
    if (self.exerciseWeightOrTimeMode == ExerciseWeightMode) {
        switch (component) {
            case SETS:
                return [NSString stringWithFormat:@"%@ sets", [setValues objectAtIndex:row]];
            case REPS:
                return [NSString stringWithFormat:@"%@ reps", [repValues objectAtIndex:row]];
            case WEIGHT:
                return [NSString stringWithFormat:@"%@ kg", [weightValues objectAtIndex:row]];
        }
        
    } else {
        switch (component) {
            case TIME:
                return [NSString stringWithFormat:@"%@ min", [timeValues objectAtIndex:row]];
        }
    }
    
    return nil;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* tView = (UILabel*)view;
    if (!tView){
        tView = [[UILabel alloc] init];
        // Setup label properties - frame, font, colors etc
        tView.textColor = [UIColor blackColor];
    }
    // Fill the label text here
    tView.text = [self textForRow: row forComponent: component];
    return tView;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [controller updateSelectedRow];
}

- (void)randomiseBodyPart:(id)sender {
    [self randomisePickerComponentWithComponentId: BODYPART withValues: bodyPartValues];
}

- (void)randomiseExercise:(id)sender {
    [self randomisePickerComponentWithComponentId: NAME withValues: nameValues];
}

- (void)randomiseIntensity:(id)sender {
    [self randomisePickerComponentWithComponentId: INTENSITY withValues: intensityValues];
}

- (void)randomiseRest:(id)sender {
    [self randomisePickerComponentWithComponentId: REST withValues: restValues];
}

- (void)randomiseWeight:(id)sender {
    [self randomisePickerComponentWithComponentId: WEIGHT withValues: weightValues];
}

- (void)randomiseReps:(id)sender {
    [self randomisePickerComponentWithComponentId: REPS withValues: repValues];
}

- (void)randomiseSets:(id)sender {
    [self randomisePickerComponentWithComponentId: SETS withValues: setValues];
}

-(void) randomisePickerComponentWithComponentId: (int) component withValues: (NSArray *)values
{
    int randomIndex = arc4random() % values.count;
    [self.exerciseComponentPicker selectRow:randomIndex inComponent:component animated:YES];
    
    [controller updateSelectedRow];
}

- (void) addNameWithName: (NSString *)newName
{
    [nameValues addObject:[newName capitalizedString]];
    [nameValues sortUsingSelector:@selector(compare:)];
    [self.exerciseComponentPicker reloadComponent:NAME];
}

- (void) addBodyPartWithBodyPart: (NSString *)newBodyPart
{
    [bodyPartValues addObject:[newBodyPart capitalizedString]];
    [bodyPartValues sortUsingSelector:@selector(compare:)];
    [self.exerciseComponentPicker reloadComponent:BODYPART];
}

- (void) weightOrTimeChosen: (ExerciseWeightOrTimeMode) exerciseWeightOrTimeMode
{
    self.exerciseWeightOrTimeMode = exerciseWeightOrTimeMode;
    [self.exerciseComponentPicker reloadAllComponents];
}

@end
