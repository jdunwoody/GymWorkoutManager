

#import "EditRepUIPickerViewController.h"

#import "EditRepViewController.h"
#import "RepititionView.h"
#import "EditRepDelegate.h"
#import "EditRestDelegate.h"
#import "EditWeightDelegate.h"
#import "ProgramDataSource.h"
#import "ExerciseDetailViewController.h"

@interface EditRepUIPickerViewController ()

@end

@implementation EditRepUIPickerViewController

@synthesize exerciseViewController = _exerciseViewController;
@synthesize set = _set;
@synthesize pickerView = _pickerview;
@synthesize programDatasource = _programDatasource;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //        [self setup];
    }
    return self;
}

- (id) init
{
    if (self = [super init]) {
        //        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        //        [self setup];
    }
    return self;
}

- (void) setup
{
    editRepDelegate = [[EditRepDelegate alloc] init];
    self.pickerView.dataSource = editRepDelegate;
    self.pickerView.delegate = editRepDelegate;
    editRepDelegate.set = self.set;
    editRepDelegate.programDataSource = self.programDatasource;
    
    [self.pickerView selectRow: [editRepDelegate indexOfSet: self.set] inComponent:0 animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
    
    //    [self.pickerView selectRow: 4 inComponent:0 animated:NO];
    
    //    [self.pickerView selectRow:[repValues indexOfObject:self.repititionView.reps.text] inComponent:0 animated:NO];
    
    //    [self.pickerView selectRow:[self.pickerView selectedRowInComponent:5] inComponent:0 animated:YES];
}

@end
