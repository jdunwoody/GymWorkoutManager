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

@implementation ProgramDelegate

@synthesize programDataSource = _programDataSource;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.programDataSource.program exerciseCount]) {
        NSString *cellIdentifier = @"addExercise";
        
        AddExerciseCell *cell = (AddExerciseCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            cell = [[AddExerciseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        return cell;
    } else {
        Exercise *exercise = [self.programDataSource.program exerciseAtIndex:indexPath.row];
        NSString *cellIdentifier = @"weightExercise";
        
        FullExerciseCell *cell = (FullExerciseCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            cell = [[FullExerciseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
                
        [[cell name] setText: exercise.name];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

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
