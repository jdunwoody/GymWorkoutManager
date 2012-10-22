//
//  EditRepDelegate.m
//  GymApp
//
//  Created by James Dunwoody on 1/10/12.
//
//

#import "EditRepDelegate.h"
#import "ProgramDataSource.h"

@implementation EditRepDelegate

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
    repValues = [[NSMutableArray alloc] init];
    for (NSUInteger i = 1; i <= 20; i++) {
        [repValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [repValues count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [repValues objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.set.reps = [NSNumber numberWithInteger:[[repValues objectAtIndex: row] integerValue]];
    [self.programDataSource notifyProgramChangeObservers];
}

- (int) indexOfSet: (Set *) set
{
    return [repValues indexOfObject: [set.reps stringValue]];
}

@end
