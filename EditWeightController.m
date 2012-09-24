//
//  EditWeightController.m
//  GymApp
//
//  Created by James Dunwoody on 24/09/12.
//
//

#import "EditWeightController.h"

@interface EditWeightController ()

@end

@implementation EditWeightController

@synthesize programDataSource = _programDataSource;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initListValues];
    }
    return self;
}

- (id) init
{
    if (self = [super init]) {
        [self initListValues];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initListValues];
    }
    return self;
}

- (void) initListValues
{
    weightValues = [[NSMutableArray alloc] init];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [weightValues count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat: @"%@ kg", [weightValues objectAtIndex:row]];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.programDataSource.program.currentExercise.currentSet.weight = [weightValues objectAtIndex: row];
    [self.programDataSource notifyProgramChangeObservers];
}

@end