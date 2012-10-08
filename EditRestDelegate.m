//
//  EditRestDelegate.m
//  GymApp
//
//  Created by James Dunwoody on 2/10/12.
//
//

#import "EditRestDelegate.h"
#import "ProgramDataSource.h"

@implementation EditRestDelegate

@synthesize programDataSource = _programDataSource;
@synthesize set = _set;

- (id) init
{
    if (self = [super init]) {
        [self initListValues];
    }
    return self;
}

- (void) initListValues
{
    minuteValues = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i <= 59; i++) {
        [minuteValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
    secondValues = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i <= 59; i++) {
        [secondValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return component == 0 ? [minuteValues count] : [secondValues count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [component == 0 ? minuteValues : secondValues objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *minutes = [minuteValues objectAtIndex: [pickerView selectedRowInComponent:0]];
    NSString *seconds = [secondValues objectAtIndex: [pickerView selectedRowInComponent:1]];
    self.set.rest = [NSNumber numberWithInteger:[minutes integerValue] * 60 + [seconds integerValue]];
    [self.programDataSource notifyProgramChangeObservers];
}

- (int) indexOfSet: (Set *) set
{
    return [minuteValues indexOfObject: [set.rest stringValue]];
}

@end
