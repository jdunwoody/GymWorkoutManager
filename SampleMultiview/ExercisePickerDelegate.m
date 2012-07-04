//
//  ExercisePickerDelegate.m
//  SampleMultiview
//
//  Created by James on 1/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExercisePickerDelegate.h"
#import "Exercise.h"
#import "ExerciseViewController.h"

@implementation ExercisePickerDelegate
@synthesize categoryButton = _categoryButton;
@synthesize exerciseComponentPicker = _exerciseComponentPicker;

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
        for (NSUInteger i = 0; i < 20; i++) {
            [setValues addObject:[NSString stringWithFormat:@"%d", i]];
        }
        
        repValues = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < 20; i++) {
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
    }
    return self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 7;
}

-(Exercise *) selectedPickerExercise
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    NSString *selectedName = [self selectedPickerValueForExercise];
    NSString *selectedReps = [repValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:REPS]];
    NSString *selectedWeight = [weightValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:WEIGHT]];
    NSString *selectedRest = [restValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:REST]];
    NSString *selectedBodyPart = [bodyPartValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:BODYPART]];
    NSString *selectedIntensity = [intensityValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:INTENSITY]];
    NSString *selectedCategory = [self.categoryButton titleForSegmentAtIndex:[self.categoryButton selectedSegmentIndex]];
    
    Exercise *exercise = [[Exercise alloc] init];
    exercise.name = selectedName;
    exercise.reps = [numberFormatter numberFromString: selectedReps];
    exercise.rest = selectedRest;
    exercise.weight = [numberFormatter numberFromString:selectedWeight];
    exercise.bodyPart = selectedBodyPart;
    exercise.intensity = selectedIntensity;
    
    exercise.category = selectedCategory;
    
    return exercise;
}

-(NSString *) selectedPickerValueForExercise
{
    return [nameValues objectAtIndex:[self.exerciseComponentPicker selectedRowInComponent:NAME]];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    switch(component) {
        case NAME: return 150.0f;
        case REPS: return 44.0f;
        case BODYPART: return 150.0f;
        case SETS: return 44.0f;
        case REST: return 88.0f;
        case INTENSITY: return 200.0f;
        case WEIGHT: 
        default: return 88.0f;
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case WEIGHT:
            return weightValues.count;
        case INTENSITY:
            return intensityValues.count;
        case REST:
            return restValues.count;
        case SETS:
            return setValues.count;
        case BODYPART:
            return bodyPartValues.count;
        case REPS:
            return repValues.count;
        case NAME:
        default:
            return nameValues.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case WEIGHT:
            return [weightValues objectAtIndex:row];
        case INTENSITY:
            return [intensityValues objectAtIndex:row];
        case REST:
            return [restValues objectAtIndex:row];
        case SETS:
            return [setValues objectAtIndex:row];
        case BODYPART:
            return [bodyPartValues objectAtIndex:row];
        case REPS:
            return[repValues objectAtIndex:row];
        case NAME:
        default:
            return [nameValues objectAtIndex:row];
    }
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

@end
