//
//  LoadProgramViewController.m
//  GymApp
//
//  Created by James Dunwoody on 10/08/12.
//
//

#import "LoadProgramViewController.h"
#import "Program.h"
#import "WeightExercise.h"
#import "LoadProgramCell.h"
#import "Set.h"
#import "LoadProgramTableDataSource.h"
#import "LoadProgramTableDelegate.h"
#import "CurrentUIViewController.h"

@implementation LoadProgramViewController

@synthesize tableView = _tableView;
//@synthesize delegate = _delegate;
@synthesize tableDelegate = _tableDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableDataSource = [[LoadProgramTableDataSource alloc] init];
    self.tableView.dataSource = self.tableDataSource;
    
    self.tableDelegate = [[LoadProgramTableDelegate alloc] initWithDataSource:self.tableDataSource withViewObserver: self];
    self.tableView.delegate = self.tableDelegate;
    
    //    program = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.view.superview.frame = CGRectMake(0,0,350,400);    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    //        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    //    } else {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
    //    }
}

- (void) programLoadedWithProgram:(Program *) withProgram
{
    [self dismissModalViewControllerAnimated:YES];
    
    [self.observer programLoadedWithProgram: withProgram];
}

- (IBAction)newProgramChosen:(id)sender {
    //    Program *program = [self makeExampleProgramWithName:[self currentDateString]];
    //    [(CurrentViewController *) self.presentingViewController programLoadedWithProgram:program];
}

//    Program *program = [[Program alloc] initWithName:[self currentDateString]];
//    self.delegate.program = program;
//    CurrentViewController *currentViewController = (CurrentViewController *)self.presentingViewController;
//    currentViewController.program = program;
//    [self.delegate programLoadedWithProgram:program];

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

@end

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Program *program = (Program *)[self objectInListAtIndex:indexPath.row];
//    cell.textLabel.textColor = [UIColor whiteColor];
//    cell.backgroundColor = [UIColor brownColor];
//
//}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Exercise *exercise = [self.dataController objectInListAtIndex:indexPath.row];
//
//    if (exercise.isAdd) {
//        return tableView.rowHeight;
//    } else {
//        return 92;
//    }
//}

//
//-(void) addExerciseWithName:(NSString *)name withReps: (NSString *)reps withRest: (NSString *)rest withWeight: (NSString *)weight withBodyPart: (NSString *)selectedBodyPart withIntensity:(NSString *)selectedIntensity withCategory:(NSString *)selectedCategory
//{
//    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
//
//    Exercise *exercise = [[Exercise alloc] init];
//    exercise.name = name;
//    exercise.reps = [numberFormatter numberFromString: reps];
//    exercise.rest = rest;
//    exercise.weight = [numberFormatter numberFromString:weight];
//    exercise.bodyPart = selectedBodyPart;
//    exercise.intensity = selectedIntensity;
//
//    exercise.category = selectedCategory;
//    [self.dataController.exercises addObject:exercise];
//}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleInsert) {
//
//
//    } else if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.dataController.program removeExerciseAtIndex:indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [self.tableView reloadData];
//
//        //        NSLog(@"%d", [self.dataController.exercises count]);
//        //        NSLog(@"%d", [self.tableView numberOfRowsInSection:0]);
//        //        [self.tableView setEditing:FALSE animated:YES];
//
//        //        [self.tableView deleteRowsAtIndexPaths:indexPath withRowAnimation:YES];
//        //        int row = indexPath.row;
//        //        SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[UIApplication sharedApplication] delegate];
//        //        [controller removeObjectFromListAtIndex:indexPath.row];
//        //        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}

//-(void) addExerciseWithExercise:(Exercise *)exercise
//{
//    [self.dataSource.program addExercise:exercise];
//}

//-(void) deleteWithIndexPaths: (NSArray *)indexPaths
//{
//    for (NSIndexPath *path in indexPaths) {
//        [self.dataController.program removeExerciseAtIndex:path.row];
//    }
//}

//-(void) updateRowWithExercise: (Exercise *) exercise withRow: (NSInteger) row
//{
//    [self.dataController.program updateExerciseAtIndex:row withObject:exercise];
//    [self.tableView reloadData];
//}

//-(void) updateRowWithRow: (NSInteger)row withComponent: (NSInteger)component
//{
//    [self.tableView
//}

//- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
//{
//    NSLog(@"Insert rows");
//}
//
//- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
//{
//    NSLog(@"Delete rows");
//}
//
//- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath
//{
//    NSLog(@"Move rows");
//}

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //    return UITableViewCellEditingStyleInsert;
//    return UITableViewCellEditingStyleDelete;
//}
