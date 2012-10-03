//
//  EditNameViewController.m
//  GymApp
//
//  Created by James Dunwoody on 24/09/12.
//
//

#import "EditNameViewController.h"
#import "ExerciseViewController.h"

@interface EditNameViewController ()

@end

@implementation EditNameViewController

@synthesize programDataSource = _programDataSource;
@synthesize exerciseViewController = _exerciseViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self initListValues];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.pickerView selectRow: [nameValues indexOfObject: self.exerciseViewController.name.text] inComponent:0 animated:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) initListValues
{
    nameValues = [NSMutableArray arrayWithArray: Exercise.nameValues];
 }

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [nameValues count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [nameValues objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.programDataSource.program.currentExercise.name = [nameValues objectAtIndex: row];
    [self.programDataSource notifyProgramChangeObservers];
}

@end