//
//  FullProgramViewController.m
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import "FullProgramViewController.h"
#import "LoadProgramViewController.h"

@interface FullProgramViewController ()

@end

@implementation FullProgramViewController

@synthesize programDelegate = _programDelegate;
@synthesize programDatasource = _programDatasource;
@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self.programDatasource;
    self.tableView.delegate = self.programDelegate;
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated
{
    if ([self.programDatasource.program exerciseCount] == 0) {
        [self performSegueWithIdentifier:@"loadProgram" sender:self];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) programChanged
{
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"loadProgram"]) {
        
        LoadProgramViewController *destination = segue.destinationViewController;
        destination.programDataSource = self.programDatasource;
        destination.observer = self;
    }
}

- (IBAction)addExercise:(id)sender
{
    [self.programDatasource.program addExercise];
    [self programChanged];
}

@end
