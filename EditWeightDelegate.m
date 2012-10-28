//
//  EditWeightDelegate.m
//  GymApp
//
//  Created by James Dunwoody on 2/10/12.
//
//

#import "EditWeightDelegate.h"
#import "ProgramDataSource.h"
#import "Set.h"

@implementation EditWeightDelegate
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
    weightValues = [[NSMutableArray alloc] init];
    for (NSUInteger i = 1; i <= 20; i++) {
        [weightValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
    for (NSUInteger i = 30; i <= 100; i+=10) {
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
    self.set.weight = [NSNumber numberWithInteger:[[weightValues objectAtIndex: row] integerValue]];
    [self.programDataSource notifyProgramChangeObservers];
}

- (int) indexOfSet: (Set *) set
{
    return [weightValues indexOfObject: [set.weight stringValue]];
}

@end
