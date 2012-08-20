//
//  CurrentExerciseTableDelegate.m
//  GymApp
//
//  Created by James Dunwoody on 19/08/12.
//
//

#import "CurrentExerciseTableDelegate.h"
#import "Exercise.h"
#import "CurrentSetCell.h"

@implementation CurrentExerciseTableDelegate

@synthesize tableView = _tableView;
@synthesize program = _program;

- (id) initWithTableView: (UITableView *) withTableView
{
    if (self = [super init]) {
        self.tableView = withTableView;
    }
    
    return self;
}

- (NSUInteger)countOfList {
    NSLog(@"count of list %i", [self.program.currentExercise count]);
    return [self.program.currentExercise count];
}

- (Exercise *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.program exerciseAtIndex:theIndex];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self countOfList];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"title for header in section";
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Exercise *current = self.program.currentExercise;
    
    Set *set = (Set *) [current setAtIndex:indexPath.row];
    NSString *cellIdentifier = @"CurrentSetCell";
    
    CurrentSetCell *cell = (CurrentSetCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[CurrentSetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.set = set;
    
    if (set == current.currentSet) {
        cell.completeButton.hidden = false;
    } else {
        cell.completeButton.hidden = true;
        cell.backgroundColor = [UIColor grayColor];
    }
    
    [[cell position] setText: [NSString stringWithFormat:@"%i", indexPath.row +1]];
    [[cell reps] setText: set.reps.stringValue];
    [[cell weight] setText: [NSString stringWithFormat:@"%@kg", set.weight.stringValue]];
    [[cell rest] setText: [NSString stringWithFormat:@"%@s",set.rest.stringValue]];
    
    //    if (exercise.exerciseWeightOrTimeMode == ExerciseWeightMode) {
    //        WeightExercise *weightExercise = (WeightExercise *) exercise;
    //        [[cell reps] setText: [weightExercise repsAsDisplayValue]];
    //        [[cell weight] setText: [weightExercise weightAsDisplayValue]];
    //        cell.weightImage.hidden = false;
    //        cell.repsImage.hidden = true;
    //    } else {
    //        TimeExercise *timeExercise = (TimeExercise *) exercise;
    //        [[cell time] setText: [timeExercise timeAsDisplayValue]];
    //        cell.weightImage.hidden = true;
    //        cell.repsImage.hidden = false;
    //    }
    current = nil;
    cellIdentifier = nil;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    Exercise *exercise = [self objectInListAtIndex:indexPath.row];
    
    //    cell.backgroundColor = self.backgroundColor;
    cell.textLabel.textColor = [UIColor whiteColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 92;
}

//        UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
//        gesture.direction = UISwipeGestureRecognizerDirectionRight;
//        [cell.contentView addGestureRecognizer:gesture];

//    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
////    [gesture setDirection: (UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight)];
//    gesture.direction = UISwipeGestureRecognizerDirectionRight;
//    [tableView addGestureRecognizer:gesture];
//

//-(void)didSwipe:(UISwipeGestureRecognizer *)recognizer {
//
//    //    if (recognizer.state == UIGestureRecognizerStateEnded) {
//    //        CGPoint swipeLocation = [recognizer locationInView:self.tableView];
//    //        NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
//    //
//    //        //        ExerciseCell *cell = (ExerciseCell *)[self.tableView cellForRowAtIndexPath:swipedIndexPath];
//    //
//    //        Exercise *exercise = [self.dataController objectInListAtIndex:swipedIndexPath.row];
//    //        exercise.superSet = YES;
//    //    }
//
//    CGPoint swipeLocation = [recognizer locationInView:self.tableView];
//    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
//
//    Exercise *exercise = [self.dataController objectInListAtIndex:swipedIndexPath.row];
//    ExerciseCell *cell = (ExerciseCell *)[self.tableView cellForRowAtIndexPath:swipedIndexPath];
//
//    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
//        [self makeSuperSetWithCell: cell withExercise: exercise];
//    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
//        [self makeNormalSetWithCell: cell withExercise: exercise];
//    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
//        NSLog(@"unknown direction down");
//    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
//        NSLog(@"unknown direction up");
//    } else {
//        NSLog(@"unknown direction");
//    }
//}

//- (void) makeSuperSetWithCell: (ExerciseCell *)cell withExercise: (Exercise *)exercise
//{
//    cell.backgroundColor = [UIColor purpleColor];
//    exercise.superSet = YES;
//}
//
//- (void) makeNormalSetWithCell: (ExerciseCell *)cell withExercise: (Exercise *)exercise
//{
//    cell.backgroundColor = [UIColor whiteColor];
//    exercise.superSet = NO;
//}

//        [[cell sets] setText: [NSString stringWithFormat:@"%d", exercise.sets]];
//    [[cell category] setText: exercise.isSingle ? @"Single" : @"Super"];
//        cell.indentationLevel = 50;
//        cell.indentationWidth = 50;


//    if (exercise.isAdd) {
//        static NSString *CellIdentifier = @"AddExerciseCell";
//        AddExerciseCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//
//        [[cell exercisePicker] setDelegate:self];
//        [[cell exercisePicker] setDataSource:self];
//
//        //        NSString *valueAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
//        //        [[cell category] setText: @"exercise category"];
//        //        [[cell exerciseLabel] setText:@"exercise label"];
//
//        return cell;
//
//    } else {
//        @property NSString *type;
//        Exercise *exercise = [self.dataController objectInListAtIndex:indexPath.row];
//        [[cell reps] setText: [NSString stringWithFormat:@"%d" exercise.reps]];
//        [[cell bodyPart] setText: exercise.bodyPart];
//        [cell sizeToFit];
//        cell.backgroundColor = [UIColor redColor];
//        cell.backgroundColor = [UIColor colorWithRed:172.0/255.0 green:173.0/255.0 blue:175.0/255.0 alpha:1.0];
//        [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop]
//    NSIndexPath *selectedIndex = [tableView indexPathForSelectedRow];
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
//        [self.program removeExerciseAtIndex:indexPath.row];
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//-(void) addExerciseWithExercise:(Exercise *)exercise
//{
//    [self.program addExercise:exercise];
//}

//-(void) deleteWithIndexPaths: (NSArray *)indexPaths
//{
//    for (NSIndexPath *path in indexPaths) {
//        [self.program removeExerciseAtIndex:path.row];
//    }
//}

//-(void) updateRowWithExercise: (Exercise *) exercise withRow: (NSInteger) row
//{
//    [self.program updateExerciseAtIndex:row withObject:exercise];
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

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    return UITableViewCellEditingStyleInsert;
    return UITableViewCellEditingStyleDelete;
}

@end
