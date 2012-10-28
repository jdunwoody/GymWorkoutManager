//
//  EditWeightUIPickerViewController.m
//  GymApp
//
//  Created by James Dunwoody on 6/10/12.
//
//

#import "EditWeightUIPickerViewController.h"

#import "EditRepViewController.h"
#import "RepititionView.h"
#import "EditRepDelegate.h"
#import "EditRestDelegate.h"
#import "EditWeightDelegate.h"
#import "ProgramDataSource.h"

@interface EditWeightUIPickerViewController ()

@end

@implementation EditWeightUIPickerViewController

@synthesize exerciseViewController = _exerciseViewController;
@synthesize set = _set;
@synthesize pickerView = _pickerView;
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
    editWeightDelegate = [[EditWeightDelegate alloc] init];
    self.pickerView.dataSource = editWeightDelegate;
    self.pickerView.delegate = editWeightDelegate;
    editWeightDelegate.set = self.set;
    editWeightDelegate.programDataSource = self.programDatasource;
    
    [self.pickerView selectRow: [editWeightDelegate indexOfSet: self.set] inComponent:0 animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

@end
