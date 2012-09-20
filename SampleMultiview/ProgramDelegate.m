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

- (id) initWithProgramDetailNotifier: (id<ProgramDetailNotifiable>) withProgramDetailNotifiable
{
    self = [super init];
    if (self) {
        self.programDetailNotifiable = withProgramDetailNotifiable;
    }
    return self;
}

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
        
        UILabel *setLabel;
        UILabel *lastLabel = nil;
        for (Set *set in exercise.sets) {
            setLabel = [[UILabel alloc] init];
            setLabel.text = set.reps.stringValue;
            setLabel.frame = CGRectMake(lastLabel.frame.origin.x + lastLabel.frame.size.width + 20,
                                        lastLabel.frame.origin.y,
                                        48, //lastLabel.frame.size.width,
                                        48); //lastLabel.frame.size.height);
            [cell.setsScrollView addSubview:setLabel];
            
            lastLabel = setLabel;
        }
        
        cell.exercise = exercise;
        [[cell name] setText: exercise.name];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self.programDetailNotifiable showProgramDetailWithExericise:[self.programDataSource.program exerciseAtIndex:indexPath.row]];
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
