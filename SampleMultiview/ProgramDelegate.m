//
//  ProgramDelegate.m
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//

#import "ProgramDelegate.h"
#import "Exercise.h"
#import "FullExerciseCell.h"
#import "AddExerciseCell.h"
#import "NormalExerciseCell.h"
#import "TableSelectionObserver.h"
#import "RepititionView.h"

@implementation ProgramDelegate

@synthesize programDataSource = _programDataSource;
@synthesize tableSelectionObserver = _tableSelectionObserver;

- (id) initWithTableSelectionObserver:(id<TableSelectionObserver>) tableSelectionObserver
{
    self = [super init];
    if (self) {
        self.tableSelectionObserver = tableSelectionObserver;
    }
    return self;
}

- (id) init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Exercise *exercise = [self.programDataSource.program exerciseAtIndex:indexPath.row];
    NSString *cellIdentifier = @"exerciseCell";
    
    NormalExerciseCell *cell = (NormalExerciseCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[NormalExerciseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    for (UIView *view in [cell.setsScrollView subviews]) {
        [view removeFromSuperview];
    }
    
    for (Set *set in exercise.sets) {
        RepititionView *just = [[RepititionView alloc] initWithFrame:CGRectMake([cell.setsScrollView.subviews count] * 48, 0, 48, 30)];
        just.reps.text = set.reps.stringValue;
        just.rest.text = [NSString stringWithFormat: @"%@ sec", set.rest];
        
        [cell.setsScrollView addSubview: just];
    }
    
    cell.exercise = exercise;
    [[cell name] setText: exercise.name];
    
    return cell;
}
//        UILabel *setLabel;
//        UILabel *lastLabel = nil;
//        setLabel = [[UILabel alloc] init];
//        setLabel.text = set.reps.stringValue;
//        setLabel.frame = CGRectMake(lastLabel.frame.origin.x + lastLabel.frame.size.width + 20,
//                                    lastLabel.frame.origin.y,
//                                    48, //lastLabel.frame.size.width,
//                                    48); //lastLabel.frame.size.height);
//

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.programDataSource.program setCurrentExerciseIsAtIndex: indexPath.row];
    NSLog(@"Current exercise %@", self.programDataSource.program.currentExercise.name);
    [self.programDataSource notifyProgramChangeObservers];
}

//- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
//{
//    [self.programDetailNotifiable showProgramDetailWithExericise:[self.programDataSource.program exerciseAtIndex:indexPath.row]];
//}

@end

//    [[cell rest] setText: [exercise restAsDisplayValue]];
//    [[cell bodyPart] setText: exercise.bodyPart];
//
//    WeightExercise *weightExercise = (WeightExercise *) exercise;
//    [[cell reps] setText: [weightExercise repsAsDisplayValue]];
//    [[cell weight] setText: [weightExercise weightAsDisplayValue]];
//    cell.weightImage.hidden = false;
//    cell.repsImage.hidden = true;
//

//    if (exercise == current) {
//        cell.currentExerciseIndicator.hidden = NO;
//    } else {
//        cell.currentExerciseIndicator.hidden = YES;
//    }
