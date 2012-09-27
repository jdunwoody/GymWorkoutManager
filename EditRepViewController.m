//
//  EditRepViewController.m
//  GymApp
//
//  Created by James Dunwoody on 27/09/12.
//
//

#import "EditRepViewController.h"

@interface EditRepViewController ()

@end

@implementation EditRepViewController

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
    repValues = [[NSMutableArray alloc] init];
    for (NSUInteger i = 1; i <= 20; i++) {
        [repValues addObject:[NSString stringWithFormat:@"%d", i]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //    [self.pickerView selectRow:[self.pickerView selectedRowInComponent:0] inComponent:0 animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    self.programDataSource.program.currentExercise.currentSet.weight = [repValues objectAtIndex: row];
    [self.programDataSource notifyProgramChangeObservers];
}

@end