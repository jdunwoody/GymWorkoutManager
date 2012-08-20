//
//  LoadProgramViewController.m
//  GymApp
//
//  Created by James Dunwoody on 10/08/12.
//
//

#import "LoadProgramViewController.h"
#import "Program.h"
#import "CurrentViewController.h"
#import "WeightExercise.h"
#import "LoadProgramCell.h"
#import "Set.h"

@implementation LoadProgramViewController

@synthesize tableView = _tableView;
@synthesize delegate = _delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    Program *program = [self makeExampleProgramWithName:[self currentDateString]];
//    self.programs = [[NSMutableArray alloc] initWithObjects: program, nil];
    
//    program = nil;
}

- (Program *) makeExampleProgramWithName: (NSString *) name
{
    Program *program = [[Program alloc] initWithName: name];
    
    for (int e=0; e< 10; e++) {
        WeightExercise *exercise = [[WeightExercise alloc] init];
        exercise.name = [NSString stringWithFormat:@"Exercise %i", e + 1];
        exercise.rest = [NSString stringWithFormat:@"%is", e * 20];
        
        for (int s = 0; s < 6; s++) {
            Set *set = [[Set alloc] init];
            set.weight = [NSNumber numberWithInt:(10 - s) * 6];
            set.reps = [NSNumber numberWithInt:2 * s + 10];
            set.rest = [NSNumber numberWithInt:20 - s];
            
            [exercise.sets addObject:set];
        }
        [program addExercise:exercise];
    }

    return program;
}

- (IBAction)newProgramChosen:(id)sender {
    //    Program *program = [[Program alloc] initWithName:[self currentDateString]];
    Program *program = [self makeExampleProgramWithName:[self currentDateString]];
    //    self.delegate.program = program;
    
    //    CurrentViewController *currentViewController = (CurrentViewController *)self.presentingViewController;
    //    currentViewController.program = program;
    [(CurrentViewController *) self.presentingViewController programLoadedWithProgram:program];
    
    //    [self.delegate programLoadedWithProgram:program];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

- (NSString *) currentDateString
{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Australia/Melbourne"]];
    return [formatter stringFromDate:now];
}

- (NSUInteger)countOfList {
    return [self.programs count];
}

- (Program *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.programs objectAtIndex:theIndex];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self countOfList];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    Program *program = [self objectInListAtIndex:indexPath.row];
    [(CurrentViewController *) self.presentingViewController programLoadedWithProgram:program];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Program *program = [self objectInListAtIndex:indexPath.row];
    NSString *cellIdentifier = @"programCell";
    
    LoadProgramCell *cell = (LoadProgramCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[LoadProgramCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [[cell title] setText: program.name];
    cellIdentifier = nil;
    return cell;
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
