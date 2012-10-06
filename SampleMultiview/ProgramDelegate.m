//
//  ProgramDelegate.m
//  GymApp
//
//  Created by James Dunwoody on 16/09/12.
//
//
#import <QuartzCore/QuartzCore.h>

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
        RepititionView *just = [[RepititionView alloc] initWithFrame:CGRectMake([cell.setsScrollView.subviews count] * 50, 0, 50, 50) withNibName: @"SmallRepitition"];
        just.reps.text = [set.reps stringValue];
        just.rest.text = [set.rest stringValue];
        just.weight.text = [set.weight stringValue];
        
        [cell.setsScrollView addSubview: just];
    }
    
    cell.exercise = exercise;
    cell.name.text = exercise.name;
    
    if ([self.programDataSource.program isIndexOfCurrentExercise: indexPath]) {
        cell.name.textColor = [UIColor blueColor];
        cell.container.backgroundColor = [UIColor lightGrayColor];
    } else {
        cell.name.textColor = [UIColor darkGrayColor];
        cell.container.backgroundColor = [UIColor grayColor];
    }
    
    cell.container.layer.cornerRadius = 5.0f;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.programDataSource.program isIndexOfCurrentExercise: indexPath]) {
        return 180;
    }
    
    return 126;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView scrollToRowAtIndexPath: indexPath atScrollPosition: UITableViewScrollPositionMiddle animated: YES];
    
    [self.programDataSource.program setCurrentExerciseIsAtIndex: indexPath.row];
    //    NSLog(@"Current exercise %@", self.programDataSource.program.currentExercise.name);
    [self.programDataSource notifyProgramChangeObservers];
}

@end

//- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
//{
//    [self.programDetailNotifiable showProgramDetailWithExericise:[self.programDataSource.program exerciseAtIndex:indexPath.row]];
//}

//        UILabel *setLabel;
//        UILabel *lastLabel = nil;
//        setLabel = [[UILabel alloc] init];
//        setLabel.text = set.reps.stringValue;
//        setLabel.frame = CGRectMake(lastLabel.frame.origin.x + lastLabel.frame.size.width + 20,
//                                    lastLabel.frame.origin.y,
//                                    48, //lastLabel.frame.size.width,
//                                    48); //lastLabel.frame.size.height);
//

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
