//
//  EditRepViewController.m
//  GymApp
//
//  Created by James Dunwoody on 27/09/12.
//
//

#import "EditRepViewController.h"
#import "RepititionView.h"
#import "EditRepDelegate.h"
#import "EditRestDelegate.h"
#import "EditWeightDelegate.h"
#import "ProgramDataSource.h"

@interface EditRepViewController ()

@end

@implementation EditRepViewController

@synthesize exerciseViewController = _exerciseViewController;
@synthesize set = _set;
@synthesize repPickerView = _repPickerView;
@synthesize restPickerView = _restPickerView;
@synthesize weightPickerView = _weightPickerView;
@synthesize programDatasource = _programDatasource;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id) init
{
    if (self = [super init]) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (void) setup
{
    editRepDelegate = [[EditRepDelegate alloc] init];
    self.repPickerView.dataSource = editRepDelegate;
    self.repPickerView.delegate = editRepDelegate;
    editRepDelegate.set = self.set;
    editRepDelegate.programDataSource = self.programDatasource;
    
    editRestDelegate = [[EditRestDelegate alloc] init];
    self.restPickerView.dataSource = editRestDelegate;
    self.restPickerView.delegate = editRestDelegate;
    editRestDelegate.set = self.set;
    editRestDelegate.programDataSource = self.programDatasource;
    
    editWeightDelegate = [[EditWeightDelegate alloc] init];
    self.weightPickerView.dataSource = editWeightDelegate;
    self.weightPickerView.delegate = editWeightDelegate;
    editWeightDelegate.set = self.set;
    editWeightDelegate.programDataSource = self.programDatasource;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editRep"]) {
        
    }
}
@end