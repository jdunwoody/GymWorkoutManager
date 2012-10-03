//
//  EditWeightDelegate.m
//  GymApp
//
//  Created by James Dunwoody on 2/10/12.
//
//

#import "EditWeightDelegate.h"
#import "ProgramDataSource.h"

@implementation EditWeightDelegate
@synthesize programDataSource = _programDataSource;

- (id) init
{
    if (self = [super init]) {
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
    return [weightValues objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.programDataSource.program.currentExercise.currentSet.weight = [NSNumber numberWithInteger:[[weightValues objectAtIndex: row] integerValue]];
    [self.programDataSource notifyProgramChangeObservers];
}


@end
