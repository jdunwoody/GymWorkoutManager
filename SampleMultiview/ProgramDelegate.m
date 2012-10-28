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
#import "Colours.h"

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
    
    //    for (Set *set in exercise.sets) {
    //        RepititionView *just = [[RepititionView alloc] initWithFrame:CGRectMake([cell.setsScrollView.subviews count] * 50, 0, 50, 50) withNibName: @"SmallRepitition"];
    //        just.reps.text = [set.reps stringValue];
    //        just.rest.text = [set.rest stringValue];
    //        just.weight.text = [set.weight stringValue];
    //
    //        [cell.setsScrollView addSubview: just];
    //    }
    
    cell.exercise = exercise;
    cell.name.text = exercise.name;
    
    if ([self.programDataSource.program isIndexOfCurrentExercise: indexPath]) {
        cell.name.textColor = [Colours tableCellCurrentForegroundColour];
        cell.container.backgroundColor = [Colours tableCellCurrentBackgroundColour];
    } else {
        cell.name.textColor = [Colours tableCellForegroundColour];
        cell.container.backgroundColor = [Colours tableCellBackgroundColour];
    }
    
    cell.container.layer.cornerRadius = 4.0f;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView scrollToRowAtIndexPath: indexPath atScrollPosition: UITableViewScrollPositionMiddle animated: YES];
    
    [self.programDataSource.program setCurrentExerciseIsAtIndex: indexPath.row];
    [self.programDataSource notifyProgramChangeObservers];
}

@end