//
//  FullProgramViewController.m
//  GymApp
//
//  Created by James Dunwoody on 1/09/12.
//
//

#import "FullProgramViewController.h"
#import "FullProgramTableDelegate.h"
#import "FullProgramDataSource.h"

@interface FullProgramViewController ()

@end

@implementation FullProgramViewController

@synthesize exercise = _exercise;
@synthesize reps = _reps;
@synthesize rest = _rest;
@synthesize weight = _weight;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    self.tableView.delegate = [[FullProgramTableDelegate alloc] init];
    //    self.tableView.dataSource = [[FullProgramDataSource alloc] init];
}

- (void)viewDidUnload
{
    [self setExercise:nil];
    [self setWeight:nil];
    [self setReps:nil];
    [self setRest:nil];
    //    [self setTableView:nil];
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
